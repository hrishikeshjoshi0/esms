package com.esms.model.core

class PicklistValue {

    String value
	String description
	
	static belongsTo = [picklist : Picklist]
	
	static constraints = {
		value nullable:false,blank:false
		description maxSize: 1000,blank : true,nullable:true
	}
}
