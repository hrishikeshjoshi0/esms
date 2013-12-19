package com.esms.model.party

import com.esms.model.invoice.Invoice
import com.esms.model.maintenance.LiftInfo
import com.esms.model.order.Order
import com.esms.model.order.PurchaseOrder
import com.esms.model.payment.Payment
import com.esms.model.product.Product
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
	String lostReason
	
	static hasMany = [contacts : Contact,quotes : Quote,orders : Order,contracts : Contract,purchaseOrders : PurchaseOrder,payments:Payment,invoices:Invoice]
	
	static hasOne = [liftInfo : LiftInfo]
	
	static constraints = {
		name blank:true
		salesStatus inList: ["LEAD", "CUSTOMER","DISQUALIFIED","LOST_IN_RENEWAL","LOST"]
		liftInfo nullable:true
		purchaseOrders nullable:true
		payments nullable:true
		invoices nullable:true
		groupName nullable:true,blank:true
		lostReason nullable:true,blank:true
	}
	
	def convertLead() {
		if(this.salesStatus == 'LEAD') {
			this.salesStatus = 'CUSTOMER'
		}
	}
	
	def String activeServiceContract() {
		Date today = new Date()
		def activeContracts = Order.withCriteria(sort: "contractToDate", order: "asc") {
			and {
				eq("type", 'SERVICE')
				eq("organization", this)
				ge("contractToDate", today)
				le("contractFromDate", today)
			}
			maxResults(1)
		}
		
		def activeContract
		if(activeContracts?.size() > 0) {
			activeContract = activeContracts?.first()
		}
		
		def productName
		activeContract?.orderItems?.each {
			def p = Product.findByProductNumber(it.productNumber)
			if(p?.productType == 'SERVICE' && p?.serviceContract) {
				productName = p.productName
			}
		}
		
		return productName
	}
}
