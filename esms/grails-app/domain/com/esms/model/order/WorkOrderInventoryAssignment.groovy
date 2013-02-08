package com.esms.model.order

class WorkOrderInventoryAssignment {
	
	String inventoryItemNumber
	String status
	BigDecimal quantity

    static constraints = {
		inventoryItemNumber nullable:false,blank:false
		status nullable:false,blank:false
		quantity nullable:false,blank:false
    }
	
	static belongsTo = [order : Order]
	
}
