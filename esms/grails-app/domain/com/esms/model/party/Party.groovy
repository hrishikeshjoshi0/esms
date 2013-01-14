package com.esms.model.party

class Party {
	
	String externalId
	String description
	String partyType
	String status

	static hasMany = [addresses:Address,phoneBooks:PhoneBook]
	
    static constraints = {
		externalId blank:false
		status inList: ["ACTIVE","INACTIVE"]
		description maxSize: 1000,blank : true
		partyType inList: ["CONTACT","ORGANIZATION"]
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
