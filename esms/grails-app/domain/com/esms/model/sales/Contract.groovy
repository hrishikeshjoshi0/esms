package com.esms.model.sales

class Contract {

	String contractNumber
	String customerNumber
	String status
	Date fromDate
	Date toDate
	Boolean invoicingIsFixedPrice
	Boolean invoicingIsTimesheets
	Boolean invoicingIsExpenses
	String assignedTo = 'SYSTEM'
	String description
	String termsAndConditions
		
    static constraints = {
		contractNumber nullable:false,blank:false
		customerNumber nullable:false,blank:false
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
	
	static mapping = {
		description type:'text'
		termsAndConditions type:'text'
	}

}
