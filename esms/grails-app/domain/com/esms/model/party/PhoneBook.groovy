package com.esms.model.party

class PhoneBook {
	
	String email
	String secondaryEmail
	String officePhone
	String mobilePhone
	String homePhone
	String otherPhone

	static belongsTo = [party : Party]
	
    static constraints = {
    }
	
}
