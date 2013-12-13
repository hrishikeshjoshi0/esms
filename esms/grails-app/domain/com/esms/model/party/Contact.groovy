package com.esms.model.party

class Contact extends Party {

	String designation	
	String salutation = " ";
	String firstName;
	String middleName;
	String lastName;

	static belongsTo = [organization : Party]

    static constraints = {
		salutation nullable:true,blank:true
		firstName nullable:true,blank:true
		lastName nullable:true,blank:true
		middleName nullable:true,blank:true
		designation nullable:true,blank:true
		designation inList:['TREASURER','SECRETARY','MANAGER','CHAIRMAN']
    }
	
}
