package com.esms.model.quote

import java.util.Date;

import org.grails.datastore.gorm.finders.MethodExpression.InList;

import com.esms.model.party.Organization;
import com.esms.model.sales.Contract;

class Quote {
	
	String quoteName
	String status = "DRAFT"
	String type
	String description
	String salesChannel
	Date issueDate = new Date()
	Date expiryDate
	String contactName
	BigDecimal totalAmount = new BigDecimal("0.0")
	BigDecimal totalTax = new BigDecimal("0.0")
	BigDecimal totalDiscount = new BigDecimal("0.0")
	BigDecimal grandTotal = new BigDecimal("0.0")
	
	String relatedTo
	String relatedToValue
	
	Date contractFromDate
	Date contractToDate
	Boolean invoicingIsFixedPrice
	Boolean invoicingIsTimesheets
	Boolean invoicingIsExpenses
	String assignedTo = 'SYSTEM'
	String termsAndConditions
	
	static hasMany = [quoteItems : QuoteItem]
	
	static belongsTo = [organization : Organization]

    static constraints = {
		quoteName nullable:false,blank:false
		status InList:['DRAFT','PENDING','SENT','REVISE','ACCEPT','DECLINE']
		type InList:['CONTRACT','REPAIR']
		salesChannel blank:false
		description nullable:true,blank:true
		issueDate nullable:false
		expiryDate nullable:true
		contactName nullable:true,blank:true
		totalAmount nullable:false
		totalTax nullable:false
		totalDiscount nullable:false
		grandTotal nullable:false
		relatedTo nullable:true,InList:['CONTRACT','ORGANIZATION']
		relatedToValue nullable:true,blank:true
		
		contractFromDate nullable:true,blank:true
		contractToDate nullable:true,blank:true
		invoicingIsFixedPrice nullable:true,blank:true 
		invoicingIsTimesheets nullable:true,blank:true
		invoicingIsExpenses nullable:true,blank:true
		assignedTo nullable:true,blank:true
		termsAndConditions nullable:true,blank:true,length:255
    }
	
	static mapping = {
		quoteItems sort:'lineNumber'
	}
	
}
