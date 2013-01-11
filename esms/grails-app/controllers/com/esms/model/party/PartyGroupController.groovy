package com.esms.model.party

import org.springframework.dao.DataIntegrityViolationException

class PartyGroupController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [partyGroupInstanceList: PartyGroup.list(params), partyGroupInstanceTotal: PartyGroup.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[partyGroupInstance: new PartyGroup(params)]
			break
		case 'POST':
	        def partyGroupInstance = new PartyGroup(params)
	        if (!partyGroupInstance.save(flush: true)) {
	            render view: 'create', model: [partyGroupInstance: partyGroupInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), partyGroupInstance.id])
	        redirect action: 'show', id: partyGroupInstance.id
			break
		}
    }

    def show() {
        def partyGroupInstance = PartyGroup.get(params.id)
        if (!partyGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), params.id])
            redirect action: 'list'
            return
        }

        [partyGroupInstance: partyGroupInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def partyGroupInstance = PartyGroup.get(params.id)
	        if (!partyGroupInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [partyGroupInstance: partyGroupInstance]
			break
		case 'POST':
	        def partyGroupInstance = PartyGroup.get(params.id)
	        if (!partyGroupInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (partyGroupInstance.version > version) {
	                partyGroupInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'partyGroup.label', default: 'PartyGroup')] as Object[],
	                          "Another user has updated this PartyGroup while you were editing")
	                render view: 'edit', model: [partyGroupInstance: partyGroupInstance]
	                return
	            }
	        }

	        partyGroupInstance.properties = params

	        if (!partyGroupInstance.save(flush: true)) {
	            render view: 'edit', model: [partyGroupInstance: partyGroupInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), partyGroupInstance.id])
	        redirect action: 'show', id: partyGroupInstance.id
			break
		}
    }

    def delete() {
        def partyGroupInstance = PartyGroup.get(params.id)
        if (!partyGroupInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), params.id])
            redirect action: 'list'
            return
        }

        try {
            partyGroupInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
