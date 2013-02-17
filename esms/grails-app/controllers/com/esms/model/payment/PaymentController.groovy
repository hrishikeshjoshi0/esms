package com.esms.model.payment

import org.springframework.dao.DataIntegrityViolationException

class PaymentController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [paymentInstanceList: Payment.list(params), paymentInstanceTotal: Payment.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[paymentInstance: new Payment(params)]
			break
		case 'POST':
	        def paymentInstance = new Payment(params)
	        if (!paymentInstance.save(flush: true)) {
	            render view: 'create', model: [paymentInstance: paymentInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'payment.label', default: 'Payment'), paymentInstance.id])
	        redirect action: 'show', id: paymentInstance.id
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

        [paymentInstance: paymentInstance,paymentItemInstanceList: PaymentItem.list()]
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
}
