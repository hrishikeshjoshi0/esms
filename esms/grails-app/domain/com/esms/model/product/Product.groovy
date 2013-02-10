package com.esms.model.product

import com.esms.model.inventory.ProductInventory

class Product {
	
	String productType
	String manufacturer
	Date introductionDate
	Date supportDiscontinuationDate
	Date salesDiscontinuationDate
	String productName
	String productNumber
	Boolean requiresInventory
	Boolean taxable
	Boolean isVirtual
	String comments
	
	static hasMany = [prices : ProductPrice]
	
	static hasOne = [inventory : ProductInventory]

    static constraints = {
		productName blank:false
		productNumber blank:false
		comments maxSize: 1000,blank : true
		productType InList:['STOCKABLE PRODUCT','SERVICE']
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
