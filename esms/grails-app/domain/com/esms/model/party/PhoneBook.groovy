package com.esms.model.party

class PhoneBook {
	
	String email = ""
	String secondaryEmail = ""
	String officePhone = ""
	String mobilePhone = ""
	String homePhone = ""
	String otherPhone = ""

	static belongsTo = [party : Party]
	
    static constraints = {
		email nullable:true,blank:true
		secondaryEmail nullable:true,blank:true
		officePhone nullable:true,blank:true
		mobilePhone nullable:true,blank:true
		homePhone nullable:true,blank:true
		otherPhone nullable:true,blank:true
    }
	
}
