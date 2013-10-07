package com.esms.model.order

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.inventory.InventoryJournal
import com.esms.model.party.Organization
import com.esms.model.product.Product
import com.esms.model.quote.Quote

class OrderController {

	static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	def filterPaneService

	def index() {
		redirect action: 'list', params: params
	}

	def list() {

		def orders = Order.withCriteria {
			'in'('type', ['REPAIR','MODERNIZATION','INSTALLATION'])
		}
		
		orders = Order.list()

		[orderInstanceList: orders, orderInstanceTotal: orders?orders.size():0]
	}

	def filter = {
		if(!params.max) params.max = 10
		render( view:'list', model:[ orderInstanceList: filterPaneService.filter( params, Order),
			orderInstanceCount: filterPaneService.count( params, Order), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}

	def confirmSale() {
		def orderInstance = Order.get(params.id)
		if(orderInstance) {
			orderInstance.status = "CONFIRM_SALE"

			//TODO : Create OrderInventoryAssignments for this Sales Order
			orderInstance.orderItems?.each{
				def productNumber = it.productNumber
				def product = Product.findByProductName(productNumber)
				if(product.requiresInventory && product.inventory) {
					def orderInventory = new InventoryJournal()
					orderInventory.order = orderInstance
					orderInventory.productInventory = product.inventory
					orderInventory.quantity = it.quantity
					orderInventory.isPosted = false
					orderInventory.status = 'PENDING_DELIVERY' //TODO
					orderInventory.save(flush:true)
				} else {
					//
				}
			}
		}

		flash.message = 'Marked as Sales Complete: ' + orderInstance.orderNumber
		redirect action: 'show', id: orderInstance.id
	}

	def convertQuoteToOrder() {
		def list = Order.list();
		int no = (list?list.size():0) + 1;
		String orderNumber = "ORD" + String.format("%05d", no)

		def quote = Quote.get(params.id)

		//Convert Lead, (if applicable)
		quote.organization?.convertLead()
		quote.organization?.save(flush:true)

		def order = new Order()
		order.orderNumber = orderNumber
		order.contactName = quote.contactName
		order.status = "PENDING_INVOICE"
		if(quote.type == 'CONTRACT') {
			quote.status = "CONVERTED_TO_SERVICE_CONTRACT	"
			order.type = "SERVICE"
			order.relatedTo = "CONTRACT"

			order.contractFromDate = quote.contractFromDate
			order.contractToDate = quote.contractToDate
			order.invoicingIsFixedPrice = quote.invoicingIsFixedPrice
			order.invoicingIsTimesheets = quote.invoicingIsTimesheets
			order.invoicingIsExpenses = quote.invoicingIsExpenses
			order.assignedTo = quote.assignedTo
			order.termsAndConditions = quote.termsAndConditions

		} else {
			order.type = quote.type
			order.relatedTo = "CONTRACT"
			quote.status = "CONVERTED_TO_SALES_ORDER"
		}

		order.totalAmount = quote.totalAmount
		order.totalTax = quote.totalTax
		order.totalDiscount = quote.totalDiscount
		order.grandTotal = quote.grandTotal
		order.referenceQuoteNumber = quote.quoteNumber

		order.organization = quote.organization
		if(!order.save(flush:true)) {
			redirect controller: 'quote',action: 'show', id: quote.id
			return
		}

		order.orderItems = new HashSet<OrderItem>()

		int lineNo = 1
		quote.quoteItems.each { it ->
			def orderItem = new OrderItem()
			orderItem.lineNumber = lineNo
			orderItem.quantity = it.quantity
			orderItem.unitPrice = it.unitPrice
			orderItem.tax = it.tax
			orderItem.lineTotalAmount = it.lineTotalAmount
			orderItem.discount = it.discount
			orderItem.productNumber= it.productNumber
			orderItem.order = order
			orderItem.save(flush:true)
			
			lineNo++
		}

		flash.message = 'Order Created from Quote: ' + quote.quoteName
		redirect action: 'show', id: order.id
	}

	def create() {
		switch (request.method) {
			case 'GET':
				def list = Order.list();
				int no = (list?list.size():0) + 1;
				String orderNumber = "ORD" + String.format("%05d", no)
				params.orderNumber = orderNumber

				def order = new Order(params)

				if(params.relatedTo == 'CONTRACT' && params.customerNumber) {
					String customerNumber = params.customerNumber
					def organization = Organization.findByExternalId(customerNumber)
					order.organization = organization
				}

				[orderInstance: order]
				break
			case 'POST':
				def orderInstance = new Order(params)
				if (!orderInstance.save(flush: true)) {
					render view: 'create', model: [orderInstance: orderInstance]
					return
				}

				flash.message = message(code: 'default.created.message', args: [message(code: 'order.label', default: 'Order'), orderInstance.id])
				redirect action: 'show', id: orderInstance.id
				break
		}
	}

	def show() {
		def orderInstance = Order.get(params.id)
		if (!orderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
			redirect action: 'list'
			return
		}

		[orderInstance: orderInstance]
	}

	def edit() {
		switch (request.method) {
			case 'GET':
				def orderInstance = Order.get(params.id)
				if (!orderInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
					redirect action: 'list'
					return
				}

				[orderInstance: orderInstance]
				break
			case 'POST':
				def orderInstance = Order.get(params.id)
				if (!orderInstance) {
					flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
					redirect action: 'list'
					return
				}

				if (params.version) {
					def version = params.version.toLong()
					if (orderInstance.version > version) {
						orderInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
								[message(code: 'order.label', default: 'Order')] as Object[],
								"Another user has updated this Order while you were editing")
						render view: 'edit', model: [orderInstance: orderInstance]
						return
					}
				}

				orderInstance.properties = params

				if (!orderInstance.save(flush: true)) {
					render view: 'edit', model: [orderInstance: orderInstance]
					return
				}

				flash.message = message(code: 'default.updated.message', args: [message(code: 'order.label', default: 'Order'), orderInstance.id])
				redirect action: 'show', id: orderInstance.id
				break
		}
	}

	def delete() {
		def orderInstance = Order.get(params.id)
		if (!orderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])
			redirect action: 'list'
			return
		}

		try {
			orderInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'order.label', default: 'Order'), params.id])
			redirect action: 'list'
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'order.label', default: 'Order'), params.id])
			redirect action: 'show', id: params.id
		}
	}

	def assignOrderItem() {
		switch (request.method) {
			case 'GET':
				def list = PurchaseOrder.list();
				int no = (list?list.size():0) + 1;
				String orderNumber = "PO" + String.format("%05d", no)
				params.purchaseOrderNumber = orderNumber
			
				def order = PurchaseOrder.get(params.orderId)

				def c = PurchaseOrderItem.createCriteria()
				def maxLineNumber = c.get {
					eq("purchaseOrder", order)
					projections {
						max ("lineNumber")
					}
				}
				params.lineNumber = maxLineNumber?maxLineNumber:0 + 1
				[purchaseOrderInstance: new PurchaseOrder(params)]
				break
			case 'POST':
				def purchaseOrderInstance = new PurchaseOrder(params)

				if (!purchaseOrderInstance.save(flush: true)) {
					render view: 'show', model: [purchaseOrderItemInstance: purchaseOrderInstance]
					return
				}

				def orderItem = OrderItem.get(params.orderItemInstanceId.toInteger())
				orderItem.relatedOrderNumber = purchaseOrderInstance?.purchaseOrderNumber
				
				def unitPrice = new BigDecimal("0.0")
				def tax = new BigDecimal("0.0")
				def discount = new BigDecimal("0.0")
				def lineTotalAmount = new BigDecimal("0.0")
				BigDecimal totalDiscount = new BigDecimal("0.0")
				BigDecimal grandTotal = new BigDecimal("0.0")

				purchaseOrderInstance.save(flush:true)

				redirect action: 'show', id: orderItem?.order?.id
				
				break
		}
	}

	def createOrderItem() {
		switch (request.method) {
			case 'GET':
				def order = Order.get(params.orderId)

				def c = OrderItem.createCriteria()
				def maxLineNumber = c.get {
					eq("order", order)
					projections {
						max ("lineNumber")
					}
				}
				params.lineNumber = maxLineNumber?maxLineNumber:0 + 1
				[orderItemInstance: new OrderItem(params)]
				break
			case 'POST':
				def orderItemInstance = new OrderItem(params)

				if (!orderItemInstance.save(flush: true)) {
					render view: 'create', model: [orderItemInstance: orderItemInstance]
					return
				}

				def order = orderItemInstance.order
				def orderItems = order.orderItems

				def unitPrice = new BigDecimal("0.0")
				def tax = new BigDecimal("0.0")
				def discount = new BigDecimal("0.0")
				def lineTotalAmount = new BigDecimal("0.0")

				orderItems?.each { it ->
					unitPrice += it.unitPrice
					tax +=  it.tax
					discount +=  it.discount
					lineTotalAmount +=  it.lineTotalAmount
				}

				BigDecimal totalDiscount = new BigDecimal("0.0")
				BigDecimal grandTotal = new BigDecimal("0.0")

				order.totalAmount = unitPrice
				order.totalTax = tax
				order.totalDiscount = discount
				order.grandTotal = lineTotalAmount
				order.save(flush:true)

				flash.message = message(code: 'default.created.message', args: [message(code: 'quoteItem.label', default: 'QuoteItem'), orderItemInstance.id])
				redirect action: 'show', id: orderItemInstance.order.id
				break
		}
	}

	def createInvoice = {
		def order = Order.get(params.id)
		order.status = "INVOICED"
		order.openGrandTotal = order.grandTotal
		order.receviedGrandTotal = new BigDecimal("0.0")
		order.save(flush:true)

		order.orderItems?.each {
			def product = Product.findByProductName(it.productNumber)
			if(product) {
				def productInventory = product.inventory

				if(productInventory) {
					def entry = new InventoryJournal()
					entry.order = order
					entry.quantity = it.quantity
					entry.productInventory = productInventory
					entry.status = 'INVOICED'
					entry.save(flush:true)

					if(productInventory.quantityOnHand) {
						productInventory.quantityOnHand = productInventory.quantityOnHand -  entry.quantity
					}
					productInventory.save(flush:true)
				}
			}
		}

		flash.message = "Invoiced.."
		redirect action: 'show', id: order.id
	}

	def registerPayment() {

	}
	
	def ordersPendingPayment() {
		def openOrders = Order.findAllByStatus('INVOICED',params)
		[ordersPendingPayments:openOrders]
	}
}

