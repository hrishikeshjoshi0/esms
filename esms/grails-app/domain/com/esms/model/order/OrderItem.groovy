package com.esms.model.order


class OrderItem {

    int lineNumber
	BigDecimal quantity = 1.0
	BigDecimal unitPrice
	BigDecimal tax = 0.0
	BigDecimal lineTotalAmount = 0.0
	BigDecimal discount = 0.0
	String productNumber
	
	static belongsTo = [order:Order]

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
}
