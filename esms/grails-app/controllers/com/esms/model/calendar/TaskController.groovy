package com.esms.model.calendar

import grails.converters.JSON;

import org.springframework.dao.DataIntegrityViolationException

class TaskController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [taskInstanceList: Task.list(params), taskInstanceTotal: Task.count()]
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
        if (!taskInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect action: 'list'
            return
        }

        try {
            taskInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'task.label', default: 'Task'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
