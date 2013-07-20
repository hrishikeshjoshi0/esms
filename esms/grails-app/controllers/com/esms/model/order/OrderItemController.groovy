package com.esms.model.order

import org.springframework.dao.DataIntegrityViolationException

class OrderItemController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [orderItemInstanceList: OrderItem.list(params), orderItemInstanceTotal: OrderItem.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[orderItemInstance: new OrderItem(params)]
			break
		case 'POST':
	        def orderItemInstance = new OrderItem(params)
	        if (!orderItemInstance.save(flush: true)) {
	            render view: 'create', model: [orderItemInstance: orderItemInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'orderItem.label', default: 'OrderItem'), orderItemInstance.id])
	        redirect action: 'show', id: orderItemInstance.id
			break
		}
    }

    def show() {
        def orderItemInstance = OrderItem.get(params.id)
        if (!orderItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderItem.label', default: 'OrderItem'), params.id])
            redirect action: 'list'
            return
        }

        [orderItemInstance: orderItemInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def orderItemInstance = OrderItem.get(params.id)
	        if (!orderItemInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderItem.label', default: 'OrderItem'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [orderItemInstance: orderItemInstance]
			break
		case 'POST':
	        def orderItemInstance = OrderItem.get(params.id)
	        if (!orderItemInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderItem.label', default: 'OrderItem'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (orderItemInstance.version > version) {
	                orderItemInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'orderItem.label', default: 'OrderItem')] as Object[],
	                          "Another user has updated this OrderItem while you were editing")
	                render view: 'edit', model: [orderItemInstance: orderItemInstance]
	                return
	            }
	        }

	        orderItemInstance.properties = params

	        if (!orderItemInstance.save(flush: true)) {
	            render view: 'edit', model: [orderItemInstance: orderItemInstance]
	            return
	        }
			
			//Update Order
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

			flash.message = message(code: 'default.updated.message', args: [message(code: 'orderItem.label', default: 'OrderItem'), orderItemInstance.id])
	        redirect action: 'show', id: orderItemInstance.id
			break
		}
    }

    def delete() {
        def orderItemInstance = OrderItem.get(params.id)
        if (!orderItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderItem.label', default: 'OrderItem'), params.id])
            redirect action: 'list'
            return
        }

        try {
            orderItemInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'orderItem.label', default: 'OrderItem'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'orderItem.label', default: 'OrderItem'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
