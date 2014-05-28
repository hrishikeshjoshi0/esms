package com.esms.model.party

class PartyType {
	
	String name
	String description
	boolean systemCreated
	
    static constraints = {
		name nullable:false,blank:false
		systemCreated nullable:true,blank:true
		description maxSize: 1000,blank : true,nullable:true
    }
}
