package com.esms.service.account

import com.esms.model.maintenance.LiftInfo
import com.esms.model.party.Address
import com.esms.model.party.Contact
import com.esms.model.party.Organization
import com.esms.model.party.Party
import com.esms.model.party.PhoneBook
import com.esms.model.product.Product;

class AccountService {

	def utilService
	
	def Organization createNewAccount(params) {
		params.externalId = utilService.newOrganizationNumber()
		
		def organization = new Organization()
		organization.properties = params
		
		if(!organization.description) {
			organization.description = ""
		}
		
		organization.salesStatus = "CUSTOMER"
		organization.partyType = "ORGANIZATION"
		
		return organization
	}
	
	def Contact createNewContact(params) {
		def contact = new Contact(params)
		contact.properties = params
		contact.externalId = utilService.newContactNumber()
		
		if(!contact.description) {
			contact.description = ""
		}
		
		contact.partyType = "CONTACT"
		
		return contact
	}
	
    def saveOrUpdateAccount(Organization organization) {
		if(!organization.validate()) {
			return organization
		}
		
		organization.save(flush:true)
		return organization
    }
}
