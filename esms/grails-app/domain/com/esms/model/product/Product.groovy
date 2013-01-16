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
	
	static hasMany = [prices : ProductPrice]

    static constraints = {
		productName blank:false
		comments maxSize: 1000,blank : true
		productType nullable:true,blank : true
		manufacturer nullable:true,blank : true
		introductionDate nullable:true,blank:true
		supportDiscontinuationDate nullable:true,blank:true
		salesDiscontinuationDate nullable:true,blank:true
		requiresInventory nullable:true,blank:true
		taxable nullable:true,blank:true
		isVirtual nullable:true,blank:true
		comments nullable:true,blank:true
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
