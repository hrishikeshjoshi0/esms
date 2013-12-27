package com.esms.model.payment

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.invoice.Invoice
import com.esms.model.order.Order

class PaymentController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	
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
		
		params.sort = 'paymentNumber'
		params.'order' = 'desc'
		
		def paymentInstanceTotal = Payment.count()
		def paymentInstanceList = Payment.list(params)
		[paymentInstanceList: paymentInstanceList, paymentInstanceTotal: paymentInstanceTotal]
	}

	def filter = {
		if(!params.offset) {
			params.offset= 0
		} 
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		render( view:'list', model:[ paymentInstanceList: filterPaneService.filter( params, Payment), 
			paymentInstanceTotal: filterPaneService.count( params, Payment), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}
	
	def createPaymentItem() {
		switch (request.method) {
			case 'GET':
				def payment = Payment.get(params.paymentId)
				
				def c = PaymentItem.createCriteria()
				def maxLineNumber = c.get {
					eq("payment", payment)
					projections {
						max ("lineNumber")
					}
				}
				
				def pendingInvoices = Invoice.withCriteria() {
					gt("openGrandTotal",0.0)
				}
				
				params.lineNumber = (maxLineNumber?maxLineNumber:0) + 1
				[paymentItemInstance: new PaymentItem(params),pendingInvoices:pendingInvoices]
				break
			case 'POST':
				def paymentItemInstance = new PaymentItem(params)
				
				def matchedAmount = new BigDecimal("0.0")
				matchedAmount += paymentItemInstance.amount
				
				if (!paymentItemInstance.save(flush: true)) {
					return
				}
				
				def payment = paymentItemInstance.payment
				def paymentItems = payment.paymentItems
				
				def invoice = paymentItemInstance.invoice
				invoice.receviedGrandTotal += paymentItemInstance.amount
				invoice.openGrandTotal -= paymentItemInstance.amount
				
				if(invoice.openGrandTotal <= 0) {
					invoice.status = 'CLOSED'
				}
				
				invoice.save(flush:true)
				
				payment.balanceAmount = payment.balanceAmount - matchedAmount
				payment.matchedAmount += matchedAmount
				payment.save(flush:true)
				
				flash.message = "Added New Line."
				redirect action: 'show', id: payment.id
				break
			}
	}

    def create() {
		switch (request.method) {
		case 'GET':
			def list = Payment.list();
			int no = (list?list.size():0) + 1;
			params.paymentNumber = "PAY" + String.format("%05d", no)
			
			def invoice = null
			def pendingInvoices = null
			
			if(params.invoiceId) {
				invoice = Invoice.get(params.invoiceId)
				params."organization.id" = invoice?.organization?.id
				params.orderId = params.orderId
				params.invoiceId = params.invoiceId
				params.totalAmount = invoice?.openGrandTotal
				def order = Order.findByOrderNumber(invoice.referenceOrderNumber)
			} else {
				pendingInvoices = Invoice.withCriteria() {
					gt("openGrandTotal",0.0)
				}
			}
        	[paymentInstance: new Payment(params),invoice:invoice,pendingInvoices:pendingInvoices]
			break
		case 'POST':
	        def paymentInstance = new Payment(params)
			paymentInstance.balanceAmount = new BigDecimal("0.0")
			paymentInstance.matchedAmount = paymentInstance.totalAmount
			
			def invoice = Invoice.get(params.invoiceId?.toInteger())
			
			if(!paymentInstance.organization) {
				paymentInstance.organization = invoice?.organization
			}
			
			if (!paymentInstance.save(flush: true)) {
				render view: 'create', model: [paymentInstance: paymentInstance]
				return
			}
			
			//
			def c = PaymentItem.createCriteria()
			def maxLineNumber = c.get {
				eq("payment", paymentInstance)
				projections {
					max ("lineNumber")
				}
			}
			
			params.lineNumber = (maxLineNumber?maxLineNumber:0) + 1
			
			def paymentItemInstance = new PaymentItem(params)
			paymentItemInstance.amount = paymentInstance.totalAmount
			paymentItemInstance.invoice = invoice
			paymentItemInstance.payment = paymentInstance
			paymentItemInstance.save(flush:true)
			
			invoice.receviedGrandTotal += paymentItemInstance.amount
			invoice.openGrandTotal -= paymentItemInstance.amount
			if(invoice.openGrandTotal <= 0) {
				invoice.status = 'CLOSED'
			}
			invoice.save(flush:true)
			
			flash.message = "Payment registered for Invoice " + invoice.invoiceNumber
			redirect action: 'show', id: invoice.id,controller:"invoice"
			break
		}
    }

    def show() {
        def paymentInstance = Payment.get(params.id)
        if (!paymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
            redirect action: 'list'
            return
        }

        [paymentInstance: paymentInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def paymentInstance = Payment.get(params.id)
	        if (!paymentInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [paymentInstance: paymentInstance]
			break
		case 'POST':
	        def paymentInstance = Payment.get(params.id)
	        if (!paymentInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (paymentInstance.version > version) {
	                paymentInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'payment.label', default: 'Payment')] as Object[],
	                          "Another user has updated this Payment while you were editing")
	                render view: 'edit', model: [paymentInstance: paymentInstance]
	                return
	            }
	        }

	        paymentInstance.properties = params

	        if (!paymentInstance.save(flush: true)) {
	            render view: 'edit', model: [paymentInstance: paymentInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.id])
	        redirect action: 'show', id: paymentInstance.id
			break
		}
    }

    def delete() {
        def paymentInstance = Payment.get(params.id)
        if (!paymentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
            redirect action: 'list'
            return
        }

        try {
            paymentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	
	def openPayments() { 
		def openPayments = Payment.findAllByPaymentMethodAndClearanceDateIsNull("CHEQUE",params)
		[openPayments:openPayments]
	}
	
	def updateClearanceDate() {
		switch (request.method) {
		case 'GET':
			def paymentInstance = Payment.get(params.id)
			if (!paymentInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
				redirect action: 'list'
				return
			}

			[paymentInstance: paymentInstance]
			break
		case 'POST':
			def paymentInstance = Payment.get(params.id)
			if (!paymentInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'payment.label', default: 'Payment'), params.id])
				redirect action: 'list'
				return
			}

			if (params.version) {
				def version = params.version.toLong()
				if (paymentInstance.version > version) {
					paymentInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
							  [message(code: 'payment.label', default: 'Payment')] as Object[],
							  "Another user has updated this Payment while you were editing")
					render view: 'edit', model: [paymentInstance: paymentInstance]
					return
				}
			}

			paymentInstance.properties = params

			if (!paymentInstance.save(flush: true)) {
				render view: 'edit', model: [paymentInstance: paymentInstance]
				return
			}

			flash.message = "Clearance Date Added."
			redirect action: 'show', id: paymentInstance.id
			break
		}
	}
}

