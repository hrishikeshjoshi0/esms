package com.esms.model.order

import com.esms.model.party.Party

class WorkOrderPartyAssignment {
	
	String partyExternalId
	String roleType
	String assignedByUserLoginId
	String status
	String expectation
	String delegateReason
	String availibilityStatus
	Date fromDate
	Date toDate
	String comments
	
	static belongsTo = [order : Order]
	
    static constraints = {
		partyExternalId nullable:false,blank:false
		roleType InList:['TECHNICIAN']
		assignedByUserLoginId nullable:true,blank:true
		status InList:['NOT STARTED','IN PROGRESS','COMPLETE']
		expectation nullable:true,blank:true
		delegateReason nullable:true,blank:true
		availibilityStatus InList:['AVAILABLE','NOT AVAILABLE']
		fromDate nullable:false,blank:false
		toDate nullable:false,blank:false
		comments nullable:true,blank:true
    }
	
	static mapping = {
		comments type: 'text' 
	}
}
