package com.esms

import com.esms.model.order.Order
import com.esms.model.party.Organization
import com.esms.model.payment.Payment
import com.esms.model.quote.Quote
import com.lucastex.grails.fileuploader.UFile;

class DashboardController {

    def index() { 
		params.max = Math.min(params.max ? params.int('max') : 5, 10)
		params.sort = "id"
		params.'order' = "desc"
		
		//def recentLeads = AuditLogEvent.findAllByClassNameAndEventName('com.esms.model.party.Organization','INSERT',[sort:"dateCreated",order:"desc"])
		def recentLeads = Organization.findAllBySalesStatus('LEAD')
		def recentCustomers = Organization.findAllBySalesStatus('CUSTOMER',params)
		def recentQuotes = Quote.findAllByStatusInList(['DRAFT','PENDING','REVISE','ACCEPT'],params)
		def recentOrders = Order.findAllByTypeInList(['SALES','REPAIR','MODERNIZATION','INSTALLATION'],params)
		def recentDocuments = UFile.list(params)
		def recentPayments = Payment.listOrderByPaymentNumber(max: 5, offset: 0, order: "desc")
		
		[recentLeads : recentLeads,recentCustomers:recentCustomers,recentQuotes:recentQuotes,recentOrders:recentOrders,recentDocuments:recentDocuments,recentPayments:recentPayments]		
	}
	
	def paginateRecentLeads = {
		params.maxSteps = Math.min(params.maxSteps ? params.int('maxSteps') : 0, 10)
		params.sort = "id"
		params.'order' = "desc"
		
		def recentLeads = Organization.findAllBySalesStatus('LEAD',false,params)
		render(template: 'recentLeads', model: [recentLeads : recentLeads])
	}
	
	def quotesByStatus() {
		def resultColumns = [['string', 'Status'], ['number', 'Count']]
		
		def quoteInstance = new Quote()
		def statusList = quoteInstance.constraints.status.inList
		
		def resultData = [:]
		if(statusList) {
			statusList?.each {
				def count = Quote.countByStatus(it)
				resultData.it = count
			}
		}
		
		[resultColumns : resultColumns, resultData: resultData]
	}
}
