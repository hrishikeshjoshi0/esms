package com.esms.model.party

import org.springframework.dao.DataIntegrityViolationException

class PhoneBookController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: ['GET', 'POST']]

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [phoneBookInstanceList: PhoneBook.list(params), phoneBookInstanceTotal: PhoneBook.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[phoneBookInstance: new PhoneBook(params)]
			break
		case 'POST':
	        def phoneBookInstance = new PhoneBook(params)
	        if (!phoneBookInstance.save(flush: true)) {
	            render view: 'create', model: [phoneBookInstance: phoneBookInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), phoneBookInstance.id])
	        redirect action: 'show', id: phoneBookInstance.id
			break
		}
    }

    def show() {
        def phoneBookInstance = PhoneBook.get(params.id)
        if (!phoneBookInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), params.id])
            redirect action: 'list'
            return
        }

        [phoneBookInstance: phoneBookInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def phoneBookInstance = PhoneBook.get(params.id)
	        if (!phoneBookInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [phoneBookInstance: phoneBookInstance]
			break
		case 'POST':
	        def phoneBookInstance = PhoneBook.get(params.id)
	        if (!phoneBookInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (phoneBookInstance.version > version) {
	                phoneBookInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'phoneBook.label', default: 'PhoneBook')] as Object[],
	                          "Another user has updated this PhoneBook while you were editing")
	                render view: 'edit', model: [phoneBookInstance: phoneBookInstance]
	                return
	            }
	        }

	        phoneBookInstance.properties = params

	        if (!phoneBookInstance.save(flush: true)) {
	            render view: 'edit', model: [phoneBookInstance: phoneBookInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), phoneBookInstance.id])
	        redirect action: 'show', id: phoneBookInstance.id
			break
		}
    }

    def delete() {
        def phoneBookInstance = PhoneBook.get(params.id)
		
		boolean error = false;
		def messages = []
		
		if (!phoneBookInstance) {
			error = true;
			messages << message(code: 'default.not.found.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), params.id])
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
		
        try {
            phoneBookInstance.delete(flush: true)
			messages << message(code: 'default.deleted.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), params.id])
			render(contentType: "text/json") {[
					error : false,
					level: "success",
					messages : messages,
					nextUrl : g.createLink(controller:'phoneBook',action: 'list')
			]}
        }
        catch (DataIntegrityViolationException e) {
			messages << message(code: 'default.not.deleted.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), params.id])
			render(contentType: "text/json") {[
				error : false,
				level: "error",
				messages : messages,
				nextUrl : g.createLink(controller:'phoneBook',action: 'show',id:params.id)
			]}
        }
    }
}
