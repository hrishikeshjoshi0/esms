package com.esms.model.calendar

import java.util.Date;

import org.joda.time.DateTime
import org.joda.time.Minutes

import com.esms.model.maintenance.WorkDoneCertificate;
import com.esms.model.party.Party;

class Event {
    
    String title
    String location
    String description

    Date startTime
    Date endTime

    // Recurring Options
    boolean isRecurring
    EventRecurType recurType
    Integer recurInterval = 1
    Date recurUntil
    Integer recurCount

    Event sourceEvent

    static hasMany = [recurDaysOfWeek: Integer, excludeDays: Date,eventLogs : EventLog]
    static transients = ['durationMinutes']
	
	static belongsTo = [party : Party]
	
	String eventType
	String status = 'PLANNED'
	String priority = 'MEDIUM'
	String relatedTo = 'ORGANIZATION'
	String relatedToValue
	String activityLog
	
	//Maintenance Visit Fields.
	String maintenanceVisitTechnician
	String maintenanceVisitTechnicianNotes
	String maintenanceVisitSignedOffBy
	boolean maintenanceVisitIsRequiresRepair
	
	//Meeting Fields.
	String meetingNotes
	
	//Repair visit fields
	String breakdownVisitTechnician
	String breakdownVisitTechnicianNotes
	String breakdownVisitSignedOffBy
	
	String assignedTo
	
	static hasOne = [workDoneCertificate : WorkDoneCertificate]

    def eventService

    static constraints = {
        title(nullable: true, blank: true)
        location(nullable: true, blank:  true)
        description(nullable: true, blank: true)
        recurType(nullable: true)
        recurInterval(nullable: true)
        recurUntil(nullable: true)
        recurCount(nullable: true)
        startTime(nullable: true)
        excludeDays(nullable: true)
        sourceEvent(nullable: true)
		relatedToValue(nullable: true)
        startTime(required: true, nullable: false)
//        endTime(required: true, nullable: false, validator: {val, obj -> val > obj.startTime} )
        recurDaysOfWeek(validator: {val, obj -> 
            if (obj.recurType == EventRecurType.WEEKLY && !val) {return 'null'}
        })
		eventType InList : ['PHONE CALL/FOLLOW UP','MEETING','MAINTENANCE VISIT','BREAKDOWN CALL','REPAIR WORK', 'MODERNIZATION WORK','INSTALLATION WORK']
		status InList : ['CLOSED','PLANNED','NOT HELD'] 
		priority InList : ['LOW','MEDIUM','HIGH']
		relatedTo InList : ['ORGANIZATION','INCIDENT','INVOICE','QUOTE','ORDER','CONTACT','PAYMENT','EMPLOYEE']
		activityLog type:'text'
		
		maintenanceVisitTechnician(nullable: true,blank:true)
		maintenanceVisitTechnicianNotes(nullable: true,blank:true,type:'text')
		maintenanceVisitSignedOffBy(nullable: true,blank:true)
		maintenanceVisitIsRequiresRepair(nullable: true)
		
		//Meeting Fields.
		meetingNotes(nullable: true,blank:true,type:'text')
		
		//Repair visit fields
		breakdownVisitTechnician(nullable: true,blank:true)
		breakdownVisitTechnicianNotes(nullable: true,blank:true,type:'text')
		breakdownVisitSignedOffBy(nullable: true,blank:true)
		
		workDoneCertificate nullable:true
		
		assignedTo(nullable: true,blank:true)
    }
	
	static mapping = {
		tablePerHierarchy false
	}

    public int getDurationMinutes() {
        Minutes.minutesBetween(new DateTime(startTime), new DateTime(endTime)).minutes
    }

    private void updateRecurringValues() {
        if (!isRecurring) {
            recurType = null
            recurCount = null
            recurInterval = null
            recurUntil = null
            excludeDays?.clear()
            recurDaysOfWeek?.clear()
        }

        // Set recurUntil date based on the recurCount value
        if (recurCount && !recurUntil) {
           Date recurCountDate = startTime

           for (int i in 1..(recurCount - 1)) {
               recurCountDate = eventService.findNextOccurrence(this, new DateTime(recurCountDate).plusMinutes(1).toDate())
           }

           recurUntil = new DateTime(recurCountDate).plusMinutes(durationMinutes).toDate()
        }
        
    }

    def beforeUpdate() {
        updateRecurringValues()
    }
    
    def beforeInsert() {
        updateRecurringValues()
    }
    
    def beforeDelete() {
        def associatedEvents = Event.withCriteria {
            eq('sourceEvent.id', this.id)
        }

        associatedEvents.each{def event ->
            event.with {
                sourceEvent = null
                save(flush: true)
            }
        }
        
    }
	
	def closeSourceEventIfRequired() {
		def sourceEvent = this.sourceEvent
		if(sourceEvent) {
			def anyNotClosed = sourceEvent?.associatedEvents()?.any{ it.status != 'CLOSED'}
			if(!anyNotClosed) {
				sourceEvent.status = 'CLOSED'
				sourceEvent.save(flush:true)
			}
		}
	}
	
	def closeAssociatedEventsIfRequired() {
		def associatedEvents = this.associatedEvents()
		associatedEvents?.each {
			if(it.status != 'CLOSED') {
				it.status = 'CLOSED'
				it.save(flush:true)
			}
		}
	}
	
	def associatedEvents(){
		def associatedEvents = Event.withCriteria {
			eq('sourceEvent.id', this.id)
		}
		associatedEvents
	}
}


public enum EventRecurType {
    DAILY('Daily'),
    WEEKLY('Weekly'),
    MONTHLY('Monthly'),
    YEARLY('Yearly')

    String name

    EventRecurType(String name) {
        this.name = name
    }
}
