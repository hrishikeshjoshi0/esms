package com.esms.model.invoice

import com.esms.model.party.Organization
import com.esms.model.payment.PaymentItem

class Invoice {

    String invoiceNumber
	String status = "CREATED"
	String type
	String description
	Date issueDate = new Date()
	Date expiryDate
	String contactName
	BigDecimal totalAmount = new BigDecimal("0.0")
	BigDecimal totalTax = new BigDecimal("0.0")
	BigDecimal totalDiscount = new BigDecimal("0.0")
	BigDecimal grandTotal = new BigDecimal("0.0")
	String referenceQuoteNumber
	String referenceOrderNumber
	
	Date contractFromDate
	Date contractToDate
	
	String assignedTo = 'SYSTEM'
	String termsAndConditions
	
	BigDecimal openGrandTotal = new BigDecimal("0.0")
	BigDecimal receviedGrandTotal = new BigDecimal("0.0")
	
	String relatedTo
	String relatedToValue
	 
	static hasMany = [invoiceLines:InvoiceLine,paymentItems : PaymentItem]
	
	static belongsTo = [organization : Organization]
	
    static constraints = {
		invoiceNumber nullable:false,blank:false
		status InList:['CREATED','SENT','CLOSED','PENDING','OVERDUE']
		type InList:['SALES','SERVICE','REPAIR','MODERNIZATION','INSTALLATION']
		description nullable:true,blank:true
		issueDate nullable:false
		expiryDate nullable:true
		contactName nullable:true,blank:true
		totalAmount nullable:false
		totalTax nullable:false
		totalDiscount nullable:false
		grandTotal nullable:false
		referenceQuoteNumber nullable:true,blank:true
		relatedTo InList:['CONTRACT','ORGANIZATION']
		relatedToValue nullable:true,blank:true
		
		contractFromDate nullable:true,blank:true
		contractToDate nullable:true,blank:true
		assignedTo nullable:true,blank:true
		termsAndConditions nullable:true,blank:true,length:255
    }
	
	static mapping = {
		tablePerHierarchy false
		invoiceLines sort:'lineNumber'
	}
	
}
