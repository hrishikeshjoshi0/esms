package com.esms.model.quote

class QuoteItem {
	
	int lineNumber
	BigDecimal quantity = 1.0
	BigDecimal unitPrice
	BigDecimal tax = 0.0
	BigDecimal lineTotalAmount = 0.0
	BigDecimal discount = 0.0
	String productNumber
	String productDescription
		
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
	
	static mapping = {
		sort "lineNumber"
	}
	
	def calculateLineTotal() {
		lineTotalAmount = unitPrice * quantity + tax - discount
		lineTotalAmount
	}
}
