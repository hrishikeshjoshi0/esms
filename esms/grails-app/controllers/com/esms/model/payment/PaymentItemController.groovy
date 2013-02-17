package com.esms.model.payment

import org.springframework.dao.DataIntegrityViolationException

class PaymentItemController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paymentItemInstanceList: PaymentItem.list(params), paymentItemInstanceTotal: PaymentItem.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[paymentItemInstance: new PaymentItem(params)]
			break
		case 'POST':
	        def paymentItemInstance = new PaymentItem(params)
	        if (!paymentItemInstance.save(flush: true)) {
	            render view: 'create', model: [paymentItemInstance: paymentItemInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'paymentItem.label', default: 'PaymentItem'), paymentItemInstance.id])
	        redirect action: 'show', id: paymentItemInstance.id
			break
		}
    }

    def show() {
        def paymentItemInstance = PaymentItem.get(params.id)
        if (!paymentItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentItem.label', default: 'PaymentItem'), params.id])
            redirect action: 'list'
            return
        }

        [paymentItemInstance: paymentItemInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def paymentItemInstance = PaymentItem.get(params.id)
	        if (!paymentItemInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentItem.label', default: 'PaymentItem'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [paymentItemInstance: paymentItemInstance]
			break
		case 'POST':
	        def paymentItemInstance = PaymentItem.get(params.id)
	        if (!paymentItemInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentItem.label', default: 'PaymentItem'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (paymentItemInstance.version > version) {
	                paymentItemInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'paymentItem.label', default: 'PaymentItem')] as Object[],
	                          "Another user has updated this PaymentItem while you were editing")
	                render view: 'edit', model: [paymentItemInstance: paymentItemInstance]
	                return
	            }
	        }

	        paymentItemInstance.properties = params

	        if (!paymentItemInstance.save(flush: true)) {
	            render view: 'edit', model: [paymentItemInstance: paymentItemInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'paymentItem.label', default: 'PaymentItem'), paymentItemInstance.id])
	        redirect action: 'show', id: paymentItemInstance.id
			break
		}
    }

    def delete() {
        def paymentItemInstance = PaymentItem.get(params.id)
        if (!paymentItemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'paymentItem.label', default: 'PaymentItem'), params.id])
            redirect action: 'list'
            return
        }

        try {
            paymentItemInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'paymentItem.label', default: 'PaymentItem'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'paymentItem.label', default: 'PaymentItem'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
