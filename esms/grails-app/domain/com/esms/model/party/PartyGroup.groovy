package com.esms.model.party

class PartyGroup extends Party {
	
	String groupName
	String comments
	
    static mapping = {
    }
	
	static constraints = {
		comments maxSize: 1000
		groupName blank: false
	}
	
}
