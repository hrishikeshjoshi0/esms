package com.esms.model.calendar

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.order.Order

class TaskController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: ['GET', 'POST']]

	def filterPaneService
	
    def index() {
        redirect action: 'list', params: params
    }
	
	def filter = {
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		render( view:'list', model:[ taskInstanceList: filterPaneService.filter( params, Task),
			taskInstanceTotal: filterPaneService.count( params, Task), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}

    def list() {
       if(!params.offset) {
			params.offset= 0
		} 
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		params.sort="dateTime"
		params."order"="asc"
		
		def taskInstanceList
		def taskInstanceTotal
		if(params.relatedTo) {
			taskInstanceList = Task.findAllByRelatedTo(params.relatedTo,params)
			taskInstanceTotal = Task.countByRelatedTo(params.relatedTo)
		} else {
			taskInstanceList = Task.list(params)
			taskInstanceTotal = Task.count()
		}
		
        [taskInstanceList: taskInstanceList, taskInstanceTotal:taskInstanceTotal]
    }
	
	def administrationTaskListModal() {
		if(!params.offset) {
			 params.offset= 0
		 }
		 if(!params.max) {
			 params.max= grailsApplication.config.esms.settings.max?.toInteger()
		 }
		 
		 def taskInstanceList = Task.withCriteria() {
			 and {
				 eq('relatedTo','ADMINISTRATION')
				 ne("status", 'COMPLETED')
			 }
			 maxResults(params.max)
			 order("dateTime", "asc")
		 }
		 
		 params.sort="dateTime"
		 params."order"="asc"
		 
		 [taskInstanceList: taskInstanceList, taskInstanceTotal: Task.count()]
	 }

    def create() {
		switch (request.method) {
		case 'GET':
        	[taskInstance: new Task(params)]
			break
		case 'POST':
	        def taskInstance = new Task(params)
	        if (!taskInstance.save(flush: true)) {
	            render view: 'create', model: [taskInstance: taskInstance]
	            return
	        }

			flash.message = "New Task Created."
	        redirect action: 'show', id: taskInstance.id
			break
		}
    }

    def show() {
        def taskInstance = Task.get(params.id)
        if (!taskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect action: 'list'
            return
        }

        [taskInstance: taskInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def taskInstance = Task.get(params.id)
	        if (!taskInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [taskInstance: taskInstance]
			break
		case 'POST':
	        def taskInstance = Task.get(params.id)
	        if (!taskInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (taskInstance.version > version) {
	                taskInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'task.label', default: 'Task')] as Object[],
	                          "Another user has updated this Task while you were editing")
	                render view: 'edit', model: [taskInstance: taskInstance]
	                return
	            }
	        }

	        taskInstance.properties = params

	        if (!taskInstance.save(flush: true)) {
	            render view: 'edit', model: [taskInstance: taskInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'task.label', default: 'Task'), taskInstance.id])
	        redirect action: 'show', id: taskInstance.id
			break
		}
    }

    def delete() {
        def taskInstance = Task.get(params.id)
		
		boolean error = false;
		def messages = []
		
		if (!taskInstance) {
			error = true;
			messages << message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
		}
		
		if(taskInstance.relatedTo && taskInstance.relatedToValue) {
			error = true;
			messages << "The task is related to " + taskInstance.relatedTo + " with value " + taskInstance.relatedToValue +". Please remove the associations to delete this task."
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
            taskInstance.delete(flush: true)
			messages << message(code: 'default.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])
			render(contentType: "text/json") {[
					error : false,
					level: "success",
					messages : messages,
					nextUrl : g.createLink(controller:'task',action: 'list')
			]}
        }
        catch (DataIntegrityViolationException e) {
			messages << message(code: 'default.not.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])
			render(contentType: "text/json") {[
				error : false,
				level: "error",
				messages : messages,
				nextUrl : g.createLink(controller:'task',action: 'show',id:params.id)
			]}
        }
    }
}
