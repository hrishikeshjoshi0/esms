package com.esms.model.product
import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.order.OrderItem;
import com.esms.model.quote.QuoteItem;

class ProductController {

	static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: ['GET', 'POST']]
	
	def filterPaneService
	
	def productService
	
	def utilService

	def index() {
		redirect action: 'list', params: params
	}
	
	def list() {
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		[productInstanceList: Product.list(params), productInstanceTotal: Product.count()]
	}

	def filter = {
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		render( view:'list', model:[ productInstanceList: filterPaneService.filter( params, Product),
			productInstanceCount: filterPaneService.count( params, Product), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}

	def create() {
		switch (request.method) {
		case 'GET':
			def productInstance = productService.createNewProduct(params)
			[productInstance: productInstance]
			break
		case 'POST':
			def productInstance = new Product(params)
			productService.saveOrUpdateProduct(productInstance)
		
			if (!productInstance.errors) {
				render view: 'create', model: [productInstance: productInstance]
				return
			}

			flash.message = "Product :" + productInstance.productName + " created."
			redirect action: 'show', id: productInstance.id
			break
		}
	}

	def show() {
		def productInstance = Product.get(params.id)
		if (!productInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
			redirect action: 'list'
			return
		}

		[productInstance: productInstance]
	}

	def edit() {
		switch (request.method) {
		case 'GET':
			def productInstance = Product.get(params.id)
			if (!productInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
				redirect action: 'list'
				return
			}

			[productInstance: productInstance]
			break
		case 'POST':
			def productInstance = Product.get(params.id)
			if (!productInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'product.label', default: 'Product'), params.id])
				redirect action: 'list'
				return
			}

			if (params.version) {
				def version = params.version.toLong()
				if (productInstance.version > version) {
					productInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
							  [message(code: 'product.label', default: 'Product')] as Object[],
							  "Another user has updated this Product while you were editing")
					render view: 'edit', model: [productInstance: productInstance]
					return
				}
			}

			productInstance.properties = params

			if (!productInstance.save(flush: true)) {
				render view: 'edit', model: [productInstance: productInstance]
				return
			}

			flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Product'), productInstance.id])
			redirect action: 'show', id: productInstance.id
			break
		}
	}

	def delete() {
		def productInstance = Product.get(params.id)
		
		boolean error = false;
		def messages = []
		
		if (!productInstance) {
			error = true
			messages.add("Record Not Found.")
		}
		
		def orderItems = OrderItem.countByProductNumber(productInstance?.productNumber)
		if(orderItems > 0) {
			error = true
			messages.add("There are order records having reference to this product.")
		}
		
		def quoteItems = QuoteItem.countByProductNumber(productInstance?.productNumber)
		if(quoteItems > 0) {
			error = true
			messages.add("There are quote records having reference to this product.")
		}
		
		if(error) {
			render(contentType: "text/json") {
				[
					error : true,
					level: "warning",
					messages : messages
				]
			}
			return
		}

		try {
			productInstance.delete(flush: true)
			messages << message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
			render(contentType: "text/json") {[
					error : false,
					level: "success",
					messages : messages,
					nextUrl : g.createLink(controller:'product',action: 'list')
			]}
		}catch (DataIntegrityViolationException e) {
			messages << message(code: 'default.not.deleted.message', args: [message(code: 'product.label', default: 'Product'), params.id])
			render(contentType: "text/json") {[
				error : false,
				level: "error",
				messages : messages,
				nextUrl : g.createLink(controller:'product',action: 'show',id:params.id)
			]}
		}
	}
	
	def createPrice() {
		switch (request.method) {
		case 'GET':
			def productInstance = Product.get(params.id)
			def s = new Date()
			params.toDate = new Date() + 365
			
			[productPriceInstance: new ProductPrice(params),productInstance:productInstance]
			break
		case 'POST':
			def productPriceInstance = new ProductPrice(params)
			def c = ProductPrice.createCriteria()
			def results = c.list {
				eq("product", productPriceInstance.product)
				and {
					ge("fromDate",productPriceInstance.fromDate)
					le("toDate",productPriceInstance.toDate)
				}
			}
			
			if(results) {
				flash.message = message(code: 'productPrice.overlap.message',
						args: [message(code: 'productPrice.label', default: 'Price'), productPriceInstance.id])
				redirect controller: "product", action: 'show', id: productPriceInstance.id
				return
			}
			
			if (!productPriceInstance.save(flush: true)) {
				render view: 'create', model: [productPriceInstance: productPriceInstance]
				return
			}

			flash.message = "Created New Price."
			redirect controller: "product", action: 'show', id: productPriceInstance?.product?.id
			break
		}
	}
	
	def editPrice() {
		switch (request.method) {
		case 'GET':
			def productPriceInstance = ProductPrice.get(params.id)
			[productPriceInstance: productPriceInstance]
			break
		case 'POST':
			def productPriceInstance = ProductPrice.get(params.id)
	        productPriceInstance.properties = params

	        if (!productPriceInstance.save(flush: true)) {
	            render view: 'edit', model: [productPriceInstance: productPriceInstance]
	            return
	        }

			flash.message = "Updated Price."
			redirect controller: "product", action: 'show', id: productPriceInstance?.product?.id
			break
		}
	}
	
	def searchAJAX = {
		def products = Product.findAllByProductNameLike("%${params.query}%")

		//Create XML response
		render(contentType: "text/xml") {
		results() {
				products.each { product ->
				result(){
					name(product.productName)
					//Optional id which will be available in onItemSelect
					id(product.id)
					unitPrice(100.0)
					}
				}
			}
		}
	}
	
	def getPrice = {
		def p = params
		def product = Product.findByProductNumber(params.id)
		def c = ProductPrice.createCriteria()
		def results = c.list {
			eq("product",product)
		}
		
		if(results && results.size() != 0) {
			def price = results?.get(0)
					
			if(price) {
				//Create XML response
				render(contentType: "text/xml") {
					result(){
						unitPrice(price.price)
						//Optional id which will be available in onItemSelect
						id(product.id)
					}
				}
			}
		} else {
			//Create XML response
			render(contentType: "text/xml") {
				result(){
					unitPrice(0.0)
				}
			}
		}
	}
}