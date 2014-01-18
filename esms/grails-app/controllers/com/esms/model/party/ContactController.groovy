package com.esms.model.party

import org.springframework.dao.DataIntegrityViolationException

class ContactController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: ['GET', 'POST']]

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [contactInstanceList: Contact.list(params), contactInstanceTotal: Contact.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[contactInstance: new Contact(params)]
			break
		case 'POST':
	        def contactInstance = new Contact(params)
			contactInstance.partyType = "CONTACT"
			
	        if (!contactInstance.save(flush: true)) {
	            render view: 'create', model: [contactInstance: contactInstance]
	            return
	        }

	        flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
			if(params.createdFromOrganizationDetailView) {
				redirect controller: 'organization', action: 'show', id: contactInstance?.organization?.id
				break
			} else {
				redirect action: 'show', id: contactInstance.id
				break
			}
		}
    }

    def show() {
        def contactInstance = Contact.get(params.id)
        if (!contactInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
            redirect action: 'list'
            return
        }

        [contactInstance: contactInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def contactInstance = Contact.get(params.id)
	        if (!contactInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [contactInstance: contactInstance]
			break
		case 'POST':
	        def contactInstance = Contact.get(params.id)
	        if (!contactInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (contactInstance.version > version) {
	                contactInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'contact.label', default: 'Contact')] as Object[],
	                          "Another user has updated this Contact while you were editing")
	                render view: 'edit', model: [contactInstance: contactInstance]
	                return
	            }
	        }

	        contactInstance.properties = params

	        if (!contactInstance.save(flush: true)) {
	            render view: 'edit', model: [contactInstance: contactInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
	        redirect action: 'show', id: contactInstance.id
			break
		}
    }

    def delete() {
        def contactInstance = Contact.get(params.id)
		boolean error = false;
		def messages = []
		
		if (!contactInstance) {
			error = true;
			messages << message(code: 'default.not.found.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
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
		def organization = contactInstance.organization
		if(organization?.salesStatus == 'LEAD') {
			controller = 'lead'
		} else {
			controller = 'organization'
		}
		
		try {
			contactInstance.delete(flush: true)
			messages << message(code: 'default.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
			render(contentType: "text/json") {[
					error : false,
					level: "success",
					messages : messages,
					nextUrl : g.createLink(controller:controller,action: 'show',id:organization?.id)
			]}
		} catch (DataIntegrityViolationException e) {
			messages << message(code: 'default.not.deleted.message', args: [message(code: 'contact.label', default: 'Contact'), params.id])
			render(contentType: "text/json") {[
				error : false,
				level: "error",
				messages : messages,
				nextUrl : g.createLink(controller:'contact',action: 'show',id:params.id)
			]}
		}
    }
	
	def createPhoneBook() {
		switch (request.method) {
		case 'GET':
			render view: '/_common/modals/createPhoneBook',model:[phoneBookInstance: new PhoneBook(params)]
			return
		case 'POST':
			def phoneBookInstance = new PhoneBook(params)
			if (!phoneBookInstance.save(flush: true)) {
				render view: 'create', model: [phoneBookInstance: phoneBookInstance]
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), phoneBookInstance.id])
			redirect controller: 'contact', action: 'show', id: phoneBookInstance?.party?.id
			break
		}
	}
}
