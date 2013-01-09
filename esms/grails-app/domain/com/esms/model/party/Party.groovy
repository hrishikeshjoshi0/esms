package com.esms.model.party

class Party {
	
	Long partyId
	String externalId
	String description
	String partyType
	String status
	String relationshipType

    static constraints = {
		description maxSize: 1000
		partyType inList: ["PERSON", "PARTY_GROUP"]
		status inList: ["PARTY_ENABLED", "PARTY_DISABLED"]
		relationshipType inList: ["LEAD_REL", "CUSTOMER_REL", "EMPLOYEE", "CONTACT_REL"]
    }
	
	static mapping = {
		table 'PARTY'
		externalId column: 'EXTERNAL_ID'
		description column: 'DESCRIPTION'
		partyType column: 'PARTY_TYPE'
		status column: 'STATUS'
		relationshipType column: 'RELATIONSHIP_TYPE'
		
		version false
		id column: 'PARTY_ID'
		tablePerHierarchy false
	}
}
