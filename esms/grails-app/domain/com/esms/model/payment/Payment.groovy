package com.esms.model.payment


class Payment {

	String paymentNumber
	String paymentMethod='CHEQUE'
	String chequeNumber
	String bank
	String branch
	String description
	BigDecimal totalAmount = 0
	BigDecimal matchedAmount = 0
	BigDecimal balanceAmount = 0
	
	static hasMany = [paymentItems : PaymentItem]
	
    static constraints = {
		paymentNumber nullable:false,blank:false
		paymentMethod nullable:false,blank:false,InList:['CASH','CHEQUE']
		chequeNumber nullable:true,blank:true
		bank nullable:true,blank:true
		branch nullable:true,blank:true
		description nullable:false,blank:false
		totalAmount nullable:false,blank:false
		balanceAmount nullable:false,blank:false
		matchedAmount nullable:false,blank:false
		description nullable:true,blank:true,length:1000
    }
}
