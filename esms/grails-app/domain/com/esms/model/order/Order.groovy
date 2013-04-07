package com.esms.model.order

import com.esms.model.inventory.InventoryJournal
import com.esms.model.party.Organization
import com.esms.model.payment.PaymentItem

class Order {

    String orderNumber
	String status = "PENDING_INVOICE"
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
	
	BigDecimal openGrandTotal = new BigDecimal("0.0")
	BigDecimal receviedGrandTotal = new BigDecimal("0.0")
	 
	static hasMany = [orderItems : OrderItem,inventoryJournalEntries : InventoryJournal,paymentItems : PaymentItem]
	
	static belongsTo = [organization : Organization]
	
    static constraints = {
		orderNumber nullable:false,blank:false
		status InList:['PENDING_INVOICE','CONFIRM_SALE','DELIVERY_PENDING','DELIVERED','INVOICED','PAID']
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
