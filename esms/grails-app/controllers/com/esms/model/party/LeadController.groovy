package com.esms.model.party

import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.maintenance.LiftInfo

class LeadController {

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def organizations
		def a = params
		
		organizations = Organization.withCriteria {
			like('salesStatus', "LEAD")
		}
		
		[organizationInstanceList: organizations, organizationInstanceTotal: organizations?organizations.size():0]
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
			
			def contactInstance = new Contact(params)
			contactInstance.organization = organizationInstance
			contactInstance.save(flush:true)
			
			def addressInstance = new Address(params)
			addressInstance.party = organizationInstance
			addressInstance.save(flush:true)
			
			def phoneBookInstance = new PhoneBook(params)
			phoneBookInstance.party = organizationInstance
			phoneBookInstance.save(flush:true)

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
		} catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'organization.label', default: 'Organization'), params.id])
			redirect action: 'show', id: params.id
		}
	}
}
