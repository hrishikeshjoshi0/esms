package com.esms.model.inventory

class InventoryItem {
	
	String inventoryItemType
	String productNumber
	String status
	Date dateReceived
	Date dateManufactured
	Date expireDate
	String lotId
	String uomId
	String comments
	BigDecimal quantityOnHandTotal
	BigDecimal availableToPromiseTotal
	BigDecimal quantityOnHand
	BigDecimal availableToPromise
	String serialNumber
	BigDecimal unitCost

    static constraints = {
		inventoryItemType nullable:true,blank:true
		productNumber nullable:false,blank:false
		status InList:['ACTIVE','INACTIVE']
		dateReceived nullable:false,blank:false
		dateManufactured nullable:true,blank:true
		expireDate nullable:true,blank:true
		lotId nullable:true,blank:true
		uomId nullable:true,blank:true
		comments nullable:true,blank:true
		quantityOnHandTotal nullable:true,blank:true
		availableToPromiseTotal nullable:true,blank:true
		quantityOnHand nullable:true,blank:true
		availableToPromise nullable:true,blank:true
		serialNumber nullable:true,blank:true
		unitCost nullable:true,blank:true
    }
}
