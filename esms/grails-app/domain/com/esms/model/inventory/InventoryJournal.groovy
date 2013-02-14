package com.esms.model.inventory

import com.esms.model.order.Order

class InventoryJournal {
	
	String status
	BigDecimal quantity
	Boolean isPosted = false

    static constraints = {
		status nullable:false,blank:false
		quantity nullable:false,blank:false
    }
	
	static belongsTo = [order : Order, productInventory : ProductInventory]
	
}
