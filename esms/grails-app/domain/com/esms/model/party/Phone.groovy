package com.esms.model.party

class Phone {

	String phoneNumber
	String type

	static belongsTo = [party : Party]
	
    static constraints = {
		phoneNumber nullable:false,blank:false
		type nullable:false,blank:false
    }
	
}
