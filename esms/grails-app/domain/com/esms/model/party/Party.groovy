package com.esms.model.party

class Party {
	
	String externalId
	String description
	String partyType
	String status

	static hasMany = [addresses:Address,phoneBooks:PhoneBook]
	
    static constraints = {
		description maxSize: 1000
		partyType inList: ["CONTACT","ORGANIZATION"]
		status inList: ["ACTIVE","INACTIVE"]
		externalId blank:false
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
