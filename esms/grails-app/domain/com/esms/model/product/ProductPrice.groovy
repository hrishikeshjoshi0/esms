package com.esms.model.product

class ProductPrice {
	
	Date fromDate = new Date()
	Date toDate
	BigDecimal price
	
	static belongsTo = [product : Product]

    static constraints = {
    }
	
}
