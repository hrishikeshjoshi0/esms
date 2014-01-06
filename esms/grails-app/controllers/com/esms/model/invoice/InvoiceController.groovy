package com.esms.model.invoice

import grails.converters.JSON

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.calendar.Task
import com.esms.model.order.Order

class InvoiceController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	def filterPaneService
	
	def utilService
	
    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = 'status'
		params.'order' = "desc"
        [invoiceInstanceList: Invoice.list(params), invoiceInstanceTotal: Invoice.count()]
    }
	
	def filter = {
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		render( view:'list', model:[ invoiceInstanceList: filterPaneService.filter( params, Invoice),
			invoiceInstanceTotal: filterPaneService.count( params, Invoice), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}

    def create() {
		switch (request.method) {
		case 'GET':
			def invoiceInstance
			def order
			def openOrders
			if(chainModel?.invoiceInstance) {
				invoiceInstance = chainModel.invoiceInstance
				order = chainModel.order
			} else {
				def list = Invoice.list();
				int no = (list?list.size():0) + 1;
				params.invoiceNumber = "-Auto Gen-"
				invoiceInstance = new Invoice(params)
				openOrders = Order.withCriteria() {
					gt("pendingInvoiceGrandTotal",0.0)
				}
			}
        	[invoiceInstance: invoiceInstance,order:order,openOrders:openOrders]
			break
		case 'POST':
	        def invoiceInstance = new Invoice(params)
			invoiceInstance.invoiceNumber = utilService.newInvoiceNumber()
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
							oit.amountInvoiced += iit.amountInvoiced
							oit.percentageInvoiced = (oit.amountInvoiced/oit.lineTotalAmount)*100
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
				taskInstance.relatedTo = 'ORDER'
				taskInstance.relatedToValue = order.orderNumber
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
        def invoiceInstance = Invoice.get(params.id?.toLong())
		if(request.xhr) {
			render invoiceInstance as JSON
		} else {
			if (!invoiceInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'invoice.label', default: 'Invoice'), params.id])
						redirect action: 'list'
							return
			}
			
			[invoiceInstance: invoiceInstance]
		}
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

	def addInvoiceLine() {
		def order = Order.get(params.id?.toInteger())
		def lineNumber = 1
		def invoiceLines = []
		order.orderItems?.each {
			def invoiceLine = new InvoiceLine()
			invoiceLine.lineNumber = (lineNumber++)
			invoiceLine.quantity = it.quantity

			invoiceLine.unitPrice = it.unitPrice
			invoiceLine.tax = it.tax
			invoiceLine.lineTotalAmount = it.lineTotalAmount
			invoiceLine.discount = it.discount
			invoiceLine.productNumber = it.productNumber
			invoiceLine.relatedOrderNumber = it.relatedOrderNumber
			invoiceLine.percentageInvoiced = 100.0 - it.percentageInvoiced
			invoiceLine.amountInvoiced = it.lineTotalAmount - it.amountInvoiced

			invoiceLines.add(invoiceLine)
		}
		
		render(view: "addInvoiceLine", model: [invoiceLines:invoiceLines])
	}
	
	def fillInvoiceForm = {
		if(!params.id) {
			return
		}
		def order = Order.get(params.id)
		order.status = "INVOICED"
		//order.openGrandTotal = order.grandTotal
		order.receviedGrandTotal = new BigDecimal("0.0")
		if(!order.adjustment) {
			order.adjustment = new BigDecimal("0.0")
		}

		//Create Invoice -- Start
		def invoice = new Invoice()
		def list = Invoice.list();
		int no = (list?list.size():0) + 1;
		String invoiceNumber = "INV" + String.format("%05d", no)

		invoice.invoiceNumber = invoiceNumber
		invoice.contactName = order.contactName
		invoice.status = "CREATED"

		invoice.relatedTo = "ORDER"
		invoice.relatedToValue = order.orderNumber

		invoice.assignedTo = order.assignedTo
		invoice.termsAndConditions = order.termsAndConditions

		invoice.contractFromDate = order.contractFromDate
		invoice.contractToDate = order.contractToDate
		invoice.type = order.type
		
		invoice.totalAmount = order.totalAmount + order.totalTax - order.totalDiscount - order.adjustment - order.invoicedGrandTotal//Doesnt include negotitation discount,
		invoice.totalTax = 0.0
		invoice.totalDiscount = 0.0
		invoice.adjustment = 0.0
		invoice.grandTotal = invoice.totalAmount
		invoice.referenceOrderNumber = order.orderNumber

		invoice.organization = order.organization
		int lineNumber = 1;

		def invoiceLines = []

		order.orderItems?.each {
			if(it.amountInvoiced != it.lineTotalAmount) {
				def invoiceLine = new InvoiceLine()
				invoiceLine.lineNumber = (lineNumber++)
				invoiceLine.quantity = it.quantity
				
				invoiceLine.unitPrice = it.unitPrice
				invoiceLine.tax = it.tax
				invoiceLine.lineTotalAmount = it.lineTotalAmount
				invoiceLine.discount = it.discount
				invoiceLine.productNumber = it.productNumber
				invoiceLine.relatedOrderNumber = it.relatedOrderNumber
				invoiceLine.percentageInvoiced = 100.0 - it.percentageInvoiced
				invoiceLine.amountInvoiced = it.lineTotalAmount - it.amountInvoiced
				
				invoiceLines.add(invoiceLine)
			}
		}

		invoice?.invoiceLines = invoiceLines

		render(template: "formTemplate", model: [invoiceInstance:invoice])
	}
}
