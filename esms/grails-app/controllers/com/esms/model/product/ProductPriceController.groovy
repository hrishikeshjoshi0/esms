package com.esms.model.product

import org.springframework.dao.DataIntegrityViolationException

class ProductPriceController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productPriceInstanceList: ProductPrice.list(params), productPriceInstanceTotal: ProductPrice.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[productPriceInstance: new ProductPrice(params)]
			break
		case 'POST':
	        def productPriceInstance = new ProductPrice(params)
	        if (!productPriceInstance.save(flush: true)) {
	            render view: 'create', model: [productPriceInstance: productPriceInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), productPriceInstance.id])
	        redirect action: 'show', id: productPriceInstance.id
			break
		}
    }

    def show() {
        def productPriceInstance = ProductPrice.get(params.id)
        if (!productPriceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect action: 'list'
            return
        }

        [productPriceInstance: productPriceInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def productPriceInstance = ProductPrice.get(params.id)
	        if (!productPriceInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [productPriceInstance: productPriceInstance]
			break
		case 'POST':
	        def productPriceInstance = ProductPrice.get(params.id)
	        if (!productPriceInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (productPriceInstance.version > version) {
	                productPriceInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'productPrice.label', default: 'ProductPrice')] as Object[],
	                          "Another user has updated this ProductPrice while you were editing")
	                render view: 'edit', model: [productPriceInstance: productPriceInstance]
	                return
	            }
	        }

	        productPriceInstance.properties = params

	        if (!productPriceInstance.save(flush: true)) {
	            render view: 'edit', model: [productPriceInstance: productPriceInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), productPriceInstance.id])
	        redirect action: 'show', id: productPriceInstance.id
			break
		}
    }

    def delete() {
        def productPriceInstance = ProductPrice.get(params.id)
        if (!productPriceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect action: 'list'
            return
        }

        try {
            productPriceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productPrice.label', default: 'ProductPrice'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
