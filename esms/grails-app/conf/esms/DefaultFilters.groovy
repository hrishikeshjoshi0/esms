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
					def c1 = Calendar.getInstance()
					c1.setTime(loggedInTime)
					def ms1 = c1.getTimeInMillis()

					def c2 = Calendar.getInstance()
					c2.setTime(currentTime)
					def ms2 = c1.getTimeInMillis()

					def differenceInMinutes = (ms2 - ms1)/(1000*60)

					if(session["expiringContracts"] && session["upcomingEvents"]) {
						//to be picked up from configuration.
						int threshold = 2
						if(differenceInMinutes > threshold) {
							//expiring contracts
							saveExpiringContractsToSession(session)

							//upcoming events
							saveUpcomingEventsToSession(session)
						}
					} else {
						//expiring contracts
						saveExpiringContractsToSession(session)

						//upcoming events
						saveUpcomingEventsToSession(session)
					}
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

		def events = Event.findAllByEndTimeLessThanEquals(currentDatePlusThreshold,[sort: "startTime", order: "asc"])
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
