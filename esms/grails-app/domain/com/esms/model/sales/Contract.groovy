package com.esms.model.sales

import com.esms.model.order.Order
import com.esms.model.party.Organization
import com.esms.model.quote.Quote

class Contract {
	
	String contractNumber
	String status
	Date fromDate
	Date toDate
	Boolean invoicingIsFixedPrice
	Boolean invoicingIsTimesheets
	Boolean invoicingIsExpenses
	String assignedTo = 'SYSTEM'
	String description
	String termsAndConditions
	
	Quote quote
	Order order
		
    static constraints = {
		contractNumber nullable:false,blank:false
		status InList:['NEW','PENDING','FINISHED','CANCEL']
		fromDate nullable:false
		toDate nullable:true
		invoicingIsFixedPrice nullable:true,blank:true 
		invoicingIsTimesheets nullable:true,blank:true
		invoicingIsExpenses nullable:true,blank:true
		assignedTo nullable:true,blank:true
		description nullable:true,blank:true
		termsAndConditions nullable:true,blank:true
    }
	
	static belongsTo = [organization : Organization]
	
	static mapping = {
		description type:'text'
		termsAndConditions type:'text'
	}

}
