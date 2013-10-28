package com.esms.model.invoice

class InvoiceLine {

    int lineNumber
	BigDecimal quantity = 1.0
	BigDecimal unitPrice
	BigDecimal tax = 0.0
	BigDecimal lineTotalAmount = 0.0
	BigDecimal discount = 0.0
	String productNumber
	
	String relatedOrderNumber
	
	BigDecimal percentageInvoiced = 0.0
	BigDecimal amountInvoiced = 0.0
	
	static belongsTo = [invoice:Invoice]

    static constraints = {
		lineNumber nullable:false
		quantity nullable:false
		unitPrice nullable:false
		tax nullable:false
		lineTotalAmount nullable:false
		discount nullable:false
		productNumber nullable:false
		relatedOrderNumber nullable:true
		percentageInvoiced nullable:true
		amountInvoiced nullable:true
    }
	
	static mapping = {
		sort "lineNumber"
	}
}
