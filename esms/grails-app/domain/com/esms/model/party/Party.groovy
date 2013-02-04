package com.esms.model.party

import com.esms.model.calendar.Event;

class Party {
	
	String externalId
	String description
	String partyType
	String status

	static hasMany = [addresses:Address,phoneBooks:PhoneBook,events:Event]
	
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
