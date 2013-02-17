package com.esms.model.payment

class Payment {

	String paymentNumber
	String paymentType = "CASH"
	String checkNumber
	String status
	String description
	BigDecimal totalAmount = 0
	BigDecimal paidAmount = 0
	BigDecimal balanceAmount = 0
	
	static hasMany = [paymentItems : PaymentItem]
	
    static constraints = {
		
		paymentNumber nullable:false,blank:false
		paymentType InList:['CASH','CHECK','OTHER']
		checkNumber nullable:false,blank:false
		status nullable:false,blank:false
		description nullable:false,blank:false
		totalAmount nullable:false,blank:false
		balanceAmount nullable:false,blank:false
		
    }
}
