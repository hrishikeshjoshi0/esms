package esms

import com.esms.model.calendar.Event;
import com.esms.model.order.Order

class DefaultFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
				def loggedInTime = session["lastLoginDate"]
				def currentTime = new Date()
				
				if(loggedInTime) {
					
				}
				
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }

	private saveUpcomingEventsToSession(session) {
		def cal = Calendar.getInstance()
		cal.set(Calendar.DATE, cal.get(Calendar.DATE)+10)
		def currentDatePlusThreshold = cal.getTime()

		def events = Event.findAllByStartTimeGreaterThanAndStatusInList(new Date(),['PLANNED','NOT HELD'],[sort: "startTime", order: "asc"])
		//def events = Event.findAllByEndTimeLessThanEquals(currentDatePlusThreshold,[sort: "startTime", order: "asc"])
		session["upcomingEvents"] = events
	}

	private saveExpiringContractsToSession(session) {
		def cal = Calendar.getInstance()
		cal.set(Calendar.MONTH, cal.get(Calendar.MONTH)+1)
		def currentDatePlusOneMonth = cal.getTime()

		def orders = Order.findAllByContractToDateLessThanEquals(currentDatePlusOneMonth)
		session["expiringContracts"] = orders
	}
}
