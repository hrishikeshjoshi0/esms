package com.esms.model.tax

import org.springframework.dao.DataIntegrityViolationException

class TaxTypeController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [taxTypeInstanceList: TaxType.list(params), taxTypeInstanceTotal: TaxType.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[taxTypeInstance: new TaxType(params)]
			break
		case 'POST':
	        def taxTypeInstance = new TaxType(params)
	        if (!taxTypeInstance.save(flush: true)) {
	            render view: 'create', model: [taxTypeInstance: taxTypeInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'taxType.label', default: 'TaxType'), taxTypeInstance.id])
	        redirect action: 'show', id: taxTypeInstance.id
			break
		}
    }

    def show() {
        def taxTypeInstance = TaxType.get(params.id)
        if (!taxTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxType.label', default: 'TaxType'), params.id])
            redirect action: 'list'
            return
        }

        [taxTypeInstance: taxTypeInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def taxTypeInstance = TaxType.get(params.id)
	        if (!taxTypeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxType.label', default: 'TaxType'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [taxTypeInstance: taxTypeInstance]
			break
		case 'POST':
	        def taxTypeInstance = TaxType.get(params.id)
	        if (!taxTypeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxType.label', default: 'TaxType'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (taxTypeInstance.version > version) {
	                taxTypeInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'taxType.label', default: 'TaxType')] as Object[],
	                          "Another user has updated this TaxType while you were editing")
	                render view: 'edit', model: [taxTypeInstance: taxTypeInstance]
	                return
	            }
	        }

	        taxTypeInstance.properties = params

	        if (!taxTypeInstance.save(flush: true)) {
	            render view: 'edit', model: [taxTypeInstance: taxTypeInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'taxType.label', default: 'TaxType'), taxTypeInstance.id])
	        redirect action: 'show', id: taxTypeInstance.id
			break
		}
    }

    def delete() {
        def taxTypeInstance = TaxType.get(params.id)
        if (!taxTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxType.label', default: 'TaxType'), params.id])
            redirect action: 'list'
            return
        }

        try {
            taxTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'taxType.label', default: 'TaxType'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'taxType.label', default: 'TaxType'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
