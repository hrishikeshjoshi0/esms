package com.esms.util

import com.esms.model.Sequence

class UtilService {
	
	def prefixMap = ["Product":"PROD","Organization":"ACC","Contact":"CON","Order":"ORD","Invoice":"INV","PurchaseOrder":"PO"]
	
	def nextSequenceNumber(String type) {
		def sequence = Sequence.findByPrefix(type)
		
		if(sequence) {
			sequence.numberValue++
			sequence.save(flush:true)
		} else {
			sequence = new Sequence()
			sequence.type = type
			sequence.prefix = type
			sequence.numberValue = 1
			sequence.save(flush:true)
		}
		return sequence.prefix + String.format("%05d", sequence.numberValue)
	}
	
	def String newProductNumber() {
		return nextSequenceNumber("PROD")
    }
	
	def String newOrganizationNumber() {
		return nextSequenceNumber("ACC")
	}
	
	def String newContactNumber() {
		return nextSequenceNumber("CON")
	}
	
	def String newOrderNumber() {
		return nextSequenceNumber("ORD")
	}
	
	def String newPurchaseOrderNumber() {
		return nextSequenceNumber("PO")
	}
	
	def String newInvoiceNumber() {
		return nextSequenceNumber("INV")
	}
	
	def String newQuoteNumber() {
		return nextSequenceNumber("QUO")
	}
}
