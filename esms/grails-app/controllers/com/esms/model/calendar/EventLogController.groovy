package com.esms.model.calendar

import org.springframework.dao.DataIntegrityViolationException

class EventLogController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [eventLogInstanceList: EventLog.list(params), eventLogInstanceTotal: EventLog.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[eventLogInstance: new EventLog(params)]
			break
		case 'POST':
	        def eventLogInstance = new EventLog(params)
	        if (!eventLogInstance.save(flush: true)) {
	            render view: 'create', model: [eventLogInstance: eventLogInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'eventLog.label', default: 'EventLog'), eventLogInstance.id])
	        redirect action: 'show', id: eventLogInstance.id
			break
		}
    }

    def show() {
        def eventLogInstance = EventLog.get(params.id)
        if (!eventLogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventLog.label', default: 'EventLog'), params.id])
            redirect action: 'list'
            return
        }

        [eventLogInstance: eventLogInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def eventLogInstance = EventLog.get(params.id)
	        if (!eventLogInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventLog.label', default: 'EventLog'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [eventLogInstance: eventLogInstance]
			break
		case 'POST':
	        def eventLogInstance = EventLog.get(params.id)
	        if (!eventLogInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventLog.label', default: 'EventLog'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (eventLogInstance.version > version) {
	                eventLogInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'eventLog.label', default: 'EventLog')] as Object[],
	                          "Another user has updated this EventLog while you were editing")
	                render view: 'edit', model: [eventLogInstance: eventLogInstance]
	                return
	            }
	        }

	        eventLogInstance.properties = params

	        if (!eventLogInstance.save(flush: true)) {
	            render view: 'edit', model: [eventLogInstance: eventLogInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'eventLog.label', default: 'EventLog'), eventLogInstance.id])
	        redirect action: 'show', id: eventLogInstance.id
			break
		}
    }

    def delete() {
        def eventLogInstance = EventLog.get(params.id)
        if (!eventLogInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventLog.label', default: 'EventLog'), params.id])
            redirect action: 'list'
            return
        }

        try {
            eventLogInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'eventLog.label', default: 'EventLog'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'eventLog.label', default: 'EventLog'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
