package com.esms.model.party

class Party {
	
	String externalId
	String description
	String partyType
	String status
	String relationshipType

	static hasMany = [addresses : Address,contactMechs:ContactMech]
	
    static constraints = {
		description maxSize: 1000
		partyType inList: ["PERSON", "PARTY_GROUP"]
		status inList: ["PARTY_ENABLED", "PARTY_DISABLED"]
		relationshipType inList: ["LEAD_REL", "CUSTOMER_REL", "EMPLOYEE", "CONTACT_REL"]
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
