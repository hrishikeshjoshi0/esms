package com.esms.model.payment

import com.esms.model.order.Order

class PaymentItem {
	
	int lineNumber
	BigDecimal amount
	String description
		
	static belongsTo = [payment : Payment,order: Order]
	
    static constraints = {
		lineNumber nullable:false,blank:false
		amount nullable:false,blank:false
		description nullable:true,blank:true
    }
}
