package com.esms.service.account

import com.esms.model.order.Order
import com.esms.model.order.OrderItem
import com.esms.model.party.Contact
import com.esms.model.party.Organization
import com.esms.model.product.Product

class AccountService {

	def utilService
	
	def Organization createNewAccount(params) {
		params.externalId = utilService.newOrganizationNumber()
		
		def organization = new Organization()
		organization.properties = params
		
		if(!organization.description) {
			organization.description = ""
		}
		
		organization.salesStatus = "CUSTOMER"
		organization.partyType = "ORGANIZATION"
		
		return organization
	}
	
	def Contact createNewContact(params) {
		def contact = new Contact(params)
		contact.properties = params
		contact.externalId = utilService.newContactNumber()
		
		if(!contact.description) {
			contact.description = ""
		}
		
		contact.partyType = "CONTACT"
		
		return contact
	}
	
    def saveOrUpdateAccount(Organization organization) {
		if(!organization.validate()) {
			return organization
		}
		
		organization.save(flush:true)
		return organization
    }
	
	def createNewServiceContract(Organization organization,String contractType,Date contractFromDate,Date contractToDate,BigDecimal contractPrice) {
		def product = Product.findByProductName(contractType)
		
		def order = new Order()
		order.orderNumber = utilService.newOrderNumber()
		order.type = "SERVICE"
		
		if(!organization?.contacts?.isEmpty()) {
			def contact = organization?.contacts.first()
			order.contactName = contact?.firstName
		}
		
		order.relatedTo = "CONTRACT"
		
		order.contractFromDate = contractFromDate
		order.contractToDate = contractToDate
		order.invoicingIsFixedPrice = true
		order.invoicingIsTimesheets = false
		order.invoicingIsExpenses = false
		order.assignedTo = "SYSTEM"
		order.termsAndConditions = ""
		order.organization = organization
		
		int lineNo = 1
		def orderItem = new OrderItem()
		orderItem.lineNumber = lineNo
		orderItem.quantity = 1
		orderItem.unitPrice = contractPrice
		orderItem.tax = 0
		orderItem.discount = 0
		orderItem.lineTotalAmount = orderItem.quantity*orderItem.unitPrice + orderItem.tax - orderItem.discount
		orderItem.productNumber= product.productNumber
		orderItem.order = order
		
		order.addToOrderItems(orderItem)
		
		def unitPrice = 0.0
		def tax = 0.0
		def discount = 0.0
		def lineTotalAmount = 0.0
		
		
		unitPrice += orderItem.unitPrice
		tax += orderItem.tax
		discount += orderItem.discount
		lineTotalAmount += orderItem.lineTotalAmount

		order.totalAmount = unitPrice
		order.totalTax = tax
		order.totalDiscount = discount
		order.adjustment = 0
		order.grandTotal = unitPrice + tax - discount - order.adjustment
		order.referenceQuoteNumber = ""
		order.notes = ""
		order.invoicedGrandTotal = 0.0
		order.pendingInvoiceGrandTotal = order.grandTotal
		
		order.save(flush:true)
		
		if(order.errors) {
			println order.errors 
		}
	}
}
