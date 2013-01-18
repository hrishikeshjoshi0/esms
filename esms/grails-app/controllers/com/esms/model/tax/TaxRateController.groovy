package com.esms.model.tax

import org.springframework.dao.DataIntegrityViolationException

class TaxRateController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [taxRateInstanceList: TaxRate.list(params), taxRateInstanceTotal: TaxRate.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[taxRateInstance: new TaxRate(params)]
			break
		case 'POST':
	        def taxRateInstance = new TaxRate(params)
	        if (!taxRateInstance.save(flush: true)) {
	            render view: 'create', model: [taxRateInstance: taxRateInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'taxRate.label', default: 'TaxRate'), taxRateInstance.id])
	        redirect action: 'show', id: taxRateInstance.id
			break
		}
    }

    def show() {
        def taxRateInstance = TaxRate.get(params.id)
        if (!taxRateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxRate.label', default: 'TaxRate'), params.id])
            redirect action: 'list'
            return
        }

        [taxRateInstance: taxRateInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def taxRateInstance = TaxRate.get(params.id)
	        if (!taxRateInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxRate.label', default: 'TaxRate'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [taxRateInstance: taxRateInstance]
			break
		case 'POST':
	        def taxRateInstance = TaxRate.get(params.id)
	        if (!taxRateInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxRate.label', default: 'TaxRate'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (taxRateInstance.version > version) {
	                taxRateInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'taxRate.label', default: 'TaxRate')] as Object[],
	                          "Another user has updated this TaxRate while you were editing")
	                render view: 'edit', model: [taxRateInstance: taxRateInstance]
	                return
	            }
	        }

	        taxRateInstance.properties = params

	        if (!taxRateInstance.save(flush: true)) {
	            render view: 'edit', model: [taxRateInstance: taxRateInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'taxRate.label', default: 'TaxRate'), taxRateInstance.id])
	        redirect action: 'show', id: taxRateInstance.id
			break
		}
    }

    def delete() {
        def taxRateInstance = TaxRate.get(params.id)
        if (!taxRateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'taxRate.label', default: 'TaxRate'), params.id])
            redirect action: 'list'
            return
        }

        try {
            taxRateInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'taxRate.label', default: 'TaxRate'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'taxRate.label', default: 'TaxRate'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
