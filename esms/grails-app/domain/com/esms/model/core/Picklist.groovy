package com.esms.model.core

class Picklist {

	String code
	String description
	boolean systemCreated = false
	
	static hasMany = [picklistValues:PicklistValue]

	static constraints = {
		code nullable:false,blank:false
		description maxSize: 1000,blank : true,nullable:true
		systemCreated nullable:true
	}
}
