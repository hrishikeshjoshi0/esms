package com.esms.model.party

class PartyGroup extends Party {
	
	String name
	String description

    static constraints = {
		name nullable:false,blank:false
		description maxSize: 1000,blank : true,nullable:true
    }
	
}
