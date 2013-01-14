package com.esms.model.party

class Contact extends Party {
	
	String salutation;
	String firstName;
	String middleName;
	String lastName;

	static belongsTo = [organization : Party]

    static constraints = {
		salutation salutation:true
		firstName blank:false
		lastName blank:true
		middleName blank:true
    }
	
}
