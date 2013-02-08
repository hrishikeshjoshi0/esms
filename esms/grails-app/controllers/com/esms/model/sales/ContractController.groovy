package com.esms.model.sales

import org.springframework.dao.DataIntegrityViolationException

class ContractController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contractInstanceList: Contract.list(params), contractInstanceTotal: Contract.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
			def list = Contract.list();
			int no = (list?list.size():0) + 1;
			params.contractNumber = "CON" + String.format("%05d", no)
			
        	[contractInstance: new Contract(params)]
			break
		case 'POST':
	        def contractInstance = new Contract(params)
	        if (!contractInstance.save(flush: true)) {
	            render view: 'create', model: [contractInstance: contractInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'contract.label', default: 'Contract'), contractInstance.id])
	        redirect action: 'show', id: contractInstance.id
			break
		}
    }

    def show() {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect action: 'list'
            return
        }

        [contractInstance: contractInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def contractInstance = Contract.get(params.id)
	        if (!contractInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [contractInstance: contractInstance]
			break
		case 'POST':
	        def contractInstance = Contract.get(params.id)
	        if (!contractInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (contractInstance.version > version) {
	                contractInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'contract.label', default: 'Contract')] as Object[],
	                          "Another user has updated this Contract while you were editing")
	                render view: 'edit', model: [contractInstance: contractInstance]
	                return
	            }
	        }

	        contractInstance.properties = params

	        if (!contractInstance.save(flush: true)) {
	            render view: 'edit', model: [contractInstance: contractInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'contract.label', default: 'Contract'), contractInstance.id])
	        redirect action: 'show', id: contractInstance.id
			break
		}
    }

    def delete() {
        def contractInstance = Contract.get(params.id)
        if (!contractInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect action: 'list'
            return
        }

        try {
            contractInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contract.label', default: 'Contract'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
