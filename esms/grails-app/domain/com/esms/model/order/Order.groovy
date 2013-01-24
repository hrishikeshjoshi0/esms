package com.esms.model.order

import com.esms.model.party.Organization

class Order {

    String orderNumber
	String status = "DRAFT"
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
	
	static hasMany = [orderItems : OrderItem]
	
	static belongsTo = [organization : Organization]

    static constraints = {
		orderNumber nullable:false,blank:false
		status InList:['DRAFT','PENDING','SENT','REVISE','ACCEPT','DECLINE']
		type InList:['SERVICE','REPAIR']
		description nullable:true,blank:true
		issueDate nullable:false
		expiryDate nullable:true
		contactName nullable:true,blank:true
		totalAmount nullable:false
		totalTax nullable:false
		totalDiscount nullable:false
		grandTotal nullable:false
		referenceQuoteNumber nullable:true,blank:true
    }
	
	static mapping = {
		tablePerHierarchy false
		
		table 'Order_Hdr'
	}
}
