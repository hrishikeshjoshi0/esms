package esms

import com.esms.model.order.Order

class DefaultFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
				System.out.println(session["lastLoginDate"])
				
				def cal = Calendar.getInstance()
				cal.set(Calendar.MONTH, cal.get(Calendar.MONTH)+1)
				def currentDatePlusOneMonth = cal.getTime()
				
				def orders = Order.findAllByContractToDateLessThanEquals(currentDatePlusOneMonth)
				session["expiringContracts"] = orders
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
