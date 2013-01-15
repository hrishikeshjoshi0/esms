package com.esms.model.product

class Product {
	
	String productType
	String manufacturer
	Date introductionDate
	Date supportDiscontinuationDate
	Date salesDiscontinuationDate
	String internalName
	String brandName
	String comments
	String productName
	Boolean requiresInventory
	BigDecimal quantityIncluded
	BigDecimal piecesIncluded
	Boolean requireAmount
	BigDecimal fixedAmount
	BigDecimal weight
	BigDecimal height
	BigDecimal width
	BigDecimal depth
	Boolean taxable
	Boolean chargeShipping
	Boolean isVirtual

    static constraints = {
		productName blank:false
		comments maxSize: 1000,blank : true
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
