package com.esms.model.sales

class OpportunityStatus {
	
	String name
	String description
	boolean systemCreated = false

    static constraints = {
		systemCreated nullable:true,blank:true
		name nullable:false,blank:false
		description maxSize: 1000,blank : true,nullable:true
    }
}
