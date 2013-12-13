package com.esms.util

import com.esms.model.order.Order;
import com.esms.model.party.Contact;
import com.esms.model.party.Organization;
import com.esms.model.product.Product

class UtilService {
	
	def prefixMap = ["Product":"PROD","Organization":"ACC","Contact":"CON","Order":"ORD"]
	
	def String newProductNumber() {
		def count = Product.count();
		int no = (count?count:0) + 1;
		String productNumber = prefixMap."Product" + String.format("%05d", no)
		return productNumber
    }
	
	def String newOrganizationNumber() {
		def count = Organization.count();
		int no = (count?count:0) + 1;
		String externalId = prefixMap."Organization" + String.format("%05d", no)
		return externalId
	}
	
	def String newContactNumber() {
		def count = Contact.count();
		int no = (count?count:0) + 1;
		String externalId = prefixMap."Contact" + String.format("%05d", no)
		return externalId
	}
	
	def String newOrderNumber() {
		def count = Order.count();
		int no = (count?count:0) + 1;
		String orderNumber = prefixMap."Order" + String.format("%05d", no)
		return orderNumber
	}
}
