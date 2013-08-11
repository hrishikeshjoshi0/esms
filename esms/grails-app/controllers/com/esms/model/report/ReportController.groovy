package com.esms.model.report

import com.esms.model.calendar.Event
import com.esms.model.order.Order

class ReportController {
	
	def index() {
		redirect(action:"amountReceivables")
	}

    def upcomingRepairs() {
		def startRange = new Date()
		def endRange = startRange.plus(30)
		
		def events = Event.withCriteria(sort: "startTime", order: "desc") {
			and {
				eq("eventType", 'MAINTENANCE VISIT')
				ge("startTime", startRange)
				le("endTime",endRange)
			}		
		}
		
		[eventInstanceList : events,eventInstanceTotal : events?events.size():0]
	}
	
	def upcomingRenewals() {
		def now = new Date()
		def endDate = now.plus(30)
		
		def upcomingRenewals = Order.withCriteria(sort: "contractToDate", order: "asc") {
			and {
				eq("type", 'SERVICE')
				le("contractToDate", endDate)
			}
		}
		
		[upcomingRenewals : upcomingRenewals]
	}
	
	def amountReceivables() {
		def amountReceivables = Order.withCriteria(sort: "contractToDate", order: "asc") {
			and {
				gt("openGrandTotal", new BigDecimal("0.0"))
			}
		}
		
		[amountReceivables : amountReceivables]
	}
}
