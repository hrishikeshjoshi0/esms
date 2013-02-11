package com.esms.model.inventory

import org.springframework.dao.DataIntegrityViolationException

class ProductInventoryController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [productInventoryInstanceList: ProductInventory.list(params), productInventoryInstanceTotal: ProductInventory.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[productInventoryInstance: new ProductInventory(params)]
			break
		case 'POST':
	        def productInventoryInstance = new ProductInventory(params)
	        if (!productInventoryInstance.save(flush: true)) {
	            render view: 'create', model: [productInventoryInstance: productInventoryInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'productInventory.label', default: 'ProductInventory'), productInventoryInstance.id])
	        redirect action: 'show', id: productInventoryInstance.id
			break
		}
    }

    def show() {
        def productInventoryInstance = ProductInventory.get(params.id)
        if (!productInventoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productInventory.label', default: 'ProductInventory'), params.id])
            redirect action: 'list'
            return
        }

        [productInventoryInstance: productInventoryInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def productInventoryInstance = ProductInventory.get(params.id)
	        if (!productInventoryInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productInventory.label', default: 'ProductInventory'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [productInventoryInstance: productInventoryInstance]
			break
		case 'POST':
	        def productInventoryInstance = ProductInventory.get(params.id)
	        if (!productInventoryInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'productInventory.label', default: 'ProductInventory'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (productInventoryInstance.version > version) {
	                productInventoryInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'productInventory.label', default: 'ProductInventory')] as Object[],
	                          "Another user has updated this ProductInventory while you were editing")
	                render view: 'edit', model: [productInventoryInstance: productInventoryInstance]
	                return
	            }
	        }

	        productInventoryInstance.properties = params

	        if (!productInventoryInstance.save(flush: true)) {
	            render view: 'edit', model: [productInventoryInstance: productInventoryInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'productInventory.label', default: 'ProductInventory'), productInventoryInstance.id])
	        redirect action: 'show', id: productInventoryInstance.id
			break
		}
    }

    def delete() {
        def productInventoryInstance = ProductInventory.get(params.id)
        if (!productInventoryInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'productInventory.label', default: 'ProductInventory'), params.id])
            redirect action: 'list'
            return
        }

        try {
            productInventoryInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'productInventory.label', default: 'ProductInventory'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'productInventory.label', default: 'ProductInventory'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
