package com.esms.model.party

class Contact extends Party {
	
	String salutation;
	String firstName;
	String middleName;
	String lastName;
	String gender;
	Date birthDate;

	static belongsTo = [organization : Party]

    static constraints = {
		firstName blank:false
    }
	
}
