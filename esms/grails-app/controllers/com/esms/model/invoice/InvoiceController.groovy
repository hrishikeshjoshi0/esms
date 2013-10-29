package com.esms.model.invoice

import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.calendar.Task
import com.esms.model.order.Order

class InvoiceController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [invoiceInstanceList: Invoice.list(params), invoiceInstanceTotal: Invoice.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
			def invoiceInstance
			def order
			if(!chainModel.invoiceInstance) {
				invoiceInstance = new Invoice(params)
			} else {
				invoiceInstance = chainModel.invoiceInstance
				order = chainModel.order
			}
        	[invoiceInstance: invoiceInstance,order:order]
			break
		case 'POST':
	        def invoiceInstance = new Invoice(params)
	        if (!invoiceInstance.save(flush: true)) {
	            render view: 'create', model: [invoiceInstance: invoiceInstance]
	            return
	        }
			
			int invoiceLinesTotal = params.invoiceLinesTotal?params.invoiceLinesTotal.toInteger():0
			
			invoiceInstance.invoiceLines = []
			
			def invoiceLine
			for(int i = 0; i < invoiceLinesTotal;i++) {
				invoiceLine = new InvoiceLine()
				bindData(invoiceLine, params["invoice["+i+"]"])
				invoiceLine.invoice = invoiceInstance
				invoiceInstance.addToInvoiceLines(invoiceLine)
				invoiceLine.save(flush:true)
			}
			
			def unitPrice = new BigDecimal("0.0")
			def tax = new BigDecimal("0.0")
			def discount = new BigDecimal("0.0")
			def lineTotalAmount = new BigDecimal("0.0")
			def amountInvoiced = new BigDecimal("0.0")
			
			invoiceInstance?.invoiceLines?.each { it ->
				unitPrice += it.unitPrice
				tax +=  it.tax
				discount +=  it.discount
				lineTotalAmount +=  it.lineTotalAmount
				amountInvoiced += it.amountInvoiced
			}

			BigDecimal totalDiscount = new BigDecimal("0.0")
			BigDecimal grandTotal = new BigDecimal("0.0")

			invoiceInstance.totalAmount = amountInvoiced
			invoiceInstance.totalTax = tax
			invoiceInstance.totalDiscount = discount
			invoiceInstance.grandTotal = amountInvoiced - invoiceInstance.adjustment
			invoiceInstance.save(flush:true)
			
			invoiceInstance.openGrandTotal = invoiceInstance.grandTotal
			invoiceInstance.receviedGrandTotal = 0.0
			invoiceInstance.referenceOrderNumber = params.referenceOrderNumber
			
			invoiceInstance.save(flush:true)
			
			def order = Order.findByOrderNumber(params.referenceOrderNumber)
			if(order) {
				order.invoicedGrandTotal += invoiceInstance.grandTotal
				order.pendingInvoiceGrandTotal -= invoiceInstance.grandTotal
				order.save(flush:true)
				
				//
				invoiceInstance?.invoiceLines?.each { iit ->
					order.orderItems?.each { oit ->
						if(oit.productNumber == iit.productNumber) {
							oit.percentageInvoiced = iit.percentageInvoiced
							oit.amountInvoiced = iit.amountInvoiced
							oit.save(flush:true)
						}
					}
				}
			}
			
			//Raise Task
			if(invoiceInstance.expiryDate) {
				def taskInstance = new Task()
				taskInstance.taskName = 'REMINDER TASK FOR INVOICE: ' + invoiceInstance.invoiceNumber
				def taskDescription = 'This is a reminder for the invoice to be raised for the Order ' + order.orderNumber + '.\n'
				taskDescription += 'The pending amount is ' +  order.pendingInvoiceGrandTotal + '.\n'
				taskInstance.taskDescription = taskDescription
				taskInstance.dateTime = invoiceInstance.expiryDate
				taskInstance.dueDateTime = invoiceInstance.expiryDate
				taskInstance.relatedTo = 'INVOICE'
				taskInstance.relatedToValue = invoiceInstance.invoiceNumber
				taskInstance.status = 'NOT_STARTED'
				taskInstance.priority = 'MEDIUM'
				taskInstance.notification = true
				taskInstance.save(flush:true)
			}

			flash.message = "New Invoice Created."
	        redirect action: 'show', id: invoiceInstance.id
			break
		}
    }

    def show() {
        def invoiceInstance = Invoice.get(params.id)
        if (!invoiceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])
            redirect action: 'list'
            return
        }

        [invoiceInstance: invoiceInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def invoiceInstance = Invoice.get(params.id)
	        if (!invoiceInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [invoiceInstance: invoiceInstance]
			break
		case 'POST':
	        def invoiceInstance = Invoice.get(params.id)
	        if (!invoiceInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (invoiceInstance.version > version) {
	                invoiceInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'invoice.label', default: 'Invoice')] as Object[],
	                          "Another user has updated this Invoice while you were editing")
	                render view: 'edit', model: [invoiceInstance: invoiceInstance]
	                return
	            }
	        }

	        invoiceInstance.properties = params

	        if (!invoiceInstance.save(flush: true)) {
	            render view: 'edit', model: [invoiceInstance: invoiceInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'invoice.label', default: 'Invoice'), invoiceInstance.id])
	        redirect action: 'show', id: invoiceInstance.id
			break
		}
    }

    def delete() {
        def invoiceInstance = Invoice.get(params.id)
        if (!invoiceInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])
            redirect action: 'list'
            return
        }

        try {
            invoiceInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
