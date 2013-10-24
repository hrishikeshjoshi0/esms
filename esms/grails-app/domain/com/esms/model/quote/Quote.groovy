package com.esms.model.quote

import com.esms.model.party.Organization
import com.esms.model.product.Product

class Quote {
	
	String quoteNumber
	String quoteName
	String status = "DRAFT"
	String type
	String description
	String salesChannel
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
	String assignedTo
	String termsAndConditions
	
	String recepientContactName
	String recepientContactNumber
	Date receivedDateTime
	String handedOveryBy
	
	String declinedReason
	String revisedReason
	
	boolean sent = false
	
	BigDecimal quotedGrandTotal = new BigDecimal("0.0")
	BigDecimal negotiatedGrandTotal = new BigDecimal("0.0")
	String notes
	
	static hasMany = [quoteItems : QuoteItem]
	
	static belongsTo = [organization : Organization]

    static constraints = {
		quoteNumber nullable:false,blank:false
		quoteName nullable:false,blank:false
		status InList:['DRAFT','PENDING','REVISE','ACCEPT','DECLINE','CONVERTED_TO_SERVICE_CONTRACT','CONVERTED_TO_REPAIR_SALES_ORDER','LOST','DISQUALIFIED']
		type InList:['CONTRACT','REPAIR','MODERNIZATION','INSTALLATION']
		salesChannel blank:false
		description nullable:true,blank:true
		contactName nullable:true,blank:true
		totalAmount nullable:false
		totalTax nullable:false
		totalDiscount nullable:false
		grandTotal nullable:false
		relatedTo nullable:true,InList:['CONTRACT CUSTOMER','NON CONTRACT CUSTOMER']
		relatedToValue nullable:true,blank:true
		
		contractFromDate nullable:true,blank:true
		contractToDate nullable:true,blank:true
		invoicingIsFixedPrice nullable:true,blank:true 
		invoicingIsTimesheets nullable:true,blank:true
		invoicingIsExpenses nullable:true,blank:true
		assignedTo nullable:true,blank:true
		termsAndConditions nullable:true,blank:true,length:255
		declinedReason nullable:true,blank:true,length:1000
		revisedReason nullable:true,blank:true,length:1000
		
		recepientContactName nullable:true,blank:true
		recepientContactNumber nullable:true,blank:true
		receivedDateTime nullable:true,blank:true
		handedOveryBy nullable:true,blank:true
		
		quotedGrandTotal nullable:false
		negotiatedGrandTotal nullable:false
		notes nullable:true,blank:true,length:1000
    }
	
	static mapping = {
		quoteItems sort:'lineNumber'
	}
	
	def fetchServiceQuoteItems() {
		def quoteItems = []
		this.quoteItems?.each {
			if(Product.findByProductNumber(it.productNumber)?.productType == 'SERVICE') {
				quoteItems.add(it)
			}
		}
		quoteItems
	}
	
}
