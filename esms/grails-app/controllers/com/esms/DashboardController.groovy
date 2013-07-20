package com.esms

import org.codehaus.groovy.grails.plugins.orm.auditable.AuditLogEvent;

import com.esms.model.order.Order;
import com.esms.model.party.Organization
import com.esms.model.payment.Payment;
import com.esms.model.quote.Quote
import com.lucastex.grails.fileuploader.UFile;

class DashboardController {

    def index() { 
		params.max = Math.min(params.max ? params.int('max') : 5, 10)
		params.sort = "id"
		params.'order' = "desc"
		
		//def recentLeads = AuditLogEvent.findAllByClassNameAndEventName('com.esms.model.party.Organization','INSERT',[sort:"dateCreated",order:"desc"])
		def recentLeads = Organization.findAllBySalesStatus('LEAD',false,params)
		def recentCustomers = Organization.findAllBySalesStatus('CUSTOMER',params)
		def recentQuotes = Quote.list(params)
		def recentOrders = Order.list(params)
		def recentDocuments = UFile.list(params)
		def recentPayments = Payment.list(params)
		
		[recentLeads : recentLeads,recentCustomers:recentCustomers,recentQuotes:recentQuotes,recentOrders:recentOrders,recentDocuments:recentDocuments,recentPayments:recentPayments]		
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
