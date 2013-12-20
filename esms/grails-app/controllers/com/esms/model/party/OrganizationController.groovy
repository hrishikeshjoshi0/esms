package com.esms.model.party

import grails.converters.XML

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.maintenance.LiftInfo
import com.esms.model.order.Order
import com.esms.model.product.Product
import com.esms.model.quote.Quote

class OrganizationController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	
	def filterPaneService
	
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
		
		def organizations = Organization.findAllBySalesStatusAndIsOneTimeCustomer('CUSTOMER',false,params)
		def organizationInstanceTotal = Organization.countBySalesStatusAndIsOneTimeCustomer('CUSTOMER',false)
		
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
	
	def fetchInfo = {
		def organization = Organization.get(params.id)	
		
		render organization as XML
		/*def contactName
		def assignedTo
		def type
		
		if(organization) {
			assignedTo = organization.assignedTo

			if(organization?.liftInfo?.typeOfEnquiry == 'REPAIR') {
				type = "REPAIR"
			}
			
			if(!organization?.contacts?.isEmpty()) {
				def contact = organization?.contacts.first()
				contactName = contact?.firstName
			}
		}
		
		render(contentType: "text/xml") {
			organizations {
				contactName(contactName)
				type(type)
				contactName(contactName)
			}
		}*/
	}

    def create() {
		switch (request.method) {
		case 'GET':
			/*def list = Party.list();
			int no = (list?list.size():0) + 1;
			String externalId = "ORG" + String.format("%05d", no)*/
			params.externalId = '-Auto Gen-'
			[organizationInstance: new Organization(params),contactInstance : new Contact(),addressInstance:new Address(),phoneBookInstance:new PhoneBook(),liftInfoInstance: new LiftInfo()]
			break
		case 'POST':
			def organizationInstance = new Organization(params)
			organizationInstance.partyType = "ORGANIZATION"
			
			organizationInstance.externalId = utilService.newOrganizationNumber()
			
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
			
			def phoneBookInstance = new PhoneBook()
			phoneBookInstance = bindData(phoneBookInstance,params,'primary')
			phoneBookInstance.party = contactInstance
			phoneBookInstance.save(flush:true)
			
			def secondaryContactInstance = new Contact()
			secondaryContactInstance = bindData(secondaryContactInstance, params, "secondary")
			
			secondaryContactInstance.externalId = utilService.newContactNumber()
			secondaryContactInstance.partyType = 'CONTACT'
			
			secondaryContactInstance.organization = organizationInstance
			secondaryContactInstance.description = ''
			secondaryContactInstance.save(flush:true)
			
			def secondaryPhoneBookInstance = new PhoneBook()
			phoneBookInstance = bindData(secondaryPhoneBookInstance,params,'secondary')
			secondaryPhoneBookInstance.party = secondaryContactInstance
			secondaryPhoneBookInstance.save(flush:true)
			
			def shippingAddressInstance = new Address()
			shippingAddressInstance = bindData(shippingAddressInstance,params,'shipping')
			shippingAddressInstance.party = organizationInstance
			shippingAddressInstance.save(flush:true)
			
			def billingAddressInstance = new Address()
			billingAddressInstance = bindData(billingAddressInstance,params,'billing')
			billingAddressInstance.party = organizationInstance
			billingAddressInstance.save(flush:true)
			
			def liftInfo = new LiftInfo(params)
			liftInfo.organization = organizationInstance
			liftInfo.save(flush:true)
			
			flash.message = "New Customer Added." 
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
		
		def invoicedTotal = 0.0
		def receviedGrandTotal = 0.0
		organizationInstance?.invoices?.each { it ->
			invoicedTotal += it.grandTotal
			receviedGrandTotal += it.receviedGrandTotal
		}
		
		params.totalInvoicedAmount = invoicedTotal
		params.totalReceivedAmount = receviedGrandTotal
		
		def today = new Date()
		def activeContracts = Order.withCriteria(sort: "contractToDate", order: "asc") {
			and {
				eq("type", 'SERVICE')
				eq("organization", organizationInstance)
				ge("contractToDate", today)
				le("contractFromDate", today)
			}
			maxResults(1)
		}
		
		def activeContract
		if(activeContracts?.size() > 0) {
			activeContract = activeContracts?.first()
		}
		
		def productName 
		activeContract?.orderItems?.each {
			def p = Product.findByProductNumber(it.productNumber)
			if(p?.productType == 'SERVICE' && p?.serviceContract) {
				productName = p.productName
			}
		}

        [organizationInstance: organizationInstance,params:params,activeContract:activeContract,contractName:productName]
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
			render view: '/_common/modals/createContact', model: [contactInstance: new Contact(params)]
			return
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
			def addressInstance = new Address(params)
			render view: '/_common/modals/createAddress', model: [addressInstance: addressInstance]
			return
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
			render view: '/_common/modals/createPhoneBook', [phoneBookInstance: new PhoneBook(params)]
			return
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
	
	def searchAJAX = {
		def organizations = Organization.findAllByNameLike("%${params.query}%")

		//Create XML response
		render(contentType: "text/xml") {
		results() {
				organizations.each { organization ->
				result(){
					name(organization.name)
					//Optional id which will be available in onItemSelect
					id(organization.id)
					}
				}
			}
		}
	}
	
	def convertLeadToCustomer = {
		def organization = Organization.get(params.id)
		organization.salesStatus = 'CUSTOMER'
		organization.save(flush:true)
		
		flash.message = 'Converted to Customer.'
		redirect controller: 'organization', action: 'show', id: organization?.id
	}
	
	def search() {
		def organizations = Organization.findAllByNameLike("${params.query}%")

		//Create XML response
		render(contentType: "text/xml") {
			results() {
				organizations.each { organization ->
					result(){
						name(organization.name)
						//Optional id which will be available in onItemSelect
						id(organization.id)
					}
				}
			}
		}
	}
	
	def suggest() {
		def organizations = Organization.findAllByNameLike("%${params.q}%")
		
		render(contentType:"text/json") {
			results() {
				organizations.each { organization ->
					result(){
						organization(name:organization.name,id:organization.id)						
					}
				}
			}
		}
	}
	
	def lostCustomer() {
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
				redirect controller: 'organization', action: 'show', id: organizationInstance?.id
				return
			}
			
			redirect controller: 'organization', action: 'show', id: organizationInstance?.id
		}
	}
}
