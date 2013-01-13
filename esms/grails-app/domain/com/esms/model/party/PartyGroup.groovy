package com.esms.model.party

class PartyGroup extends Party {
	
	String groupName

	static mapping = {
    }
	
	static constraints = {
		groupName blank: false
	}
	
}
