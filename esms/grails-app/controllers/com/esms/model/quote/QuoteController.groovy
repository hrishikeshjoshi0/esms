package com.esms.model.quote

import org.springframework.dao.DataIntegrityViolationException
import com.esms.model.party.Organization

class QuoteController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [quoteInstanceList: Quote.list(params), quoteInstanceTotal: Quote.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
		
			def list = Quote.list();
			int no = (list?list.size():0) + 1;
			String quoteNumber = "QUO" + String.format("%05d", no)
		
			params.quoteNumber = quoteNumber
			params.status = 'PENDING'
			if(params.contractQuote) {
				params.type = "CONTRACT"
				params.relatedTo = 'CONTRACT'
			}
        	[quoteInstance: new Quote(params)]
			break
		case 'POST':
	        def quoteInstance = new Quote(params)
			
	        if (!quoteInstance.save(flush: true)) {
	            render view: 'create', model: [quoteInstance: quoteInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'quote.label', default: 'Quote'), quoteInstance.id])
	        redirect action: 'show', id: quoteInstance.id
			break
		}
    }
	
	def markAsSent = {
		def quoteInstance = Quote.get(params.id)
		quoteInstance.sent = true
		quoteInstance.save(flush:true)
		
		flash.message = 'Marked as Sent'
		redirect action: 'show', id: quoteInstance.id
	}
	
	def markAsAccepted = {
		def quoteInstance = Quote.get(params.id)
		quoteInstance.status = 'ACCEPT'
		quoteInstance.save(flush:true)
		
		flash.message = 'Marked as Accepted'
		redirect action: 'show', id: quoteInstance.id
	}
	
	def markAsRevised = {
		def quoteInstance = Quote.get(params.id)
		quoteInstance.status = 'REVISE'
		quoteInstance.save(flush:true)
		
		flash.message = 'Marked as Revised'
		redirect action: 'show', id: quoteInstance.id
	}
	
	def markAsDeclined = {
		def quoteInstance = Quote.get(params.id)
		quoteInstance.status = 'DECLINE'
		quoteInstance.save(flush:true)
		
		flash.message = 'Marked as Declined'
		redirect action: 'show', id: quoteInstance.id
	}
	
	def convertToSalesOrder = {
		def quoteInstance = Quote.get(params.id)
		
		flash.message = 'Sales Order created.'
		redirect controller:'order', action: 'create'
	}

    def show() {
        def quoteInstance = Quote.get(params.id)
        if (!quoteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'quote.label', default: 'Quote'), params.id])
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
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'quote.label', default: 'Quote'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [quoteInstance: quoteInstance]
			break
		case 'POST':
	        def quoteInstance = Quote.get(params.id)
	        if (!quoteInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'quote.label', default: 'Quote'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (quoteInstance.version > version) {
	                quoteInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'quote.label', default: 'Quote')] as Object[],
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

			flash.message = message(code: 'default.updated.message', args: [message(code: 'quote.label', default: 'Quote'), quoteInstance.id])
	        redirect action: 'show', id: quoteInstance.id
			break
		}
    }

    def delete() {
        def quoteInstance = Quote.get(params.id)
        if (!quoteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'quote.label', default: 'Quote'), params.id])
            redirect action: 'list'
            return
        }

        try {
            quoteInstance.delete(flush: true)
			
			
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'quote.label', default: 'Quote'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'quote.label', default: 'Quote'), params.id])
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
				projections {
					max ("lineNumber")
				}
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
			quote.save(flush:true)
			
			flash.message = message(code: 'default.created.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), quoteItemInstance.id])
			redirect action: 'show', id: quoteItemInstance.quote.id
			break
		}
	}
}
