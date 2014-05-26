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
	
	String area;
	
	String route;
	
	String landmark;
	
	static belongsTo = [party : Party]
	
	AddressType type

    static constraints = {
		address1 blank:false
		address2 nullable:true,blank:true
		addressType inList:['SHIPPING','BILLING','RESIDENTIAL','CARE-OFF']
		city nullable:true,blank:true
		state nullable:true,blank:true
		postalCode nullable:true,blank:true
		area nullable:true,blank:true
		route nullable:true,blank:true
		landmark nullable:true,blank:true
		type nullable:true
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
