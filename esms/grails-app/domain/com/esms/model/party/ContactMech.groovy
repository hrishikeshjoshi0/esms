package com.esms.model.party

class ContactMech {
	
	String purpose;

	String type;

	String infoString;

	static belongsTo = [party : Party]
	
    static constraints = {
    }
}
