package com.esms.model.quote

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.party.Organization
import com.esms.model.product.Product

class QuoteController {

	static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: ['GET', 'POST']]

	def filterPaneService

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
		
		[quoteInstanceList: Quote.list(params), quoteInstanceTotal: Quote.count()]
	}

	def filter = {
		if(!params.offset) {
			params.offset= 0
		} 
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		render( view:'list', model:[ quoteInstanceList: filterPaneService.filter( params, Quote),
			quoteInstanceTotal: filterPaneService.count( params, Quote), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}

	def create() {
		switch (request.method) {
			case 'GET':
				def list = Quote.list();
				int no = (list?list.size():0) + 1;
				String quoteNumber = "QUO" + String.format("%05d", no)

				params.quoteNumber = quoteNumber
				params.status = 'PENDING'
				
				if(params.organizationId) {
					def organization = Organization.get(params.organizationId?.toInteger())
					
					if(organization) {
						params.assignedTo = organization?.assignedTo
						params.'organization.id' = organization?.id
						
						if(organization?.liftInfo?.typeOfEnquiry == 'REPAIR') {
							params.type = "REPAIR"
						}
						
						//
						params.relatedTo = 'CONTRACT CUSTOMER'
						params.relatedToValue = organization?.externalId
						
						if(!organization?.contacts?.isEmpty()) {
							def contact = organization?.contacts.first()
							params.contactName = contact?.firstName
						}
					}
				}
				
				def quote = new Quote(params)
				
				if(params.contractQuote) {
					int lineNo = 1
					if(quote.type == "CONTRACT") {
						def products = Product.findAllByProductTypeAndServiceContract("SERVICE",true)
						if(products) {
							def unitPrice = new BigDecimal("0.0")
							def tax = new BigDecimal("0.0")
							def discount = new BigDecimal("0.0")
							def lineTotalAmount = new BigDecimal("0.0")

							quote.quoteItems = new ArrayList<QuoteItem>()
							products?.each {
								def quoteItemInstance = new QuoteItem()
								quoteItemInstance.quantity = 1.0
								quoteItemInstance.productNumber = it.productNumber
								quoteItemInstance.lineNumber  = lineNo

								quoteItemInstance.tax = 0.0
								quoteItemInstance.discount = 0.0

								it?.prices?.each { price ->
									quoteItemInstance.unitPrice = price.price
								}

								quoteItemInstance.lineTotalAmount = quoteItemInstance.unitPrice
								quoteItemInstance.quote = quote

								unitPrice += quoteItemInstance.unitPrice
								tax +=  quoteItemInstance.tax
								discount +=  quoteItemInstance.discount
								lineTotalAmount +=  quoteItemInstance.lineTotalAmount

								quote.quoteItems.add(quoteItemInstance)
								
								lineNo++;
							}

							BigDecimal totalDiscount = new BigDecimal("0.0")
							BigDecimal grandTotal = new BigDecimal("0.0")

							quote.totalAmount = unitPrice
							quote.totalTax = tax
							quote.totalDiscount = discount
							quote.grandTotal = lineTotalAmount

							//Initialize the Quoted and the Negotiated Total to the Grand Total.
							quote.quotedGrandTotal = lineTotalAmount
							quote.negotiatedGrandTotal = 0
						}
					}
				}
				
				[quoteInstance: quote,quoteLinesTotal:quote?.quoteItems?.size()]
				break
			case 'POST':
				def quoteInstance = new Quote(params)

				if (!quoteInstance.save(flush: true)) {
					render view: 'create', model: [quoteInstance: quoteInstance]
					return
				}
				
				int quoteLinesTotal = params.quoteLinesTotal?params.quoteLinesTotal.toInteger():0
				
				quoteInstance.quoteItems = []
				
				def quoteItem
				for(int i = 0; i < quoteLinesTotal;i++) {
					quoteItem = new QuoteItem()
					bindData(quoteItem, params["quoteItem["+i+"]"])
					quoteItem.quote = quoteInstance
					quoteInstance.addToQuoteItems(quoteItem)
					quoteItem.save(flush:true)
				}
				
				def unitPrice = new BigDecimal("0.0")
				def tax = new BigDecimal("0.0")
				def discount = new BigDecimal("0.0")
				def lineTotalAmount = new BigDecimal("0.0")

				quoteInstance?.quoteItems?.each { it ->
					unitPrice += it.unitPrice
					tax +=  it.tax
					discount +=  it.discount
					lineTotalAmount +=  it.lineTotalAmount
				}

				BigDecimal totalDiscount = new BigDecimal("0.0")
				BigDecimal grandTotal = new BigDecimal("0.0")

				quoteInstance.totalAmount = unitPrice
				quoteInstance.totalTax = tax
				quoteInstance.totalDiscount = discount
				
				quoteInstance.grandTotal = lineTotalAmount
				
				//Initialize the Quoted and the Negotiated Total to the Grand Total.
				quoteInstance.quotedGrandTotal = lineTotalAmount
				quoteInstance.negotiatedGrandTotal = 0
				
				quoteInstance.save(flush:true)
				flash.message = "New Quote Created."
				redirect action: 'show', id: quoteInstance.id
				break
		}
	}
	
	def confirmSale = {
		def quoteInstance = Quote.get(params.id)
		quoteInstance.negotiatedGrandTotal = quoteInstance?.quotedGrandTotal
		[quoteInstance : quoteInstance]
	}

	def markAsSent = {
		switch (request.method) {
			case 'GET':
				def quoteInstance = Quote.get(params.id)
				[quoteInstance : quoteInstance]
				break
			case 'POST' :
				def quoteInstance = Quote.get(params.id)
				quoteInstance.recepientContactName = params.recepientContactName
				quoteInstance.recepientContactNumber = params.recepientContactNumber
				quoteInstance.receivedDateTime = params.receivedDateTime
				quoteInstance.handedOveryBy = params.handedOveryBy
				quoteInstance.sent = true
				quoteInstance.save(flush:true)

				flash.message = 'Marked as Sent'
				redirect action: 'show', id: quoteInstance.id
				break
		}
	}

	def markAsAccepted = {
		switch (request.method) {
			case 'GET':
				def quoteInstance = Quote.get(params.id)
				if(quoteInstance.type == 'CONTRACT') {
					def serviceQuoteItems = quoteInstance.fetchServiceQuoteItems()
					def serviceQuoteListItems = [:]
					serviceQuoteItems?.each {
						def pn = it.productNumber
						def product = Product.findByProductNumber(pn)
						serviceQuoteListItems.put(product?.productNumber, product?.productName)
					}
					
					def fromCal = Calendar.instance
					
					def endCal = Calendar.instance
					int d = endCal.get(Calendar.DATE)
					int y = endCal.get(Calendar.YEAR)
					endCal.set Calendar.DATE, d
					endCal.set Calendar.YEAR, (y+1)
					def newEndDate = endCal.getTime().minus(1)
					
					quoteInstance.contractFromDate = fromCal.getTime()
					quoteInstance.contractToDate = newEndDate
					
					def model = [quoteInstance:quoteInstance,serviceQuoteListItems:serviceQuoteListItems]
					render(view:"/quote/markAsAccepted",model:model)
					return
				} else {
					quoteInstance.status = 'ACCEPT'
					quoteInstance.save(flush:true)
					flash.message = 'Marked as Accepted'
					redirect action: 'show', id: quoteInstance.id
					break
				}
			case 'POST' :
				def quoteInstance = Quote.get(params.id)
				if(quoteInstance.type == 'CONTRACT') {
					quoteInstance.contractFromDate = params.contractFromDate
					quoteInstance.contractToDate = params.contractToDate
					
					def selectedService = params.selectedService
				
					def unitPrice = new BigDecimal("0.0")
					def tax = new BigDecimal("0.0")
					def discount = new BigDecimal("0.0")
					def lineTotalAmount = new BigDecimal("0.0")
					
					
					QuoteItem.executeUpdate("Delete QuoteItem b where b.productNumber NOT LIKE ?",
						[selectedService])
					quoteInstance = Quote.get(params.id)
					
					quoteInstance?.quoteItems?.each {
						unitPrice += it.unitPrice
						tax +=  it.tax
						discount +=  it.discount
						lineTotalAmount +=  it.lineTotalAmount
					}
					
					BigDecimal totalDiscount = new BigDecimal("0.0")
					BigDecimal grandTotal = new BigDecimal("0.0")
					
					quoteInstance.totalAmount = unitPrice
					quoteInstance.totalTax = tax
					quoteInstance.totalDiscount = discount
					quoteInstance.grandTotal = lineTotalAmount
					
					if(quoteInstance.status == "PENDING" /*&& quoteInstance.sent*/) {
						quoteInstance.quotedGrandTotal = quoteInstance.grandTotal
					}
				 }

				quoteInstance.status = 'ACCEPT'
				quoteInstance.save(flush:true)
				flash.message = 'Marked as Accepted'
				redirect action: 'show', id: quoteInstance.id
				break
		}
	}

	def markAsRevised = {
		switch (request.method) {
			case 'GET':
				def quoteInstance = Quote.get(params.id)
				[quoteInstance : quoteInstance]
				break
			case 'POST' :
				def quoteInstance = Quote.get(params.id)
				quoteInstance.status = 'REVISE'
				quoteInstance.revisedReason = params.revisedReason
				quoteInstance.save(flush:true)

				flash.message = 'Marked as Revised'
				redirect action: 'show', id: quoteInstance.id
				break
		}
	}

	def markAsDeclined = {
		switch (request.method) {
			case 'GET':
				def quoteInstance = Quote.get(params.id)
				[quoteInstance : quoteInstance]
				break
			case 'POST' :
				def quoteInstance = Quote.get(params.id)
				quoteInstance.status = 'DECLINE'
				quoteInstance.declinedReason = params.declinedReason
				quoteInstance.save(flush:true)

				flash.message = 'Marked as Declined'
				redirect action: 'show', id: quoteInstance.id
				break
		}
	}

	def convertToSalesOrder = {
		def quoteInstance = Quote.get(params.id)

		quoteInstance.negotiatedGrandTotal = params.negotiatedGrandTotal?.toBigDecimal()
		
		def diff = quoteInstance.quotedGrandTotal - quoteInstance.negotiatedGrandTotal
		//quoteInstance.adjustment = diff
		
		quoteInstance.grandTotal = quoteInstance.negotiatedGrandTotal
		
		//'CONVERTED_TO_SERVICE_CONTRACT','CONVERTED_TO_SALES_ORDER'
		if(quoteInstance.type == 'CONTRACT') {
			quoteInstance.status = 'CONVERTED_TO_SERVICE_CONTRACT'
			quoteInstance.adjustment = 0.0
			
			//Works with only order items --> Service Contract and Repair Order
			/*quoteInstance.quoteItems?.each {
				it.discount += diff
				it.save(flush:true)
			}*/
			
		} else {
			quoteInstance.status = 'CONVERTED_TO_SALES_ORDER'
			quoteInstance.adjustment = 0.0
			//Works with only order items --> Service Contract and Repair Order
			/*quoteInstance.quoteItems?.each {
				it.discount += diff
				it.save(flush:true)
			}*/
		}
		
		//
		if(diff > 0) {
			def product = Product.getDiscountProduct()
			def quoteItemInstance = new QuoteItem()
			quoteItemInstance.quote = quoteInstance
			quoteItemInstance.lineNumber = quoteInstance?.quoteItems?quoteInstance?.quoteItems.size()+1:1
			quoteItemInstance.quantity = 1
			quoteItemInstance.unitPrice = -diff
			quoteItemInstance.discount = 0
			quoteItemInstance.lineTotalAmount = quoteItemInstance.unitPrice
			quoteItemInstance.productNumber = product.productNumber
			quoteItemInstance.save(flush: true)
			
			def quoteItems = quoteInstance.quoteItems
			def unitPrice = new BigDecimal("0.0")
			def tax = new BigDecimal("0.0")
			def discount = new BigDecimal("0.0")
			def lineTotalAmount = new BigDecimal("0.0")
			
			quoteItems?.each { q ->
				unitPrice += q.unitPrice
				tax +=  q.tax
				discount +=  q.discount
				lineTotalAmount +=  q.lineTotalAmount
			}
			
			BigDecimal totalDiscount = new BigDecimal("0.0")
			BigDecimal grandTotal = new BigDecimal("0.0")
			
			quoteInstance.totalAmount = unitPrice
			quoteInstance.totalTax = tax
			quoteInstance.totalDiscount = discount
			quoteInstance.grandTotal = lineTotalAmount
							
			//Initialize the Quoted and the Negotiated Total to the Grand Total.
			quoteInstance.quotedGrandTotal = lineTotalAmount
			quoteInstance.negotiatedGrandTotal = 0
							
			quoteInstance.save(flush:true)
			//
			
			quoteInstance.notes = params.notes
			quoteInstance.save(flush:true)
		}

		flash.message = 'Sales Order created.'
		redirect controller:'order', action: 'convertQuoteToOrder',params:[id : quoteInstance?.id]
	}

	def show() {
		def quoteInstance = Quote.get(params.id)
		if (!quoteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'quote.label', default: 'Quote'),
				params.id
			])
			redirect action: 'list'
			return
		}

		[quoteInstance: quoteInstance]
	}

	def edit() {
		switch (request.method) {
			case 'GET':
				def quoteInstance = Quote.get(params.id)
				if (!quoteInstance) {
					flash.message = message(code: 'default.not.found.message', args: [
						message(code: 'quote.label', default: 'Quote'),
						params.id
					])
					redirect action: 'list'
					return
				}

				[quoteInstance: quoteInstance]
				break
			case 'POST':
				def quoteInstance = Quote.get(params.id)
				if (!quoteInstance) {
					flash.message = message(code: 'default.not.found.message', args: [
						message(code: 'quote.label', default: 'Quote'),
						params.id
					])
					redirect action: 'list'
					return
				}

				if (params.version) {
					def version = params.version.toLong()
					if (quoteInstance.version > version) {
						quoteInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
								[
									message(code: 'quote.label', default: 'Quote')] as Object[],
								"Another user has updated this Quote while you were editing")
						render view: 'edit', model: [quoteInstance: quoteInstance]
						return
					}
				}

				quoteInstance.properties = params

				if (!quoteInstance.save(flush: true)) {
					render view: 'edit', model: [quoteInstance: quoteInstance]
					return
				}

				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'quote.label', default: 'Quote'),
					quoteInstance.id
				])
				redirect action: 'show', id: quoteInstance.id
				break
		}
	}

	def delete() {
		def quoteInstance = Quote.get(params.id)
		if (!quoteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'quote.label', default: 'Quote'),
				params.id
			])
			redirect action: 'list'
			return
		}

		try {
			quoteInstance.delete(flush: true)


			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'quote.label', default: 'Quote'),
				params.id
			])
			redirect action: 'list'
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'quote.label', default: 'Quote'),
				params.id
			])
			redirect action: 'show', id: params.id
		}
	}

	def createQuoteItem() {
		switch (request.method) {
			case 'GET':
				def quote = Quote.get(params.quoteId)

				def c = QuoteItem.createCriteria()
				def maxLineNumber = c.get {
					eq("quote", quote)
					projections { max ("lineNumber") }
				}
				params.lineNumber = (maxLineNumber?maxLineNumber:0) + 1
				[quoteItemInstance: new QuoteItem(params)]
				break
			case 'POST':
				def quoteItemInstance = new QuoteItem(params)

				if (!quoteItemInstance.save(flush: true)) {
					render view: 'create', model: [quoteItemInstance: quoteItemInstance]
					return
				}

				def quote = quoteItemInstance.quote
				def quoteItems = quote.quoteItems

				def unitPrice = new BigDecimal("0.0")
				def tax = new BigDecimal("0.0")
				def discount = new BigDecimal("0.0")
				def lineTotalAmount = new BigDecimal("0.0")

				quoteItems?.each { it ->
					unitPrice += it.unitPrice
					tax +=  it.tax
					discount +=  it.discount
					lineTotalAmount +=  it.lineTotalAmount
				}

				BigDecimal totalDiscount = new BigDecimal("0.0")
				BigDecimal grandTotal = new BigDecimal("0.0")

				quote.totalAmount = unitPrice
				quote.totalTax = tax
				quote.totalDiscount = discount
				
				quote.grandTotal = lineTotalAmount
				
				//Initialize the Quoted and the Negotiated Total to the Grand Total.
				quote.quotedGrandTotal = lineTotalAmount
				quote.negotiatedGrandTotal = 0
				
				quote.save(flush:true)

				flash.message = "Added New Line Item : " + Product.findByProductNumber(quoteItemInstance.productNumber)?.productName;
				redirect action: 'show', id: quoteItemInstance.quote.id
				break
		}
	}
	
	def deleteQuoteItem() {
		def quoteItemInstance = QuoteItem.get(params.id)
		if (!quoteItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), params.id])
			redirect action: 'list'
			return
		}

		try {
			quoteItemInstance.delete(flush: true)
			
			def quote = quoteItemInstance.quote
			def quoteItems = quote.quoteItems
			
			def unitPrice = new BigDecimal("0.0")
			def tax = new BigDecimal("0.0")
			def discount = new BigDecimal("0.0")
			def lineTotalAmount = new BigDecimal("0.0")
			
			quoteItems?.each { it ->
				unitPrice += it.unitPrice
				tax +=  it.tax
				discount +=  it.discount
				lineTotalAmount +=  it.lineTotalAmount
			}
			
			BigDecimal totalDiscount = new BigDecimal("0.0")
			BigDecimal grandTotal = new BigDecimal("0.0")
			
			quote.totalAmount = unitPrice
			quote.totalTax = tax
			quote.totalDiscount = discount
			quote.grandTotal = lineTotalAmount
			
			if(quote.status == "PENDING" && quote.sent) {
				quote.quotedGrandTotal = quote.grandTotal
			}
			
			quote.save(flush:true)
			
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), params.id])
			redirect controller:'quote' , action: 'show', params:[id:quote.id]
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), params.id])
			redirect controller:'quote' , action: 'show', params:[id:quote.id]
		}
	}
	
	def markAsDisqualified = {
		switch (request.method) {
			case 'GET':
				def quoteInstance = Quote.get(params.id)
				[quoteInstance : quoteInstance]
				break
			case 'POST' :
				def quoteInstance = Quote.get(params.id)
				quoteInstance.status = 'DISQUALIFIED'
				quoteInstance.markAsDisqualified = params.markAsDisqualified
				quoteInstance.save(flush:true)

				flash.message = 'Marked as Disqualified.'
				redirect action: 'show', id: quoteInstance.id
				break
		}
	}
}
