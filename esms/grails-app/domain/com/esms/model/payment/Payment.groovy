package com.esms.model.payment


class Payment {

	String paymentNumber
	String paymentType = "CASH"
	String chequeNumber
	String bank
	String branch
	String status
	String description
	BigDecimal totalAmount = 0
	BigDecimal paidAmount = 0
	BigDecimal balanceAmount = 0
	
	static hasMany = [paymentItems : PaymentItem]
	
    static constraints = {
		paymentNumber nullable:false,blank:false
		paymentType InList:['CASH','CHEQUE','OTHER']
		chequeNumber nullable:false,blank:false
		bank nullable:false,blank:false
		branch nullable:false,blank:false
		status nullable:false,blank:false
		description nullable:false,blank:false
		totalAmount nullable:false,blank:false
		balanceAmount nullable:false,blank:false
    }
}
