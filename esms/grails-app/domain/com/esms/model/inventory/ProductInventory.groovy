package com.esms.model.inventory

import com.esms.model.order.OrderInventoryAssignment;
import com.esms.model.product.Product

class ProductInventory {
	
	BigDecimal quantityOnHand = new BigDecimal("0.0")
	BigDecimal incoming = new BigDecimal("0.0")
	BigDecimal outgoing = new BigDecimal("0.0")
	BigDecimal unitCost = new BigDecimal("0.0")
	
	Product product
	
	static hasMany = [orderInventoryAssignments : OrderInventoryAssignment]

    static constraints = {
		quantityOnHand nullable:true,blank:true
		unitCost nullable:true,blank:true
		incoming nullable:true,blank:true
		outgoing nullable:true,blank:true
		unitCost nullable:true,blank:true
    }
}
