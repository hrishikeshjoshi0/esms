package com.esms.model.party

import com.esms.model.order.Order
import com.esms.model.quote.Quote

class Organization extends Party {

	String name
	String salesStatus
	String assignedTo
	
	static hasMany = [contacts : Contact,quotes : Quote,orders : Order]
	
    static constraints = {
		name blank:true
		salesStatus inList: ["LEAD", "CUSTOMER"]
    }
	
}
