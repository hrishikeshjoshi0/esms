package com.esms.model.core

class Sequence {
	
	String type
	String description
	String prefix
	int numberValue=0

    static constraints = {
		type blank:true,nullable:true
		description maxSize: 1000,blank : true,nullable:true
		prefix blank:true,nullable:true
    }
}
