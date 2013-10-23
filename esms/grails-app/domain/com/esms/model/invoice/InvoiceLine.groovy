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
    }
	
	static mapping = {
		sort "lineNumber"
	}
}
