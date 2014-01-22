package com.esms.model.report

import com.esms.model.calendar.Event
import com.esms.model.calendar.EventLog
import com.esms.model.invoice.Invoice;
import com.esms.model.order.Order

class ReportController {
	
	def monthMap = [0:"January",1:"February",2:"March",3:"April",4:"May",5:"June",6:"July",7:"August",8:"September",9:"October",10:"November",11:"December"]
	
	def index() {
		redirect(action:"amountReceivables")
	}
	
	def toBeReplaced() {
		if(!params.offset) {
			params.offset= 0
		}
		
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		def events = EventLog.withCriteria() {
			and {
				eq('toBeReplaced',true)
				event {
					eq('followup',true)
				}
			}
			
			firstResult(params.offset?.toInteger())
			maxResults(params.max?.toInteger())
			order("loggedDate", "asc")
		}
		
		def c1 = EventLog.createCriteria()
		def eventLogInstanceTotal = c1.get {
			and {
				eq('toBeReplaced',true)
				event {
					eq('followup',true)
				}
			}
			projections {
				countDistinct "id"
			}
		}
		
		[eventLogInstanceList : events,eventLogInstanceTotal:eventLogInstanceTotal]
	}
	
	def isProblemRepeated() {
		if(!params.offset) {
			params.offset= 0
		}
		
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		//def events = EventLog.findAllByIsProblemReported(true,params)
		def eventLogInstanceTotal = EventLog.countByIsProblemReported(true)
		
		def events = EventLog.withCriteria() {
			and {
				eq('isProblemReported',true)
				event {
					eq('followup',true)
				}
			}
			
			firstResult(params.offset?.toInteger())
			maxResults(params.max?.toInteger())
			order("loggedDate", "asc")
		}
		
		def c1 = EventLog.createCriteria()
		def eventInstanceTotal = c1.get {
			and {
				eq('isProblemReported',true)
				event {
					eq('followup',true)
				}
			}
			projections {
				countDistinct "id"
			}
		}
		
		[eventLogInstanceList : events,eventLogInstanceTotal:eventLogInstanceTotal]
	}

    def upcomingRepairs() {
		if(!params.offset) {
			params.offset= 0
		}
		
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		def startRange = new Date()
		def endRange = startRange.plus(30)
		
		def events = Event.withCriteria(sort: "startTime", order: "desc") {
			and {
				eq("eventType", 'MAINTENANCE VISIT')
				ge("startTime", startRange)
				le("endTime",endRange)
			}
			firstResult(params.offset?.toInteger())
			maxResults(params.max?.toInteger())
		}
		
		def c1 = Event.createCriteria()
		def eventInstanceTotal = c1.get {
			and {
				eq("eventType", 'MAINTENANCE VISIT')
				ge("startTime", startRange)
				le("endTime",endRange)
			}
			projections {
				countDistinct "id"
			}
		}
		
		[eventInstanceList : events,eventInstanceTotal : eventInstanceTotal]
	}
	
	def upcomingRenewals() {
		def years = []
		def model
		
		if(request.xhr) {
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
				order("contractToDate", "asc")
			}
			
			render (template:"/dashboard/upcomingRenewalsTemplate",model:[upcomingRenewals:upcomingRenewals])			
		} else {
			if(!params.offset) {
				params.offset= 0
			}
			
			if(!params.max) {
				params.max= grailsApplication.config.esms.settings.max?.toInteger()
			}
			
			def nowCal = Calendar.instance
			Date nowDate = nowCal.time
				
			int y = nowCal.get(Calendar.YEAR)
			int m = nowDate[Calendar.MONTH]
			int d = nowDate[Calendar.DATE]
			
			for(int i=0; i <= 100; i++) {
				years.add(y+i)
			}
									
			params.upcomingRenewalMonthParam = m
			params.upcomingRenewalYearParam = y
						
			if(!params.upcomingRenewalMonthParam) {
				params.upcomingRenewalMonthParam = m
			}
			
			if(!params.upcomingRenewalYearParam) {
				params.upcomingRenewalYearParam = y
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
			
			def upcomingRenewalsTotal = Order.createCriteria().get {
				and {
					eq("type", 'SERVICE')
					ge("contractToDate", startDate)
					le("contractToDate", endDate)
					ne("renewalStage",'RENEWAL_WON')
					ne("renewalStage",'RENEWAL_LOST')
				}
				projections {
					countDistinct "id"
				}
			}
			
			model = [upcomingRenewals:upcomingRenewals,filteredMonthMap:monthMap,years:years,upcomingRenewalsTotal:upcomingRenewalsTotal]
		}
		
		
		model
	}
	
	def amountReceivables() {
		if(!params.offset) {
			params.offset= 0
		}
		
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		def amountReceivables = Order.withCriteria() {
			gt("pendingInvoiceGrandTotal", new BigDecimal("0.0"))
			"in"("type",['SALES','REPAIR','MODERNIZATION','INSTALLATION'])
			firstResult(params.offset?.toInteger())
			maxResults(params.max?.toInteger())
		}
		
		def amountReceivablesTotal = Order.createCriteria().get {
			gt("pendingInvoiceGrandTotal", new BigDecimal("0.0"))
			"in"("type",['SALES','REPAIR','MODERNIZATION','INSTALLATION'])
			projections {
				countDistinct "id"
			}
		}
		
		[amountReceivables : amountReceivables,amountReceivablesTotal:amountReceivablesTotal]
	}
}
