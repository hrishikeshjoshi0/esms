package com.esms.model.party

class PartyStatus {
	
	String name
	String description
	boolean systemCreated = false

    static constraints = {
		name nullable:false,blank:false
		systemCreated nullable:true,blank:true
		description maxSize: 1000,blank : true,nullable:true
    }
}
