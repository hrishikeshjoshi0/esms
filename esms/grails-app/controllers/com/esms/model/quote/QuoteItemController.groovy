package com.esms.model.quote

import org.springframework.dao.DataIntegrityViolationException

class QuoteItemController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [quoteItemInstanceList: QuoteItem.list(params), quoteItemInstanceTotal: QuoteItem.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[quoteItemInstance: new QuoteItem(params)]
			break
		case 'POST':
	        def quoteItemInstance = new QuoteItem(params)
			quoteItemInstance.lineTotalAmount = (quoteItemInstance.unitPrice * quoteItemInstance.quantity) + quoteItemInstance.tax - quoteItemInstance.discount  
			
	        if (!quoteItemInstance.save(flush: true)) {
	            render view: 'create', model: [quoteItemInstance: quoteItemInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), quoteItemInstance.id])
	        redirect action: 'show', id: quoteItemInstance.id
			break
		}
    }

    def show() {
        def quoteItemInstance = QuoteItem.get(params.id)
        if (!quoteItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), params.id])
            redirect action: 'list'
            return
        }

        [quoteItemInstance: quoteItemInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def quoteItemInstance = QuoteItem.get(params.id)
	        if (!quoteItemInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [quoteItemInstance: quoteItemInstance]
			break
		case 'POST':
	        def quoteItemInstance = QuoteItem.get(params.id)
	        if (!quoteItemInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (quoteItemInstance.version > version) {
	                quoteItemInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'quoteItem.label', default: 'QuoteItem')] as Object[],
	                          "Another user has updated this QuoteItem while you were editing")
	                render view: 'edit', model: [quoteItemInstance: quoteItemInstance]
	                return
	            }
	        }

	        quoteItemInstance.properties = params

	        if (!quoteItemInstance.save(flush: true)) {
	            render view: 'edit', model: [quoteItemInstance: quoteItemInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), quoteItemInstance.id])
	        redirect action: 'show', id: quoteItemInstance.id
			break
		}
    }

    def delete() {
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
			quote.save(flush:true)
			
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), params.id])
            redirect controller:'quote' , action: 'list', params:[id:quote.id]
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
