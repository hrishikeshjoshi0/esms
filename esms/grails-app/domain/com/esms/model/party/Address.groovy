package com.esms.model.party

class Address {
	
	String buildingName;
	
	String address1;
	
	String address2;
	
	String city;
	
	String postalCode;
	
	String country = "India";
	
	String state = "Maharashtra";
	
	String addressType;
	
	static belongsTo = [party : Party]

    static constraints = {
		address1 blank:false
		addressType inList:['SHIPPING','BILLING']
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
