package com.esms

import com.esms.model.calendar.Event
import com.esms.model.order.Order
import com.esms.model.party.Organization
import com.esms.model.payment.Payment
import com.esms.model.quote.Quote
import com.lucastex.grails.fileuploader.UFile

class DashboardController {

    def index() { 
		params.max = Math.min(params.max ? params.int('max') : 5, 10)
		params.sort = "id"
		params.'order' = "desc"
		
		//def recentLeads = AuditLogEvent.findAllByClassNameAndEventName('com.esms.model.party.Organization','INSERT',[sort:"dateCreated",order:"desc"])
		def c = Organization.createCriteria()
		def recentLeads = c.list (max: 10, offset: 10) {
			like("salesStatus", "LEAD")
			and {
				isEmpty("quotes")
			}
			order("id", "desc")
		}
		def recentQuotes = Quote.findAllByStatusInList(['DRAFT','PENDING','REVISE','ACCEPT'],params)
		def upcomingEvents = Event.findAllByStartTimeGreaterThanAndStatusInList(new Date(),['PLANNED','NOT HELD'],params)
		def overdueEvents = Event.findAllByStartTimeLessThanAndStatusInList(new Date(),['PLANNED','NOT HELD'],params)
		def recentCustomers = Organization.findAllBySalesStatus('CUSTOMER',params)
		def recentOrders = Order.findAllByTypeInList(['SALES','REPAIR','MODERNIZATION','INSTALLATION'],params)
		def ordersPendingPayments = Order.findAllByStatus('INVOICED',params)
		def recentDocuments = UFile.list(params)
		def recentPayments = Payment.listOrderByPaymentNumber(max: 5, offset: 0, order: "desc")
		def openPayments = Payment.findAllByPaymentMethodAndClearanceDateIsNull("CHEQUE",params)
		def now = new Date()
		def endDate = now.plus(60)
		def upcomingRenewals = Order.withCriteria(sort: "contractToDate", order: "asc") {
			and {
				eq("type", 'SERVICE')
				le("contractToDate", endDate)
			}
		}
		def model = [recentLeads : recentLeads,recentCustomers:recentCustomers,recentQuotes:recentQuotes,recentOrders:recentOrders,recentDocuments:recentDocuments,recentPayments:recentPayments,upcomingEvents:upcomingEvents,overdueEvents:overdueEvents,ordersPendingPayments:ordersPendingPayments,openPayments:openPayments,upcomingRenewals : upcomingRenewals]
		render (view:"/dashboard/dashboard",model:model)		
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
