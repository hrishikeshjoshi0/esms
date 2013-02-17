package com.esms.model.payment

class PaymentItem {
	
	int lineNumber
	String orderNumber
	BigDecimal amount
	String description
		
	static belongsTo = [payment : Payment]

    static constraints = {
		
		lineNumber nullable:false,blank:false
		orderNumber nullable:false,blank:false
		amount nullable:false,blank:false
		description nullable:false,blank:false
    }
}
