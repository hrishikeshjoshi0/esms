package com.esms.model.party

import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.quote.Quote

class OrganizationController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [organizationInstanceList: Organization.list(params), organizationInstanceTotal: Organization.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[organizationInstance: new Organization(params)]
			break
		case 'POST':
	        def organizationInstance = new Organization(params)
			organizationInstance.partyType = "ORGANIZATION"
	        if (!organizationInstance.save(flush: true)) {
	            render view: 'create', model: [organizationInstance: organizationInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'organization.label', default: 'Organization'), organizationInstance.id])
	        redirect action: 'show', id: organizationInstance.id
			break
		}
    }

    def show() {
        def organizationInstance = Organization.get(params.id)
        if (!organizationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
            redirect action: 'list'
            return
        }

        [organizationInstance: organizationInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def organizationInstance = Organization.get(params.id)
	        if (!organizationInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [organizationInstance: organizationInstance]
			break
		case 'POST':
	        def organizationInstance = Organization.get(params.id)
	        if (!organizationInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (organizationInstance.version > version) {
	                organizationInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'organization.label', default: 'Organization')] as Object[],
	                          "Another user has updated this Organization while you were editing")
	                render view: 'edit', model: [organizationInstance: organizationInstance]
	                return
	            }
	        }

	        organizationInstance.properties = params

	        if (!organizationInstance.save(flush: true)) {
	            render view: 'edit', model: [organizationInstance: organizationInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'organization.label', default: 'Organization'), organizationInstance.id])
	        redirect action: 'show', id: organizationInstance.id
			break
		}
    }

    def delete() {
        def organizationInstance = Organization.get(params.id)
        if (!organizationInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
            redirect action: 'list'
            return
        }

        try {
            organizationInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	
	def createContact() {
		switch (request.method) {
		case 'GET':
			[contactInstance: new Contact(params)]
			break
		case 'POST':
			def contactInstance = new Contact(params)
			contactInstance.partyType = "CONTACT"
			contactInstance.status = "ACTIVE"
			
			if (!contactInstance.save(flush: true)) {
				flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
				render controller : 'organization',action: 'list', model: [contactInstance: contactInstance]
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), contactInstance.id])
			redirect controller: 'organization', action: 'show', id: contactInstance?.organization?.id
		}
	}
	
	def createAddress() {
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

			flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), addressInstance.id])
			redirect controller: 'organization', action: 'show', id: addressInstance?.party?.id
		}
	}
	
	def createPhoneBook() {
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
			redirect controller: 'organization', action: 'show', id: phoneBookInstance?.party?.id
			break
		}
	}
	
	def createQuote() {
		switch (request.method) {
		case 'GET':
        	[quoteInstance: new Quote(params)]
			break
		case 'POST':
	        def quoteInstance = new Quote(params)
	        if (!quoteInstance.save(flush: true)) {
	            render view: 'create', model: [quoteInstance: quoteInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'quote.label', default: 'Quote'), quoteInstance.id])
	        redirect controller: 'organization', action: 'show', id: quoteInstance?.organization?.id
			break
		}
	}
}
