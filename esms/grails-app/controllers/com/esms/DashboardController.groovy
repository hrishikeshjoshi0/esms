package com.esms

import com.esms.model.quote.Quote

class DashboardController {

    def index() { }
	
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
