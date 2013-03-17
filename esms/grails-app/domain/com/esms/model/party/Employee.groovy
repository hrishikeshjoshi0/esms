package com.esms.model.party

class Employee extends Party {
	
	String firstName;
	String middleName;
	String lastName;
	BigDecimal previousExperience
	BigDecimal salary
	String benefits
	String skillLevel
	
	static constraints = {
		firstName blank:false,null:false
		lastName blank:true,null:true
		middleName blank:true,null:true
		previousExperience blank:true,null:true
		salary blank:true,null:true
		benefits maxSize: 1000,blank : true,null:true
		skillLevel InList: ["EXPERT","SEMI SKILLED","UNSKILLED"]
    }
}
