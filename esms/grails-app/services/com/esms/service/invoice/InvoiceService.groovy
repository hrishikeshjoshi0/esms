package com.esms.service.invoice

import com.esms.model.calendar.Task
import com.esms.model.invoice.Invoice
import com.esms.model.invoice.InvoiceLine
import com.esms.model.order.Order

class InvoiceService {

	static final BigDecimal TOTAL_PERCENTAGE = 100.0
	
	def utilService

    def invoiceServiceContract(Order order, BigDecimal invoicedAmount,Date nextInvoiceTaskReminderDate) {
		order.status = "INVOICED"
		order.openGrandTotal = order.grandTotal
		order.receviedGrandTotal = new BigDecimal("0.0")
		
		if(order.adjustment == null) {
			order.adjustment = new BigDecimal("0.0")
		}
		
		order.save(flush:true)

		//Create Invoice -- Start
		def invoice = new Invoice()
		invoice.invoiceNumber = utilService.newInvoiceNumber()
		invoice.contactName = order.contactName
		invoice.status = "CREATED"

		invoice.relatedTo = "ORDER"
		invoice.relatedToValue = order.orderNumber

		invoice.assignedTo = order.assignedTo
		invoice.termsAndConditions = order.termsAndConditions

		invoice.contractFromDate = order.contractFromDate
		invoice.contractToDate = order.contractToDate
		invoice.type = order.type
		
		/*invoice.totalAmount = order.totalAmount + order.totalTax - order.totalDiscount - order.adjustment - order.invoicedGrandTotal //Doesnt include negotitation discount,
		invoice.totalTax = 0.0
		invoice.totalDiscount = 0.0
		invoice.adjustment = 0.0
		invoice.grandTotal = invoice.totalAmount*/
		invoice.referenceOrderNumber = order.orderNumber

		invoice.organization = order.organization
		int lineNumber = 1;
		
		if(nextInvoiceTaskReminderDate) {
			invoice.expiryDate = nextInvoiceTaskReminderDate
		}
		

		def invoiceLines = []

		order.orderItems?.each {
			if(it.amountInvoiced != it.lineTotalAmount) {
				def invoiceLine = new InvoiceLine()
				invoiceLine.lineNumber = (lineNumber++)
				invoiceLine.quantity = it.quantity
				
				invoiceLine.unitPrice = it.unitPrice
				invoiceLine.tax = it.tax
				invoiceLine.lineTotalAmount = it.lineTotalAmount
				invoiceLine.discount = it.discount
				invoiceLine.productNumber = it.productNumber
				invoiceLine.relatedOrderNumber = it.relatedOrderNumber
				invoiceLine.percentageInvoiced = TOTAL_PERCENTAGE - it.percentageInvoiced
				invoiceLine.amountInvoiced = it.lineTotalAmount - it.amountInvoiced
				
				invoiceLines.add(invoiceLine)
			}
		}

		invoice?.invoiceLines = invoiceLines
		
		if(!invoice.validate()) {
			return invoice
		}
		
		invoice.save(flush:true)
		
		//
		def unitPrice = new BigDecimal("0.0")
		def tax = new BigDecimal("0.0")
		def discount = new BigDecimal("0.0")
		def lineTotalAmount = new BigDecimal("0.0")
		def amountInvoiced = new BigDecimal("0.0")
		
		invoice?.invoiceLines?.each { it ->
			unitPrice += it.unitPrice
			tax +=  it.tax
			discount +=  it.discount
			lineTotalAmount +=  it.lineTotalAmount
			amountInvoiced += it.amountInvoiced
		}

		BigDecimal totalDiscount = new BigDecimal("0.0")
		BigDecimal grandTotal = new BigDecimal("0.0")

		invoice.totalAmount = amountInvoiced
		invoice.totalTax = tax
		invoice.totalDiscount = discount
		invoice.grandTotal = amountInvoiced - invoice.adjustment
		invoice.save(flush:true)
		
		invoice.openGrandTotal = invoice.grandTotal
		invoice.receviedGrandTotal = 0.0
		invoice.referenceOrderNumber = params.referenceOrderNumber
		
		invoice.save(flush:true)
		
		if(order) {
			order.invoicedGrandTotal += invoice.grandTotal
			order.pendingInvoiceGrandTotal -= invoice.grandTotal
			order.save(flush:true)
			
			//
			invoice?.invoiceLines?.each { iit ->
				order.orderItems?.each { oit ->
					if(oit.productNumber == iit.productNumber) {
						oit.amountInvoiced += iit.amountInvoiced
						oit.percentageInvoiced = (oit.amountInvoiced/oit.lineTotalAmount)*100
						oit.save(flush:true)
					}
				}
			}
		}
		
		//Raise Task
		if(invoice.expiryDate) {
			def taskInstance = new Task()
			taskInstance.taskName = 'REMINDER TASK FOR INVOICE: ' + invoice.invoiceNumber
			def taskDescription = 'This is a reminder for the invoice to be raised for the Order ' + order.orderNumber + '.\n'
			taskDescription += 'The pending amount is ' +  order.pendingInvoiceGrandTotal + '.\n'
			taskInstance.taskDescription = taskDescription
			taskInstance.dateTime = invoice.expiryDate
			taskInstance.dueDateTime = invoice.expiryDate
			taskInstance.relatedTo = 'ORDER'
			taskInstance.relatedToValue = order.orderNumber
			taskInstance.status = 'NOT_STARTED'
			taskInstance.priority = 'MEDIUM'
			taskInstance.notification = true
			taskInstance.save(flush:true)
		}
		
		return invoice
    }
}
