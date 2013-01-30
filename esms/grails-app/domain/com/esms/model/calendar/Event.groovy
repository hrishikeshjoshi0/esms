package com.esms.model.calendar

import org.joda.time.DateTime
import org.joda.time.Minutes

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

    static hasMany = [recurDaysOfWeek: Integer, excludeDays: Date]
    static transients = ['durationMinutes']

    def eventService

    static constraints = {
        title(nullable: false, blank: false)
        location(nullable: true, blank:  true)
        description(nullable: true, blank: true)
        recurType(nullable: true)
        recurInterval(nullable: true)
        recurUntil(nullable: true)
        recurCount(nullable: true)
        startTime(nullable: false)
        excludeDays(nullable: true)
        sourceEvent(nullable: true)
        startTime(required: true, nullable: false)
        endTime(required: true, nullable: false, validator: {val, obj -> val > obj.startTime} )
        recurDaysOfWeek(validator: {val, obj -> 
            if (obj.recurType == EventRecurType.WEEKLY && !val) {return 'null'}
        })
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
