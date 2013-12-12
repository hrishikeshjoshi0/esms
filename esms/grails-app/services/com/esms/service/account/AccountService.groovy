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
		
		return organization
	}
	
    def saveOrUpdateAccount(Organization organization,Address... addresses, Contact... contacts,LiftInfo liftInfo) {
		contacts?.each { contactInstance ->
			contactInstance.organization = organization
			contactInstance.description = ''
		}
		
		addresses?.each { addressInstance ->
			addressInstance.party = organization
		}
		
		liftInfo.organization = organization
		
		if(!organization.validate()) {
			return
		}
		
		organization.save(flush:true)
		return organization
    }
}
