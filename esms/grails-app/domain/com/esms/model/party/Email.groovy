package com.esms.model.party

class Email {

    String email
	String type

	static belongsTo = [party : Party]
	
    static constraints = {
		email nullable:false,blank:false
		type nullable:false,blank:false
    }
}
