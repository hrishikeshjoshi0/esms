package com.esms.model.order

import org.springframework.dao.DataIntegrityViolationException

class PurchaseOrderController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [purchaseOrderInstanceList: PurchaseOrder.list(params), purchaseOrderInstanceTotal: PurchaseOrder.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[purchaseOrderInstance: new PurchaseOrder(params)]
			break
		case 'POST':
	        def purchaseOrderInstance = new PurchaseOrder(params)
	        if (!purchaseOrderInstance.save(flush: true)) {
	            render view: 'create', model: [purchaseOrderInstance: purchaseOrderInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), purchaseOrderInstance.id])
	        redirect action: 'show', id: purchaseOrderInstance.id
			break
		}
    }

    def show() {
        def purchaseOrderInstance = PurchaseOrder.get(params.id)
        if (!purchaseOrderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])
            redirect action: 'list'
            return
        }

        [purchaseOrderInstance: purchaseOrderInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def purchaseOrderInstance = PurchaseOrder.get(params.id)
	        if (!purchaseOrderInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [purchaseOrderInstance: purchaseOrderInstance]
			break
		case 'POST':
	        def purchaseOrderInstance = PurchaseOrder.get(params.id)
	        if (!purchaseOrderInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (purchaseOrderInstance.version > version) {
	                purchaseOrderInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'purchaseOrder.label', default: 'PurchaseOrder')] as Object[],
	                          "Another user has updated this PurchaseOrder while you were editing")
	                render view: 'edit', model: [purchaseOrderInstance: purchaseOrderInstance]
	                return
	            }
	        }

	        purchaseOrderInstance.properties = params

	        if (!purchaseOrderInstance.save(flush: true)) {
	            render view: 'edit', model: [purchaseOrderInstance: purchaseOrderInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), purchaseOrderInstance.id])
	        redirect action: 'show', id: purchaseOrderInstance.id
			break
		}
    }

    def delete() {
        def purchaseOrderInstance = PurchaseOrder.get(params.id)
        if (!purchaseOrderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])
            redirect action: 'list'
            return
        }

        try {
            purchaseOrderInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'purchaseOrder.label', default: 'PurchaseOrder'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
