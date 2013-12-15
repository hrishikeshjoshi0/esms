package com.esms

import grails.converters.JSON;

import com.esms.model.calendar.Event
import com.esms.model.calendar.Task;
import com.esms.model.invoice.Invoice;
import com.esms.model.order.Order
import com.esms.model.party.Organization
import com.esms.model.payment.Payment
import com.esms.model.quote.Quote
import com.esms.taglib.calendar.CalendarTagLib;
import com.lucastex.grails.fileuploader.UFile

class DashboardController {
	
	def monthMap = [0:"January",1:"February",2:"March",3:"April",4:"May",5:"June",6:"July",7:"August",8:"September",9:"October",10:"November",11:"December"]

    def index() { 
		params.max = 5
		params.sort = "id"
		params.'order' = "desc"
				
		//def recentLeads = AuditLogEvent.findAllByClassNameAndEventName('com.esms.model.party.Organization','INSERT',[sort:"dateCreated",order:"desc"])
		def c = Organization.createCriteria()
		def recentLeads = c.list (max: params.max) {
			like("salesStatus", "LEAD")
			and {
				isEmpty("quotes")
			}
			order("id", "desc")
			maxResults(params.max)
		}
		def recentMaintenanceQuotes = Quote.findAllByStatusInListAndTypeInList(['DRAFT','PENDING','REVISE','ACCEPT'],['CONTRACT'],params)
		def upcomingEvents = Event.findAllByStartTimeGreaterThanAndStatusInList(new Date(),['PLANNED','NOT HELD'],params)
		def overdueEvents = Event.findAllByStartTimeLessThanAndStatusInList(new Date(),['PLANNED','NOT HELD'],params)
		def recentCustomers = Organization.findAllBySalesStatus('CUSTOMER',params)
		
		def dt = new Date()
		def recentOrders = Order.withCriteria(sort: "contractToDate", order: "asc") {
			and {
				eq("type", 'SERVICE')
				ge("contractToDate", dt)
			}
			order("id", "desc")
			maxResults(params.max)
		}
		
		def ordersPendingPayments = Order.findAllByStatus('INVOICED', [max: params.max, sort: "id", order: "desc", offset: 0])
		def openInvoices = Invoice.findAllByStatusNotEqualAndTypeNotEqual('CLOSED','SERVICE',[max: params.max, sort: "id", order: "desc", offset: 0])
		def recentDocuments = UFile.list(params)
		def recentPayments = Payment.listOrderByPaymentNumber(max: 5, offset: 0, order: "desc")
		def openPayments = Payment.findAllByPaymentMethodAndClearanceDateIsNull("CHEQUE",[max: params.max, sort: "id", order: "desc", offset: 0])
		
		def recentRepairsModernizationAndInstallationQuotes = Quote.findAllByStatusInListAndTypeInList(
			['DRAFT','PENDING','REVISE','ACCEPT'],['REPAIR','MODERNIZATION','INSTALLATION'],[max: params.max, sort: "id", order: "desc", offset: 0])
		
		def recentRepairsModernizationAndInstallationOrders = Order.findAllByStatusInListAndTypeInList(
			['PENDING_INVOICE','CONFIRM_SALE','DELIVERY_PENDING','DELIVERED','INVOICED'],['REPAIR','MODERNIZATION','INSTALLATION'],[max: params.max, sort: "id", order: "desc", offset: 0])
		
		def nowCal = Calendar.instance
		Date nowDate = nowCal.time
		
		int y = nowCal.get(Calendar.YEAR)
		int m = nowDate[Calendar.MONTH]
		int d = nowDate[Calendar.DATE]
		
		params.upcomingRenewalMonthParam = m
		params.upcomingRenewalYearParam = y
		
		if(!params.upcomingRenewalMonthParam) {
			params.upcomingRenewalMonthParam = m
		}
		
		if(!params.upcomingRenewalYearParam) {
			params.upcomingRenewalYearParam = y
		}
		
		
		def years = []
		for(int i=0; i <= 100; i++) {
			years.add(y+i)
		}
		
		nowCal.set Calendar.DATE, 1
		nowCal.set Calendar.MONTH, (m+1)

		def s = Calendar.instance
		s.set Calendar.DATE, 1
		s.set Calendar.MONTH, m
		s.set Calendar.YEAR, y
		def startDate = s.getTime()
		
		def e = Calendar.instance
		e.set Calendar.DATE, 1
		e.set Calendar.MONTH, (m+1)
		e.set Calendar.YEAR, y
		def endDate = e.getTime().minus(1)
		
		def upcomingRenewals = Order.withCriteria() {
			and {
				eq("type", 'SERVICE')
				ge("contractToDate", startDate)
				le("contractToDate", endDate)
				ne("renewalStage",'RENEWAL_WON')
				ne("renewalStage",'RENEWAL_LOST')
			}
			maxResults(params.max)
			order("contractToDate", "asc")
		}
		
		def upcomingTasks = Task.withCriteria() {
			and {
				ne("status", 'COMPLETED')
				between('dateTime', startDate-1, endDate)
			}
			maxResults(params.max)
			order("dateTime", "asc")
		}
		
		def model = [recentLeads : recentLeads,recentCustomers:recentCustomers,recentMaintenanceQuotes:recentMaintenanceQuotes,recentOrders:recentOrders,recentDocuments:recentDocuments,recentPayments:recentPayments,upcomingEvents:upcomingEvents,overdueEvents:overdueEvents,ordersPendingPayments:ordersPendingPayments,openPayments:openPayments,upcomingRenewals : upcomingRenewals,openInvoices:openInvoices,filteredMonthMap:monthMap,years:years,upcomingTasks:upcomingTasks,recentRepairsModernizationAndInstallationQuotes:recentRepairsModernizationAndInstallationQuotes,recentRepairsModernizationAndInstallationOrders:recentRepairsModernizationAndInstallationOrders]
		render (view:"/dashboard/dashboard",model:model)		
	}
	
	def upcomingRenewals() { 
		params.max = 5
		int y = params.upcomingRenewalYearParam.toInteger()
		int m = params.upcomingRenewalMonthParam.toInteger()
		int d = 1
		
		def s = Calendar.instance
		s.set Calendar.DATE, 1
		s.set Calendar.MONTH, m
		s.set Calendar.YEAR, y
		s.set Calendar.HOUR, 0
		s.set Calendar.MINUTE, 0
		s.set Calendar.SECOND, 0
		s.set Calendar.MILLISECOND, 0
		def startDate = s.getTime()
		
		def e = Calendar.instance
		e.set Calendar.DATE, 1
		e.set Calendar.MONTH, (m+1)
		e.set Calendar.YEAR, y
		e.set Calendar.HOUR, 0
		e.set Calendar.MINUTE, 0
		e.set Calendar.SECOND, 0
		e.set Calendar.MILLISECOND, 0
		def endDate = e.getTime().minus(1)
		
		def upcomingRenewals = 	Order.withCriteria() {
			and {
				eq("type", 'SERVICE')
				ge("contractToDate", startDate)
				le("contractToDate", endDate)
				ne("renewalStage",'RENEWAL_WON')
				ne("renewalStage",'RENEWAL_LOST')
			}
			maxResults(params.max)
			order("contractToDate", "asc")
		}
		
		render (template:"/dashboard/upcomingRenewalsTemplate",model:[upcomingRenewals:upcomingRenewals])	
	}
	
	def upcomingTasks() {
		params.max = 5
		
		int y = params.upcomingRenewalYearParam.toInteger()
		int m = params.upcomingRenewalMonthParam.toInteger()
		int d = 1
		
		def s = Calendar.instance
		s.set Calendar.DATE, 1
		s.set Calendar.MONTH, m
		s.set Calendar.YEAR, y
		s.set Calendar.HOUR, 0
		s.set Calendar.MINUTE, 0
		s.set Calendar.SECOND, 0
		s.set Calendar.MILLISECOND, 0
		def startDate = s.getTime()
		
		
		def e = Calendar.instance
		e.set Calendar.DATE, 1
		e.set Calendar.MONTH, (m+1)
		e.set Calendar.YEAR, y
		e.set Calendar.HOUR, 0
		e.set Calendar.MINUTE, 0
		e.set Calendar.SECOND, 0
		e.set Calendar.MILLISECOND, 0
		
		def endDate = e.getTime().minus(1)
		
		def upcomingTasks = Task.withCriteria() {
			and {
				ne("status", 'COMPLETED')
				between('dateTime', startDate-1, endDate)
			}
			maxResults(params.max)
			order("dateTime", "asc")
		}
		
		render (template:"/dashboard/upcomingTasksTemplate",model:[upcomingTasks:upcomingTasks])
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
