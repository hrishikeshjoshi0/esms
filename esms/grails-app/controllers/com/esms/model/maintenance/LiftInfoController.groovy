package com.esms.model.maintenance

import org.springframework.dao.DataIntegrityViolationException

class LiftInfoController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: ['GET', 'POST']]

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [liftInfoInstanceList: LiftInfo.list(params), liftInfoInstanceTotal: LiftInfo.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[liftInfoInstance: new LiftInfo(params)]
			break
		case 'POST':
	        def liftInfoInstance = new LiftInfo(params)
	        if (!liftInfoInstance.save(flush: true)) {
	            render view: 'create', model: [liftInfoInstance: liftInfoInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'liftInfo.label', default: 'LiftInfo'), liftInfoInstance.id])
	        redirect action: 'show', id: liftInfoInstance.id
			break
		}
    }

    def show() {
        def liftInfoInstance = LiftInfo.get(params.id)
        if (!liftInfoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'liftInfo.label', default: 'LiftInfo'), params.id])
            redirect action: 'list'
            return
        }

        [liftInfoInstance: liftInfoInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def liftInfoInstance = LiftInfo.get(params.id)
	        if (!liftInfoInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'liftInfo.label', default: 'LiftInfo'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [liftInfoInstance: liftInfoInstance]
			break
		case 'POST':
	        def liftInfoInstance = LiftInfo.get(params.id)
	        if (!liftInfoInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'liftInfo.label', default: 'LiftInfo'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (liftInfoInstance.version > version) {
	                liftInfoInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'liftInfo.label', default: 'LiftInfo')] as Object[],
	                          "Another user has updated this LiftInfo while you were editing")
	                render view: 'edit', model: [liftInfoInstance: liftInfoInstance]
	                return
	            }
	        }

	        liftInfoInstance.properties = params

	        if (!liftInfoInstance.save(flush: true)) {
	            render view: 'edit', model: [liftInfoInstance: liftInfoInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'liftInfo.label', default: 'LiftInfo'), liftInfoInstance.id])
	        redirect action: 'show', id: liftInfoInstance.id
			break
		}
    }

    def delete() {
        def liftInfoInstance = LiftInfo.get(params.id)
		
		boolean error = false;
		def messages = []
		
		if (!liftInfoInstance) {
			error = true;
			messages <<  message(code: 'default.not.found.message', args: [message(code: 'liftInfo.label', default: 'LiftInfo'), params.id])
		}
		
		if(error) {
			render(contentType: "text/json") {
				[
					error : true,
					level: "warning",
					messages : messages
				]
			}
			return
		}

        try {
            liftInfoInstance.delete(flush: true)
			messages << message(code: 'default.deleted.message', args: [message(code: 'liftInfo.label', default: 'Lift Info'), params.id])
			render(contentType: "text/json") {[
					error : false,
					level: "success",
					messages : messages,
					nextUrl : g.createLink(controller:'organization',action: 'show',id:organization?.id)
			]}
        }
        catch (DataIntegrityViolationException e) {
			messages << message(code: 'default.not.deleted.message', args: [message(code: 'liftInfo.label', default: 'Lift Info'), params.id])
			render(contentType: "text/json") {[
				error : false,
				level: "error",
				messages : messages,
				nextUrl : g.createLink(action: 'show',id:params.id)
			]}
        }
    }
}
