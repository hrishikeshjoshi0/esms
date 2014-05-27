package com.esms.model.sales

class OpportunityStatus {
	
	String name
	String description

    static constraints = {
		name nullable:false,blank:false
		description maxSize: 1000,blank : true,nullable:true
    }
}
