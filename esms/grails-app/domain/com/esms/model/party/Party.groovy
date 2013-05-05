package com.esms.model.party

import com.esms.model.calendar.Event;
import com.lucastex.grails.fileuploader.UFile;

class Party {
	
	String externalId
	String description
	String partyType

	static hasMany = [addresses:Address,phoneBooks:PhoneBook,events:Event,documents:UFile]
	
    static constraints = {
		externalId blank:false
		description maxSize: 1000,blank : true,null:true
		partyType inList: ["CONTACT","ORGANIZATION","EMPLOYEE"]
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
