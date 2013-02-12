package com.esms.model.order

import com.esms.model.inventory.ProductInventory;

class OrderInventoryAssignment {
	
	String status
	BigDecimal quantity
	Boolean isPosted = false

    static constraints = {
		status nullable:false,blank:false
		quantity nullable:false,blank:false
    }
	
	static belongsTo = [order : Order, productInventory : ProductInventory]
	
}
