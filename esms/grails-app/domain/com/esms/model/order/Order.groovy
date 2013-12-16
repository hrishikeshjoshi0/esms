package com.esms.model.order

import com.esms.model.inventory.InventoryJournal
import com.esms.model.invoice.Invoice
import com.esms.model.party.Organization
import com.esms.model.payment.PaymentItem
import com.esms.model.product.Product
import com.esms.model.quote.Quote

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
	
	Boolean taggedForRenewal
	String renewalStage = 'NOT_MARKED_FOR_RENEWAL'
	String renewalLostReason
	
	String recepientContactName
	String recepientContactNumber
	Date receivedDateTime
	String handedOveryBy
	
	BigDecimal adjustment = new BigDecimal("0.0")
	
	BigDecimal pendingInvoiceGrandTotal = new BigDecimal("0.0")
	BigDecimal invoicedGrandTotal = new BigDecimal("0.0")
	
	String notes
	
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
		relatedTo InList:['CONTRACT','ORGANIZATION','ORDER']
		relatedToValue nullable:true,blank:true
		
		contractFromDate nullable:true,blank:true
		contractToDate nullable:true,blank:true
		invoicingIsFixedPrice nullable:true,blank:true
		invoicingIsTimesheets nullable:true,blank:true
		invoicingIsExpenses nullable:true,blank:true
		assignedTo nullable:true,blank:true
		termsAndConditions nullable:true,blank:true,length:255
		
		taggedForRenewal nullable:true
		renewalStage InList:['NOT_MARKED_FOR_RENEWAL','TAGGED_FOR_RENEWAL','RENEWAL_LETTER_SENT','RENEWAL_WON','RENEWAL_LOST']
		renewalLostReason nullable:true,blank:true,length:255
		
		recepientContactName nullable:true,blank:true
		recepientContactNumber nullable:true,blank:true
		receivedDateTime nullable:true,blank:true
		handedOveryBy nullable:true,blank:true
		
		adjustment nullable:true,blank:true
		notes nullable:true,blank:true,length:1000
    }
	
	static mapping = {
		tablePerHierarchy false
		
		table 'order_hdr'
	}
	
	def fetchServiceOrderItems() {
		def orderItems = []
		this.orderItems?.each {
			if(Product.findByProductNumber(it.productNumber)?.productType == 'SERVICE') {
				orderItems.add(it)
			}
		}
		orderItems
	}
	
	def getReceivedAmount() {
		def amountReceivablesTotal = Invoice.createCriteria().get {
			eq("referenceOrderNumber", orderNumber)
			projections {
				sum "receviedGrandTotal"
			}
		}
		
		amountReceivablesTotal?amountReceivablesTotal:0.0
	}
	
	boolean isRenewed() {
		if (relatedTo == 'ORDER' && relatedToValue) {
			return true
		}
		return false
	}
	
	def getRenewalState() {
		def renewalQuote
		if(renewalStage == 'TAGGED_FOR_RENEWAL') {
			renewalQuote = Quote.findByRelatedToAndRelatedToValue('RENEWAL',orderNumber)
		}
		
		if(!renewalQuote) {
			"Renewal Process Initiated"
		} else if(renewalQuote  && (renewalQuote?.status == 'PENDING' || renewalQuote?.status == 'ACCEPT')) {
			if(renewalQuote?.status == 'PENDING' && !renewalQuote.sent) {
				"Renewal Quote Is Not Sent."
			} else if(renewalQuote?.status == 'PENDING' && renewalQuote.sent) {
				"Renewal Quote Is Sent."
			} else if(renewalQuote?.status == 'ACCEPT') {
				"Renewal Quote Is Accepted."
			}
		} else if (renewalQuote && renewalQuote?.status == 'CONVERTED_TO_SERVICE_CONTRACT'){
			relatedToValue
		}
	}
	
	def getActiveServiceContract() {
		def productName
		orderItems?.each {
			def p = Product.findByProductNumber(it.productNumber)
			if(p.productType == 'SERVICE' && p.serviceContract) {
				productName = p.productName
				return productName
			}
		}
	}
	
}
