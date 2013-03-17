package com.esms.model.party

import com.esms.model.calendar.Event;

class Party {
	
	String externalId
	String description
	String partyType

	static hasMany = [addresses:Address,phoneBooks:PhoneBook,events:Event]
	
    static constraints = {
		externalId blank:false
		description maxSize: 1000,blank : true,null:true
		partyType inList: ["CONTACT","ORGANIZATION","EMPLOYEE"]
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
