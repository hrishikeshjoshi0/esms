package com.esms.model.party

class PartyGroup extends Party {
	
	String groupName
	String comments
	
    static mapping = {
		table 'PARTY_GROUP'
		groupName column: 'GROUP_NAME'
		comments column: 'COMMENTS'
		
		id column: 'PARTY_ID'
    }
	
	static constraints = {
		comments maxSize: 1000
		groupName blank: false
	}
	
}
