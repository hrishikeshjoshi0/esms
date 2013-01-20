package com.esms.model.quote

import org.grails.datastore.gorm.finders.MethodExpression.InList;

import com.esms.model.party.Organization;

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
	
	static hasMany = [quoteItems : QuoteItem]
	
	static belongsTo = [organization : Organization]

    static constraints = {
		quoteName nullable:false,blank:false
		status InList:['DRAFT','SENT','REVISE','ACCEPT','DECLINE']
		type blank:false
		salesChannel blank:false
		description nullable:true,blank:true
		issueDate nullable:false
		expiryDate nullable:true
		contactName nullable:true,blank:true
		totalAmount nullable:false
		totalTax nullable:false
		totalDiscount nullable:false
		grandTotal nullable:false
    }
	
	static mapping = {
		quoteItems sort:'lineNumber'
	}
	
}
