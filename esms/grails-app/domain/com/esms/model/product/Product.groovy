package com.esms.model.product

class Product {
	
	String productType
	String manufacturer
	Date introductionDate
	Date supportDiscontinuationDate
	Date salesDiscontinuationDate
	String productName
	Boolean requiresInventory
	Boolean taxable
	Boolean isVirtual
	String comments

    static constraints = {
		productName blank:false
		comments maxSize: 1000,blank : true
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
