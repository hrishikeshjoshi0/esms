package com.esms.model.quote

class QuoteItem {
	
	int lineNumber
	BigDecimal quantity
	BigDecimal unitPrice
	BigDecimal tax
	BigDecimal lineTotalAmount
	BigDecimal discount
	String productNumber
	
	static belongsTo = [quote:Quote]

    static constraints = {
		lineNumber nullable:false
		quantity nullable:false
		unitPrice nullable:false
		tax nullable:false
		lineTotalAmount nullable:false
		discount nullable:false
		productNumber nullable:false
    }
}
