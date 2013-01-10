package com.esms.model.party

class Address {
	
	String toName;
	
	String attnName;
	
	String buildingName;
	
	String address1;
	
	String address2;
	
	String directions;
	
	String city;
	
	String postalCode;
	
	String postalCodeExt;
	
	String country;
	
	String stateProvince;
	
	String addressType;
	
	static belongsTo = [party : Party]

    static constraints = {
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
