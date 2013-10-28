package com.esms.model.calendar

class Task {
	
	String taskName
	String taskDescription
	String status = "NOT_STARTED"
	String priority = "MEDIUM"
	String assignedTo = "SYSTEM"
	String assignedToValue
	Date dateTime
	Date dueDateTime
	Boolean notification
	String relatedTo
	String relatedToValue
		
    static constraints = {
		taskName(nullable: false, blank: false)
		taskDescription(nullable: true, blank: true,type:'text')
		status(nullable: true)
		priority(nullable: true)
		assignedTo(nullable: true)
		assignedToValue(nullable: true)
		relatedTo(nullable: true)
		relatedToValue(nullable: true)
		dateTime(required: false, nullable: true)
		dueDateTime(required: false, nullable: true)
		status InList : ['NOT_STARTED','IN_PROGRESS','PENDING_INPUT','DEFERRED','PLANNED','COMPLETED']
		priority InList : ['LOW','MEDIUM','HIGH']
		relatedTo InLIst : ['ORGANIZATION','INCIDENT','INVOICE','QUOTE','ORDER','CONTACT','PAYMENT','EMPLOYEE','INVOICE','ORGANIZATION','OTHER']
    }
}
