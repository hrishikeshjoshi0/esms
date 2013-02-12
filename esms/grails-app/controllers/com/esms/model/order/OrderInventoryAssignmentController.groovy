package com.esms.model.order

import org.springframework.dao.DataIntegrityViolationException

class OrderInventoryAssignmentController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [orderInventoryAssignmentInstanceList: OrderInventoryAssignment.list(params), orderInventoryAssignmentInstanceTotal: OrderInventoryAssignment.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[orderInventoryAssignmentInstance: new OrderInventoryAssignment(params)]
			break
		case 'POST':
	        def orderInventoryAssignmentInstance = new OrderInventoryAssignment(params)
	        if (!orderInventoryAssignmentInstance.save(flush: true)) {
	            render view: 'create', model: [orderInventoryAssignmentInstance: orderInventoryAssignmentInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment'), orderInventoryAssignmentInstance.id])
	        redirect action: 'show', id: orderInventoryAssignmentInstance.id
			break
		}
    }

    def show() {
        def orderInventoryAssignmentInstance = OrderInventoryAssignment.get(params.id)
        if (!orderInventoryAssignmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment'), params.id])
            redirect action: 'list'
            return
        }

        [orderInventoryAssignmentInstance: orderInventoryAssignmentInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def orderInventoryAssignmentInstance = OrderInventoryAssignment.get(params.id)
	        if (!orderInventoryAssignmentInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [orderInventoryAssignmentInstance: orderInventoryAssignmentInstance]
			break
		case 'POST':
	        def orderInventoryAssignmentInstance = OrderInventoryAssignment.get(params.id)
	        if (!orderInventoryAssignmentInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (orderInventoryAssignmentInstance.version > version) {
	                orderInventoryAssignmentInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment')] as Object[],
	                          "Another user has updated this OrderInventoryAssignment while you were editing")
	                render view: 'edit', model: [orderInventoryAssignmentInstance: orderInventoryAssignmentInstance]
	                return
	            }
	        }

	        orderInventoryAssignmentInstance.properties = params

	        if (!orderInventoryAssignmentInstance.save(flush: true)) {
	            render view: 'edit', model: [orderInventoryAssignmentInstance: orderInventoryAssignmentInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment'), orderInventoryAssignmentInstance.id])
	        redirect action: 'show', id: orderInventoryAssignmentInstance.id
			break
		}
    }

    def delete() {
        def orderInventoryAssignmentInstance = OrderInventoryAssignment.get(params.id)
        if (!orderInventoryAssignmentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment'), params.id])
            redirect action: 'list'
            return
        }

        try {
            orderInventoryAssignmentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
