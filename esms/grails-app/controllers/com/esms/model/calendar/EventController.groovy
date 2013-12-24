package com.esms.model.calendar

import grails.converters.JSON

import java.text.SimpleDateFormat

import org.joda.time.DateTime
import org.joda.time.Instant

import com.esms.model.maintenance.WorkDoneCertificate
import com.esms.model.order.Order;
import com.esms.model.party.Organization;

class EventController {
    def eventService

	def index = {
		//redirect action: 'month', params: params
	}
	
	def week = {
	
	}
	
	def day = {
		
	}
	
	def month = {
		def nowCal = Calendar.instance
		Date nowDate = nowCal.time
		
		int y = nowCal.get(Calendar.YEAR)
		int m = nowDate[Calendar.MONTH]
		int d = nowDate[Calendar.DATE]
		
		def s = Calendar.instance
		s.set Calendar.DATE, 1
		s.set Calendar.MONTH, m
		s.set Calendar.YEAR, y
		def startDate = s.getTime()
		
		def e = Calendar.instance
		e.set Calendar.DATE, 1
		e.set Calendar.MONTH, (m+1)
		e.set Calendar.YEAR, y
		def endDate = e.getTime().minus(1)
		
		def (startRange, endRange) = [startDate,endDate]

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
		[events:eventList]
	}
	
	def listView = {
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		params.sort = "startTime"
		params.'order' = "desc"
		
		def listView = Event.list(params)
		def listViewCount = Event.count()
		
		[eventInstanceList : listView,eventInstanceListTotal:listViewCount]
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
		switch (request.method) {
			case 'GET':
				 def eventInstance = new Event()
 		         eventInstance.properties = params
				  
		         [eventInstance: eventInstance]
				 break
			case 'POST':
				 def eventInstance = new Event(params)
		
				 eventInstance.activityLog = 'Init'
		         if (eventInstance.save(flush: true)) {
		            flash.message = "Event Created."
					def order
					if(eventInstance?.relatedTo == 'ORDER' && eventInstance?.relatedToValue) {
						order = Order.findByOrderNumber(eventInstance?.relatedToValue)
						redirect(controller:"order",action: "show",id:order?.id)
						return
					}
					
					if(eventInstance?.relatedTo == 'EVENT' && eventInstance?.relatedToValue) {
						redirect(controller:"event",action: "show",id:eventInstance?.sourceEvent?.id)
						return
					}
					
					if(eventInstance.status == 'CLOSED') {
						eventInstance.closeSourceEventIfRequired()
						eventInstance.closeAssociatedEventsIfRequired()
					}
					
		            redirect(action: "show", id: eventInstance.id)
					//println "Redirecting to " + request.getHeader('referer')
					//redirect(uri: request.getHeader('referer') )
		         }
		         else {
				 	flash.message = "Error Encountered."
		            render(view: "create", model: [eventInstance: eventInstance])
		         }
			}
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
			def order
			if(eventInstance?.relatedTo == 'ORDER' && eventInstance?.relatedToValue) {
				order = Order.findByOrderNumber(eventInstance?.relatedToValue)
				redirect(controller:"order",action: "show",id:order?.id)
				return
			}
            redirect(action: "show", id: eventInstance.id)
			
			//println "Redirecting to " + request.getHeader('referer')
			//redirect(uri: request.getHeader('referer') )
        }
        else {
			flash.message = "Error Encountered."
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
             flash.message = "Event Updated."
			def order
			
			if(eventInstance.status == 'CLOSED') {
				eventInstance.closeSourceEventIfRequired()
				eventInstance.closeAssociatedEventsIfRequired()
				redirect(controller:"event",action: "listView")
				return
			}
			
			if(eventInstance?.relatedTo == 'ORDER' && eventInstance?.relatedToValue) {
				order = Order.findByOrderNumber(eventInstance?.relatedToValue)
				redirect(controller:"order",action: "show",id:order?.id)
				return
			}
			
            redirect(controller:"event",action: "listView")
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
			[eventInstance:eventInstance,eventLogInstance:new EventLog(params)]
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
				def event = Event.get(params.id)
				def workDoneCertificateInstance
				if(event?.workDoneCertificate) {
					workDoneCertificateInstance = event?.workDoneCertificate
				} else {
					def party = event?.party
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
					workDoneCertificateInstance = new WorkDoneCertificate(params)
					workDoneCertificateInstance.event = event
				}
				[workDoneCertificateInstance: workDoneCertificateInstance]
				break
			case 'POST':
				def event = Event.get(params.'event.id')
				def workDoneCertificateInstance
				if(event?.workDoneCertificate) {
					workDoneCertificateInstance = event?.workDoneCertificate
					workDoneCertificateInstance.properties = params 
				} else {
					workDoneCertificateInstance = new WorkDoneCertificate(params)
				}
				
				if (!workDoneCertificateInstance.save(flush: true)) {
					render view: 'attachWorkDoneCertificate', model: [workDoneCertificateInstance: workDoneCertificateInstance]
					return
				}
	
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
	
	def upcomingEvents = {
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		params.sort = "startTime"
		params.'order' = "desc"
		def upcomingEvents = Event.findAllByStartTimeGreaterThanAndStatusInList(new Date(),['PLANNED','NOT HELD'],params)
		def upcomingEventsCount = Event.countByStartTimeGreaterThanAndStatusInList(new Date(),['PLANNED','NOT HELD'])
		
		[upcomingEvents:upcomingEvents,upcomingEventsCount:upcomingEventsCount]
	}
	
	def overdueEvents = {
		params.sort = "startTime"
		params.'order' = "desc"
		
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		def overdueEvents = Event.findAllByStartTimeLessThanAndStatusInList(new Date(),['PLANNED','NOT HELD'],params)
		def overdueEventsCount = Event.countByStartTimeLessThanAndStatusInList(new Date(),['PLANNED','NOT HELD'])
		[overdueEvents:overdueEvents,overdueEventsCount:overdueEventsCount]
	}
	
	def associatedEvents = {
		def event = Event.get(params.id)
		[eventInstance:event] 
	}
	
}