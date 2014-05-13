package com.esms.model.party

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.maintenance.LiftInfo

class LeadController {
	
	def filterPaneService
	
	def accountService
	
	def utilService
	
    def index() {
        redirect action: 'list', params: params
    }
	
	def list() {
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		def organizations = Organization.findAllBySalesStatusAndIsOneTimeCustomer('LEAD',false,params)
		def organizationInstanceTotal = Organization.countBySalesStatusAndIsOneTimeCustomer('LEAD',false,params)
		
		[organizationInstanceList: organizations, organizationInstanceTotal: organizationInstanceTotal]
	}

	def filter = {
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		render( view:'list', model:[ organizationInstanceList: filterPaneService.filter( params, Organization), 
			organizationInstanceTotal: filterPaneService.count( params, Organization), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}
	
	def create() {
		switch (request.method) {
		case 'GET':
			params.externalId = '-Auto Gen-'
			[organizationInstance: new Organization(params),contactInstance : new Contact(),addressInstance:new Address(),phoneBookInstance:new PhoneBook(),liftInfoInstance: new LiftInfo()]
			break
		case 'POST':
			params.externalId = utilService.newOrganizationNumber()
			def organizationInstance = new Organization(params)
			organizationInstance.partyType = "ORGANIZATION"
			
			if (!organizationInstance.save(flush: true)) {
				render view: 'create', model: [organizationInstance: organizationInstance]
				return
			}
			
			def contactInstance = new Contact()
			contactInstance = bindData(contactInstance, params, "primary") 
			contactInstance.externalId = utilService.newContactNumber()
			contactInstance.partyType = 'CONTACT'
			
			contactInstance.organization = organizationInstance
			contactInstance.description = ''
			contactInstance.save(flush:true)
			
			/*def secondaryContactInstance = new Contact()
			secondaryContactInstance = bindData(secondaryContactInstance, params, "secondary")
			
			secondaryContactInstance.externalId = utilService.newContactNumber()
			secondaryContactInstance.partyType = 'CONTACT'
			
			secondaryContactInstance.organization = organizationInstance
			secondaryContactInstance.description = ''
			secondaryContactInstance.save(flush:true)*/
			
			def phoneBookInstance = new PhoneBook()
			phoneBookInstance = bindData(phoneBookInstance,params,'primary')
			phoneBookInstance.party = contactInstance
			phoneBookInstance.save(flush:true)
			
			/*def secondaryPhoneBookInstance = new PhoneBook()
			phoneBookInstance = bindData(secondaryPhoneBookInstance,params,'secondary')
			secondaryPhoneBookInstance.party = secondaryContactInstance
			secondaryPhoneBookInstance.save(flush:true)*/
			
			def shippingAddressInstance = new Address()
			shippingAddressInstance = bindData(shippingAddressInstance,params,'shipping')
			shippingAddressInstance.party = organizationInstance
			shippingAddressInstance.save(flush:true)
			
			def billingAddressInstance = new Address()
			billingAddressInstance = bindData(billingAddressInstance,params,'billing')
			billingAddressInstance.addressType = "BILLING"
			billingAddressInstance.party = organizationInstance
			billingAddressInstance.save(flush:true)
			
			/*def liftInfo = new LiftInfo(params)
			liftInfo.organization = organizationInstance
			liftInfo.save(flush:true)*/
			
			flash.message = "New Lead Added." 
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
			
			[organizationInstance: organizationInstance,contactInstance : new Contact(),addressInstance:new Address(),phoneBookInstance:new PhoneBook(),liftInfoInstance: new LiftInfo()]
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
		
		boolean error = false;
		def messages = []
		
		if (!organizationInstance) {
			error = true;
			messages.add("Record Not Found.")
		}
		
		if(!organizationInstance?.quotes?.empty) {
			error = true;
			messages.add("There are other records referencing this record. This record cannot be deleted at the moment.")
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
			organizationInstance.delete(flush: true)
			messages << message(code: 'default.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
			render(contentType: "text/json") {
				[
					error : false,
					level: "success",
					messages : messages,
					nextUrl : g.createLink(controller:'dashboard')
				]
			}
		} catch (DataIntegrityViolationException e) {
			messages << message(code: 'default.not.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
			render(contentType: "text/json") {[
				error : false,
				level: "error",
				messages : messages,
				nextUrl : g.createLink(action: 'show',id:params.id)
			]}
		}
	}
	
	def disqualifyLead() {
		def organizationInstance = Organization.get(params.id)
		organizationInstance.salesStatus = 'DISQUALIFIED'
		if (!organizationInstance.save(flush: true)) {
			render view: 'edit', model: [organizationInstance: organizationInstance]
			return
		}

		flash.message = "Marked As Disqualified"
		redirect action: 'show', id: organizationInstance.id
	}
	
	def createContact() {
		switch (request.method) {
		case 'GET':
			params.externalId = '- AutoGen -'
			render view: '/_common/modals/createContact', model: [contactInstance: new Contact(params)]
			return
		case 'POST':
			def contactInstance = new Contact(params)
			contactInstance.partyType = "CONTACT"
			contactInstance.externalId = utilService.newContactNumber()
			
			if(!contactInstance.description) {
				contactInstance.description = ""
			}
			
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
			render view: '/_common/modals/createAddress', model: [addressInstance: new Address(params)]
			return
		case 'POST':
			def addressInstance = new Address(params)
			if (!addressInstance.save(flush: true)) {
				render view: 'create', model: [addressInstance: addressInstance]
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), addressInstance.id])
			redirect controller: 'lead', action: 'show', id: addressInstance?.party?.id
		}
	}
	
	def createPhoneBook() {
		switch (request.method) {
		case 'GET':
			render view: '/_common/modals/createPhoneBook', [phoneBookInstance: new PhoneBook(params)]
			return
		case 'POST':
			def phoneBookInstance = new PhoneBook(params)
			if (!phoneBookInstance.save(flush: true)) {
				render view: 'create', model: [phoneBookInstance: phoneBookInstance]
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), phoneBookInstance.id])
			redirect controller: 'lead', action: 'show', id: phoneBookInstance?.party?.id
			break
		}
	}
	
	def lostLead() {
		switch (request.method) {
		case 'GET':
			def organizationInsance = Organization.get(params.id)
			[organizationInsance: organizationInsance]
			break
		case 'POST':
			def organizationInstance = Organization.get(params.id)
			organizationInstance.lostReason = params.lostReason
			organizationInstance.salesStatus = 'LOST'

			if (!organizationInstance.save(flush: true)) {
				redirect controller: 'lead', action: 'show', id: organizationInstance?.id
				return
			}
			
			redirect controller: 'lead', action: 'show', id: organizationInstance?.id
		}
	}
	
}
