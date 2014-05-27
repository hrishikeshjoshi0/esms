package com.esms.model.sales

import com.esms.model.party.Party

class Opportunity {
	
	String name
	String type
	Date addedDate
	Date expiryDate
	BigDecimal estimatedAmount
	BigDecimal actualAmount
	String description
	
	Party party
	
	OpportunityStatus status
	
    static constraints = {
		name blank:true,nullable:true
		type blank:true,nullable:true
		addedDate blank:true,nullable:true
		expiryDate blank:true,nullable:true
		party nullable:false 
		status nullable:false
		estimatedAmount blank:true,nullable:true
		actualAmount blank:true,nullable:true
		description maxSize: 1000,blank : true,nullable:true
    }
}
