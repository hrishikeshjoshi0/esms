package com.esms.model.party

import com.esms.model.calendar.Event
import com.lucastex.grails.fileuploader.UFile

class Party {
	
	String externalId
	String description
	
	PartyType type
	PartyGroup group
	PartyStatus status

	//For faster searching.
	String partyType
	String groupName
	String partyStatus

	static hasMany = [addresses:Address,phones:Phone,emails:Email,events:Event,documents:UFile]
	
    static constraints = {
		externalId blank:false
		description maxSize: 1000,blank : true,nullable:true
		partyType nullable:false,blank:false
		groupName nullable:true,blank:true
		groupName nullable:false,blank:false
		type nullable:false
		status nullable:false
		group nullable:true
    }
	
	static mapping = {
		tablePerHierarchy false
	}
	
	static auditable = true
}
