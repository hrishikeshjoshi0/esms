package com.esms.model.party

class Organization extends Party {

	String name
	String salesStatus
	String assignedTo
	
	static hasMany = [contacts : Contact]
	
    static constraints = {
		name blank:true
		salesStatus inList: ["LEAD", "CUSTOMER"]
    }
	
}
