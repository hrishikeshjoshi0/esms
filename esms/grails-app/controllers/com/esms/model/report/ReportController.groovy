package com.esms.model.report

import com.esms.model.calendar.Event
import com.esms.model.calendar.EventLog;
import com.esms.model.order.Order

class ReportController {
	
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
		
		def events = EventLog.findAllByToBeReplaced(true,params)
		def eventLogInstanceTotal = EventLog.countByToBeReplaced(true)
		[eventLogInstanceList : events,eventLogInstanceTotal:eventLogInstanceTotal]
	}
	
	def isProblemRepeated() {
		if(!params.offset) {
			params.offset= 0
		}
		
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		def events = EventLog.findAllByIsProblemReported(true,params)
		def eventLogInstanceTotal = EventLog.countByIsProblemReported(true)
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
		if(!params.offset) {
			params.offset= 0
		}
		
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		def now = new Date()
		def endDate = now.plus(30)
		
		def upcomingRenewals = Order.withCriteria(sort: "contractToDate", order: "asc") {
			and {
				eq("type", 'SERVICE')
				le("contractToDate", endDate)
				ne("renewalStage",'RENEWAL_WON')
				ne("renewalStage",'RENEWAL_LOST')
			}
			firstResult(params.offset?.toInteger())
			maxResults(params.max?.toInteger())
		}
		
		def c1 = Order.createCriteria()
		def orderInstanceTotal = c1.get {
			and {
				eq("type", 'SERVICE')
				le("contractToDate", endDate)
				ne("renewalStage",'RENEWAL_WON')
				ne("renewalStage",'RENEWAL_LOST')
			}
			projections {
				countDistinct "id"
			}
		}
		
		[upcomingRenewals : upcomingRenewals,orderInstanceTotal:orderInstanceTotal]
	}
	
	def amountReceivables() {
		if(!params.offset) {
			params.offset= 0
		}
		
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		def amountReceivables = Order.withCriteria(sort: "contractToDate", order: "asc") {
			gt("openGrandTotal", new BigDecimal("0.0"))
			firstResult(params.offset?.toInteger())
			maxResults(params.max?.toInteger())
		}
		
		def c1 = Order.createCriteria()
		def orderInstanceTotal = c1.get {
			gt("openGrandTotal", new BigDecimal("0.0"))
			projections {
				countDistinct "id"
			}
		}
		
		[amountReceivables : amountReceivables,orderInstanceTotal:orderInstanceTotal]
	}
}
