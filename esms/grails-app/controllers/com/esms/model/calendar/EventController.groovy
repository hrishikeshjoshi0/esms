package com.esms.model.calendar

import grails.converters.JSON

import java.text.SimpleDateFormat

import org.joda.time.DateTime
import org.joda.time.Instant

import com.esms.model.maintenance.WorkDoneCertificate
import com.esms.model.party.Organization;

class EventController {
    def eventService

    def index = {

    }
	
	def listView = {
		def listView = Event.list(params)
		[eventInstanceList : listView,eventInstanceTotal:listView.size()]
	}

    def list = {
        def (startRange, endRange) = [params.long('start'), params.long('end')].collect { new Instant(it  * 1000L).toDate() }

        def events = Event.withCriteria {
            or {
                and {
                    eq("isRecurring", false)
                    between("startTime", startRange, endRange)
                }
                and {
                    eq("isRecurring", true)
                    or {
                        isNull("recurUntil")
                        ge("recurUntil", startRange)
                    }
                }
            }
        }


        // iterate through to see if we need to add additional Event instances because of recurring
        // events
        def eventList = []

        def displayDateFormatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss")

        events.each {event ->

            def dates = eventService.findOccurrencesInRange(event, startRange, endRange)

            dates.each { date ->
                DateTime startTime = new DateTime(date)
                DateTime endTime = startTime.plusMinutes(event.durationMinutes)

                /*
                    start/end and occurrenceStart/occurrenceEnd are separate because fullCalendar will use the client's local timezone (which may be different than the server's timezone)
                    start/end are used to render the events on the calendar and the occurrenceStart/occurrenceEnd values are passed along to the show popup
                */

                eventList << [
                        id: event.id,
                        title: event.title,
                        allDay: false,
                        start: displayDateFormatter.format(startTime.toDate()),
                        end: displayDateFormatter.format(endTime.toDate()),
                        occurrenceStart: startTime.toInstant().millis,
                        occurrenceEnd: endTime.toInstant().millis
                ]
            }
        }

        withFormat {
            html {
                [eventInstanceList: eventList]
            }
            json {
                render eventList as JSON
            }
        }
    }

    def create = {
        def eventInstance = new Event()
        eventInstance.properties = params

        [eventInstance: eventInstance]
    }
	
    def show = {
        def (occurrenceStart, occurrenceEnd) = [params.long('occurrenceStart'), params.long('occurrenceEnd')]
        def eventInstance = Event.get(params.id)

        if (!eventInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])}"
            redirect(action: "index")
        }
        else {
            def model = [eventInstance: eventInstance, occurrenceStart: occurrenceStart, occurrenceEnd: occurrenceEnd]

            if (request.xhr) {
                render(template: "showPopup", model: model)
            }
            else {
                model
            }
        }

    }

    def save = {
        def eventInstance = new Event(params)
		
		eventInstance.activityLog = 'Init'
        if (eventInstance.save(flush: true)) {
            flash.message = "Event Created."
            redirect(action: "show", id: eventInstance.id)
        }
        else {
            render(view: "create", model: [eventInstance: eventInstance])
        }

    }

    def edit = {
        def eventInstance = Event.get(params.id)
        def (occurrenceStart, occurrenceEnd) = [params.long('occurrenceStart'), params.long('occurrenceEnd')]

        if (!eventInstance) {
            flash.message = "Event Updated."
            redirect(action: "index")
        }
        else {
            [eventInstance: eventInstance, occurrenceStart: occurrenceStart, occurrenceEnd: occurrenceEnd]
        }

    }

    def update = {
        def eventInstance = Event.get(params.id)
        String editType = params.editType

        def result = eventService.updateEvent(eventInstance, editType, params)

        if (!result.error) {
            flash.message = "${message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])}"
            redirect(action: "index")
        }
        if (result.error == 'not.found') {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])}"
            redirect(action: "index")
        }
        else if (result.error == 'has.errors') {
            render(view: "edit", model: [eventInstance: eventInstance])
        }

    }


    def delete = {
        def eventInstance = Event.get(params.id)
        String deleteType = params.deleteType
        Date occurrenceStart = new Instant(params.long('occurrenceStart')).toDate()

        def result = eventService.deleteEvent(eventInstance, occurrenceStart, deleteType)

        if (!result.error) {
            redirect(action: "index")
        }
        if (result.error == 'not.found') {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])}"
            redirect(action: "index")
        }
        else if (result.error == 'has.errors') {
            redirect(action: "index")
        }
    }
	
	def createEventLog = {
		switch (request.method) {
		case 'GET':
        	def eventInstance = Event.get(params.id)
			[eventInstance:eventInstance,eventLogInstance:new EventLog()]
			break
		case 'POST':
			def eventLogInstance = new EventLog(params)
			eventLogInstance.save(flush:true)
			flash.message = "Event Log Added"
			redirect(action: "show", id: eventLogInstance.event.id)
			break
		}
	}
	
	def editWorkDoneCertificate = {
		switch (request.method) {
			case 'GET':
				def workDoneCertificateInstance = WorkDoneCertificate.get(params.id)
				def party = workDoneCertificateInstance?.event?.party
				params.customerName = party?.name
				[workDoneCertificateInstance: workDoneCertificateInstance]
				break
			case 'POST':
				def workDoneCertificateInstance = WorkDoneCertificate.get(params.id)
		        if (!workDoneCertificateInstance) {
		            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate'), params.id])
		            redirect action: 'list'
		            return
		        }
	
		        if (params.version) {
		            def version = params.version.toLong()
		            if (workDoneCertificateInstance.version > version) {
		                workDoneCertificateInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
		                          [message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate')] as Object[],
		                          "Another user has updated this WorkDoneCertificate while you were editing")
		                render view: 'edit', model: [workDoneCertificateInstance: workDoneCertificateInstance]
		                return
		            }
		        }
	
		        workDoneCertificateInstance.properties = params
	
		        if (!workDoneCertificateInstance.save(flush: true)) {
		            render view: 'edit', model: [workDoneCertificateInstance: workDoneCertificateInstance]
		            return
		        }
	
				flash.message = message(code: 'default.updated.message', args: [message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate'), workDoneCertificateInstance.id])
		        redirect action: 'show', id: workDoneCertificateInstance.id
				break
			}
	}
	
	def attachWorkDoneCertificate = {
		switch (request.method) {
			case 'GET':
				def party = Event.get(params.id)?.party
				if(party?.partyType == "ORGANIZATION") {
					params.customerName = party?.name
					
					if(party?.addresses) {
						params.location = it?.buildingName
					}
				} else if(party?.partyType == "CONTACT") {
					params.customerName = party?.firstName + " " + party?.lastName
					
					party?.addresses?.each {
						params.location = it?.buildingName
					}
				}
				[workDoneCertificateInstance: new WorkDoneCertificate(params)]
				break
			case 'POST':
				def workDoneCertificateInstance = new WorkDoneCertificate(params)
				if (!workDoneCertificateInstance.save(flush: true)) {
					render view: 'create', model: [workDoneCertificateInstance: workDoneCertificateInstance]
					return
				}
	
				workDoneCertificateInstance.save(flush:true)
				flash.message = "Work Done Certificate Attached."
				redirect(action: "show", id: workDoneCertificateInstance.event.id)
				break
			}
	}
	
	def recentEvents = {
		params.max = Math.min(params.max ? params.int('max') : 5, 10)
		params.sort = "id"
		params.'order' = "desc"
		
		def recentEvents = Event.list(params)
		def model = [recentEvents : recentEvents]
		render(model:model,view:'/_menu/recentEvents')
	}
	
	def getLatestTaskCount = {
		def events = Event.withCriteria {
			'in' ('status',['PLANNED','NOT HELD']) 
		}
		render events?events.size():0
	}
}