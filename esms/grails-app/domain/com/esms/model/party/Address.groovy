package com.esms.model.party

class Address {
	
	private int addressBookId;
	
	private String toName;
	
	private String attnName;
	
	private String buildingName;
	
	private String address1;
	
	private String address2;
	
	private String directions;
	
	private String city;
	
	private String postalCode;
	
	private String postalCodeExt;
	
	private String country;
	
	private String stateProvince;
	
	private String addressType;

    static constraints = {
    }
	
	static mapping = {
		table 'PARTY_ADDRESS'

						
		version false
		id column: 'ADDRESS_BOOK_ID'
		tablePerHierarchy false
	}
}
