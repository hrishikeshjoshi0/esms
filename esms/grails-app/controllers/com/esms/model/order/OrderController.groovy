package com.esms.model.order

import org.springframework.dao.DataIntegrityViolationException

class OrderController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [orderInstanceList: Order.list(params), orderInstanceTotal: Order.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
			def list = Order.list();
			int no = (list?list.size():0) + 1;
			String orderNumber = "ORD" + String.format("%05d", no)
			params.orderNumber = orderNumber
        	[orderInstance: new Order(params)]
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
}
