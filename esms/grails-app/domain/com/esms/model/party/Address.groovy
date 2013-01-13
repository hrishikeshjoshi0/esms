package com.esms.model.party

class Address {
	
	String buildingName;
	
	String address1;
	
	String address2;
	
	String city;
	
	String postalCode;
	
	String country;
	
	String state;
	
	String addressType;
	
	static belongsTo = [party : Party]

    static constraints = {
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
