package com.esms.model.party

import com.esms.model.maintenance.LiftInfo
import com.esms.model.order.Order
import com.esms.model.order.PurchaseOrder
import com.esms.model.payment.Payment;
import com.esms.model.quote.Quote
import com.esms.model.sales.Contract

class Organization extends Party {

	static searchable = true
	
	String name
	String salesStatus
	String assignedTo = 'SYSTEM'
	boolean isOneTimeCustomer = false
	
	static hasMany = [contacts : Contact,quotes : Quote,orders : Order,contracts : Contract,purchaseOrders : PurchaseOrder,payments:Payment]
	
	static hasOne = [liftInfo : LiftInfo]
	
    static constraints = {
		name blank:true
		salesStatus inList: ["LEAD", "CUSTOMER","DISQUALIFIED"]
		liftInfo nullable:true
		purchaseOrders nullable:true 
		payments nullable:true
    }
	
	def convertLead() {
		if(this.salesStatus == 'LEAD') {
			this.salesStatus = 'CUSTOMER'
		}
	}
	
}
