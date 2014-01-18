package com.esms.model.party

import org.springframework.dao.DataIntegrityViolationException

class AddressController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: ['GET', 'POST']]

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [addressInstanceList: Address.list(params), addressInstanceTotal: Address.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[addressInstance: new Address(params)]
			break
		case 'POST':
	        def addressInstance = new Address(params)
	        if (!addressInstance.save(flush: true)) {
	            render view: 'create', model: [addressInstance: addressInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.id])
	        redirect action: 'show', id: addressInstance.id
			break
		}
    }

    def show() {
        def addressInstance = Address.get(params.id)
        if (!addressInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
            redirect action: 'list'
            return
        }

        [addressInstance: addressInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def addressInstance = Address.get(params.id)
	        if (!addressInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [addressInstance: addressInstance]
			break
		case 'POST':
	        def addressInstance = Address.get(params.id)
	        if (!addressInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (addressInstance.version > version) {
	                addressInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'address.label', default: 'Address')] as Object[],
	                          "Another user has updated this Address while you were editing")
	                render view: 'edit', model: [addressInstance: addressInstance]
	                return
	            }
	        }

	        addressInstance.properties = params

	        if (!addressInstance.save(flush: true)) {
	            render view: 'edit', model: [addressInstance: addressInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.id])
	        redirect action: 'show', id: addressInstance.id
			break
		}
    }

    def delete() {
        def addressInstance = Address.get(params.id)
        		
		boolean error = false;
		def messages = []
		
		if (!addressInstance) {
			error = true;
			messages <<  message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
		}
		
		if(error) {
			render(contentType: "text/json") {
				[
					error : true,
					level: "warning",
					messages : messages
				]
			}
			return
		}
		
		def controller = ''
		def party = addressInstance.party
		if(addressInstance.party?.partyType == 'CONTACT') {
			controller = 'contact'
		} else if(addressInstance.party?.partyType == 'ORGANIZATION') {
			if(addressInstance.party?.salesStatus == 'LEAD') {
				controller = 'lead'
			} else {
				controller = 'organization'
			}
		} else if(addressInstance.party?.partyType == 'EMPLOYEE') {
			controller = 'employee'
		}

        try {
            addressInstance.delete(flush: true)
			messages << message(code: 'default.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])
			render(contentType: "text/json") {[
					error : false,
					level: "success",
					messages : messages,
					nextUrl : g.createLink(controller:controller,action: 'show',id:party?.id)
			]}
        }
        catch (DataIntegrityViolationException e) {
			messages << message(code: 'default.not.deleted.message', args: [message(code: 'address.label', default: 'Address'), params.id])
			render(contentType: "text/json") {[
				error : false,
				level: "error",
				messages : messages,
				nextUrl : g.createLink(controller:'address',action: 'show',id:params.id)
			]}
        }
    }
}
