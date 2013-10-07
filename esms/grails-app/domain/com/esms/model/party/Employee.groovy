package com.esms.model.party

class Employee extends Party {
	
	String firstName;
	String middleName;
	String lastName;
	BigDecimal previousExperience
	BigDecimal salary
	String benefits
	String skillLevel
	Date employmentStartDate
	Date employmentEndDate
	
	static constraints = {
		firstName blank:false,nullable:false
		lastName blank:true,nullable:true
		middleName blank:true,nullable:true
		previousExperience blank:true,nullable:true
		salary blank:true,nullable:true
		benefits maxSize: 1000,blank : true,nullable:true
		skillLevel InList: ["EXPERT","SEMI SKILLED","UNSKILLED"]
		employmentStartDate blank:false,nullable:false
		employmentEndDate blank:true,nullable:true
    }
}
