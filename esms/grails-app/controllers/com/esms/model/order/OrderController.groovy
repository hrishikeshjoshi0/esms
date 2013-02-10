package com.esms.model.order

import java.util.Date;

import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.party.Organization
import com.esms.model.quote.Quote

class OrderController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [orderInstanceList: Order.list(params), orderInstanceTotal: Order.count()]
    }
	
	def confirmSale() {
		def orderInstance = Order.get(params.id)
		if(orderInstance) {
			orderInstance.status = "PENDING_INVOICE"
		}
		
		flash.message = 'Marked as Sales Complete: ' + orderInstance.orderNumber
		redirect action: 'show', id: orderInstance.id
	}
	
	def convertQuoteToOrder() {
			def list = Order.list();
			int no = (list?list.size():0) + 1;
			String orderNumber = "ORD" + String.format("%05d", no)
			
			def quote = Quote.get(params.orderId)
			
			def order = new Order()
			order.orderNumber = orderNumber
			order.contactName = quote.contactName
			order.status = "PENDING_INVOICE"
			if(quote.type == 'CONTRACT') {
				quote.status = "CONVERTED_TO_SERVICE_CONTRACT	"
				order.type = "SERVICE"
				order.relatedTo = "CONTRACT"
				
				order.contractFromDate = quote.contractFromDate
				order.contractToDate = quote.contractToDate
				order.invoicingIsFixedPrice = quote.invoicingIsFixedPrice
				order.invoicingIsTimesheets = quote.invoicingIsTimesheets
				order.invoicingIsExpenses = quote.invoicingIsExpenses
				order.assignedTo = quote.assignedTo
				order.termsAndConditions = quote.termsAndConditions
				
			} else {
				order.type = "REPAIR"
				order.relatedTo = "CONTRACT"
				quote.status = "CONVERTED_TO_REPAIR_SALES_ORDER"
			}
			
			order.issueDate = quote.issueDate
			order.expiryDate = quote.expiryDate
			order.totalAmount = quote.totalAmount
			order.totalTax = quote.totalTax
			order.totalDiscount = quote.totalDiscount
			order.grandTotal = quote.grandTotal
			order.referenceQuoteNumber = quote.quoteNumber
			
			order.organization = quote.organization
			if(!order.save(flush:true)) {
				redirect controller: 'quote',action: 'show', id: quote.id
				return
			}
			
			order.orderItems = new HashSet<OrderItem>()
			
			int lineNo = 1
			quote.quoteItems.each { it ->  
				def orderItem = new OrderItem()
				orderItem.lineNumber = lineNo
				orderItem.quantity = it.quantity
				orderItem.unitPrice = it.unitPrice
				orderItem.tax = it.tax
				orderItem.lineTotalAmount = it.lineTotalAmount
				orderItem.discount = it.discount 
				orderItem.productNumber= it.productNumber
				orderItem.order = order
				orderItem.save(flush:true)
			}
			
			flash.message = 'Order Created from Quote: ' + quote.quoteName
			redirect action: 'show', id: order.id
	}

    def create() {
		switch (request.method) {
		case 'GET':
			def list = Order.list();
			int no = (list?list.size():0) + 1;
			String orderNumber = "ORD" + String.format("%05d", no)
			params.orderNumber = orderNumber
			
			def order = new Order(params)
			
			if(params.relatedTo == 'CONTRACT' && params.customerNumber) {
				String customerNumber = params.customerNumber
				def organization = Organization.findByExternalId(customerNumber)
				order.organization = organization
			}
			
        	[orderInstance: order]
			break
		case 'POST':
	        def orderInstance = new Order(params)
	        if (!orderInstance.save(flush: true)) {
	            render view: 'create', model: [orderInstance: orderInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'order.label', default: 'Order'), orderInstance.id])
	        redirect action: 'show', id: orderInstance.id
			break
		}
    }

    def show() {
        def orderInstance = Order.get(params.id)
        if (!orderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
            redirect action: 'list'
            return
        }

        [orderInstance: orderInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def orderInstance = Order.get(params.id)
	        if (!orderInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [orderInstance: orderInstance]
			break
		case 'POST':
	        def orderInstance = Order.get(params.id)
	        if (!orderInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (orderInstance.version > version) {
	                orderInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'order.label', default: 'Order')] as Object[],
	                          "Another user has updated this Order while you were editing")
	                render view: 'edit', model: [orderInstance: orderInstance]
	                return
	            }
	        }

	        orderInstance.properties = params

	        if (!orderInstance.save(flush: true)) {
	            render view: 'edit', model: [orderInstance: orderInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'order.label', default: 'Order'), orderInstance.id])
	        redirect action: 'show', id: orderInstance.id
			break
		}
    }

    def delete() {
        def orderInstance = Order.get(params.id)
        if (!orderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
            redirect action: 'list'
            return
        }

        try {
            orderInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'order.label', default: 'Order'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'order.label', default: 'Order'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	
	def createOrderItem() {
		switch (request.method) {
		case 'GET':
			def order = Order.get(params.orderId)
			
			def c = OrderItem.createCriteria()
			def maxLineNumber = c.get {
				eq("order", order)
				projections {
					max ("lineNumber")
				}
			}
			params.lineNumber = maxLineNumber?maxLineNumber:0 + 1
			[orderItemInstance: new OrderItem(params)]
			break
		case 'POST':
			def orderItemInstance = new OrderItem(params)
			
			if (!orderItemInstance.save(flush: true)) {
				render view: 'create', model: [orderItemInstance: orderItemInstance]
				return
			}
			
			def order = orderItemInstance.order
			def orderItems = order.orderItems
			
			def unitPrice = new BigDecimal("0.0")
			def tax = new BigDecimal("0.0")
			def discount = new BigDecimal("0.0")
			def lineTotalAmount = new BigDecimal("0.0")
			
			orderItems?.each { it ->
				unitPrice += it.unitPrice
				tax +=  it.tax
				discount +=  it.discount
				lineTotalAmount +=  it.lineTotalAmount
			}
			
			BigDecimal totalDiscount = new BigDecimal("0.0")
			BigDecimal grandTotal = new BigDecimal("0.0")
			
			order.totalAmount = unitPrice
			order.totalTax = tax
			order.totalDiscount = discount
			order.grandTotal = lineTotalAmount
			order.save(flush:true)
			
			flash.message = message(code: 'default.created.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), orderItemInstance.id])
			redirect action: 'show', id: orderItemInstance.order.id
			break
		}
	}
	
	def createInvoice = {
		def order = Order.get(params.id)
		order.status = "INVOICED"
		order.openGrandTotal = order.grandTotal
		order.receviedGrandTotal = new BigDecimal("0.0")
		order.save(flush:true)
		
		flash.message = "Converted to Invoice."
		redirect action: 'show', id: order.id
	}
}

