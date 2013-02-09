package com.esms.model.order

import java.util.Date;

import com.esms.model.party.Organization
import com.esms.model.sales.Contract

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
	
	String relatedTo
	String relatedToValue
	
	Date contractFromDate
	Date contractToDate
	Boolean invoicingIsFixedPrice
	Boolean invoicingIsTimesheets
	Boolean invoicingIsExpenses
	String assignedTo = 'SYSTEM'
	String termsAndConditions
	
	static hasMany = [orderItems : OrderItem, orderPartyAssignments : WorkOrderPartyAssignment, orderInventoryAssignments : WorkOrderInventoryAssignment]
	
	static belongsTo = [organization : Organization]
	
    static constraints = {
		orderNumber nullable:false,blank:false
		status InList:['DRAFT','PENDING','SALE TO INVOICE','INVOICED']
		type InList:['SALES','SERVICE','REPAIR']
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
		
		contractFromDate nullable:false
		contractToDate nullable:true
		invoicingIsFixedPrice nullable:true,blank:true
		invoicingIsTimesheets nullable:true,blank:true
		invoicingIsExpenses nullable:true,blank:true
		assignedTo nullable:true,blank:true
		termsAndConditions nullable:true,blank:true,length:255
    }
	
	static mapping = {
		tablePerHierarchy false
		
		table 'Order_Hdr'
	}
}
