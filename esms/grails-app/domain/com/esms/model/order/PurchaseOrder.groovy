package com.esms.model.order

import com.esms.model.inventory.InventoryJournal
import com.esms.model.party.Organization

class PurchaseOrder {
	
	String purchaseOrderNumber
	String status
	String type
	String description
	Date issueDate = new Date()
	Date expiryDate
	
	BigDecimal totalAmount = new BigDecimal("0.0")
	BigDecimal totalTax = new BigDecimal("0.0")
	BigDecimal totalDiscount = new BigDecimal("0.0")
	BigDecimal grandTotal = new BigDecimal("0.0")
	
	String termsAndConditions
	
	//TODO HRISHI/NACHI : Change this to use belongsTo when a seperate module for Vendors is maintained.
	String vendorName
	String contactName
	
	BigDecimal openGrandTotal = new BigDecimal("0.0")
	BigDecimal paidGrandTotal = new BigDecimal("0.0")
	
	BigDecimal workCompleted
	 
	static hasMany = [purchaseOrderItems:PurchaseOrderItem,inventoryJournalEntries : InventoryJournal]
	
	static belongsTo = [organization : Organization]
	
    static constraints = {
		purchaseOrderNumber nullable:false,blank:false
		status InList:['NOT_STARTED','IN_PROGRESS','ON_HOLD','COMPLETE']
		type nullable:true
		description nullable:true,blank:true
		issueDate nullable:false
		expiryDate nullable:true
		totalAmount nullable:false
		totalTax nullable:false
		totalDiscount nullable:false
		grandTotal nullable:false
		termsAndConditions nullable:true,blank:true,length:255
		
		vendorName nullable:true,blank:true
		contactName nullable:true,blank:true
		
		organization nullable:true
    }
	
	static mapping = {
		tablePerHierarchy false
		
		table 'purchase_order_hdr'
	}
}
