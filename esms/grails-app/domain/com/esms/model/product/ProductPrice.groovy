package com.esms.model.product

class ProductPrice {
	
	Date fromDate = new Date()
	Date toDate 
	BigDecimal price
	String uom = "EACH"
	
	static belongsTo = [product : Product]

    static constraints = {
		uom nullable:true,blank:true
    }
	
}
