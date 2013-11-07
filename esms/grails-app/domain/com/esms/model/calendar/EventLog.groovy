package com.esms.model.calendar

class EventLog {
	
	Date loggedDate = new Date()
	String workDoneBy
	String reviewedBy
	String comments
	boolean isProblemReported
	boolean toBeReplaced
	String urgency

    static constraints = {
		loggedDate(nullable: false, blank: false)
		workDoneBy(nullable: false, blank:  false)
		reviewedBy(nullable: false, blank: false)
		comments(nullable: true,type:'text',maxSize: 1000,)
		isProblemReported(nullable: true)
		toBeReplaced(nullable: true)
		urgency(InList:['LOW','MEDIUM','HIGH'])
    }
	
	static mapping = {
	}
	
	static belongsTo = [event : Event]
}
