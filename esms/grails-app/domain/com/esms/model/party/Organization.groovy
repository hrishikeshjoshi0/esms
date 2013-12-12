package com.esms.model.party

import com.esms.model.invoice.Invoice;
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
	//TODO:Can be moved to a different module called PartyGroup
	String groupName
	
	static hasMany = [contacts : Contact,quotes : Quote,orders : Order,contracts : Contract,purchaseOrders : PurchaseOrder,payments:Payment,invoices:Invoice]
	
	static hasOne = [liftInfo : LiftInfo]
	
	static constraints = {
		name blank:true
		salesStatus inList: ["LEAD", "CUSTOMER","DISQUALIFIED","LOST_IN_RENEWAL"]
		liftInfo nullable:true
		purchaseOrders nullable:true
		payments nullable:true
		invoices nullable:true
		groupName nullable:true,blank:true
	}
	
	def convertLead() {
		if(this.salesStatus == 'LEAD') {
			this.salesStatus = 'CUSTOMER'
		}
	}
	
	def activeServiceContract() {
		def c = Order.createCriteria()
		def orders = c.list() {
			and {
				'in'('type', ['SERVICE'])
				and {
					ge("contractToDate", new Date())
				}
			}
		}
		
		orders?.each {
			return it
		}
	}
}
