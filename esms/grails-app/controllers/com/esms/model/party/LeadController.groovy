package com.esms.model.party

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.maintenance.LiftInfo

class LeadController {
	
	def filterPaneService

    def index() {
        redirect action: 'list', params: params
    }
	
	def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def organizations = Organization.findAllBySalesStatusAndIsOneTimeCustomer('LEAD',false,params)
		[organizationInstanceList: organizations, organizationInstanceTotal: Organization.count()]
	}

	def filter = {
		if(!params.max) params.max = 10
		render( view:'list', model:[ organizationInstanceList: filterPaneService.filter( params, Organization), 
			organizationInstanceCount: filterPaneService.count( params, Organization), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}
	
	def create() {
		switch (request.method) {
		case 'GET':
			def list = Organization.list();
			int no = (list?list.size():0) + 1;
			String externalId = "ORG" + String.format("%05d", no)
			params.externalId = externalId
			[organizationInstance: new Organization(params),contactInstance : new Contact(),addressInstance:new Address(),phoneBookInstance:new PhoneBook(),liftInfoInstance: new LiftInfo()]
			break
		case 'POST':
			def organizationInstance = new Organization(params)
			organizationInstance.partyType = "ORGANIZATION"
			
			if (!organizationInstance.save(flush: true)) {
				render view: 'create', model: [organizationInstance: organizationInstance]
				return
			}
			
			def contactInstance = new Contact()
			contactInstance = bindData(contactInstance, params, "primary") 
			
			def list = Party.list();
			int no = (list?list.size():0) + 1;
			contactInstance.externalId = "CONT" + String.format("%05d", no)
			contactInstance.partyType = 'CONTACT'
			
			contactInstance.organization = organizationInstance
			contactInstance.description = ''
			contactInstance.save(flush:true)
			
			def secondaryContactInstance = new Contact()
			secondaryContactInstance = bindData(secondaryContactInstance, params, "secondary")
			
			list = Party.list();
			no = (list?list.size():0) + 1;
			secondaryContactInstance.externalId = "CONT" + String.format("%05d", no)
			secondaryContactInstance.partyType = 'CONTACT'
			
			secondaryContactInstance.organization = organizationInstance
			secondaryContactInstance.description = ''
			secondaryContactInstance.save(flush:true)
			
			def phoneBookInstance = new PhoneBook()
			phoneBookInstance = bindData(phoneBookInstance,params,'primary')
			phoneBookInstance.party = contactInstance
			phoneBookInstance.save(flush:true)
			
			def secondaryPhoneBookInstance = new PhoneBook()
			phoneBookInstance = bindData(secondaryPhoneBookInstance,params,'secondary')
			secondaryPhoneBookInstance.party = secondaryContactInstance
			secondaryPhoneBookInstance.save(flush:true)
			
			def addressInstance = new Address(params)
			addressInstance.party = organizationInstance
			addressInstance.save(flush:true)
			
			def liftInfo = new LiftInfo(params)
			liftInfo.organization = organizationInstance
			liftInfo.save(flush:true)
			
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

		try {
			organizationInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
			redirect action: 'list'
		} catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
			redirect action: 'show', id: params.id
		}
	}
}
