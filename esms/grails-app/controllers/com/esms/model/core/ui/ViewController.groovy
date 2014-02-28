package com.esms.model.core.ui


import org.springframework.dao.DataIntegrityViolationException
import org.grails.plugin.filterpane.FilterPaneUtils

class ViewController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def filterPaneService

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
        [viewInstanceList: View.list(params), viewInstanceTotal: View.count()]
    }

    def filter = {
		if(!params.offset) {
			params.offset= 0
		}
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		render( view:'list', model:[ viewInstanceList: filterPaneService.filter( params, View), 
			viewInstanceTotal: filterPaneService.count( params, View), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}

    def create() {
		switch (request.method) {
		case 'GET':
			[viewInstance: new View(params)]
			break
		case 'POST':
	        def viewInstance = new View(params)
	        viewInstance.controller = params.paramController
	        viewInstance.action = params.paramAction

	        if (!viewInstance.save(flush: true)) {
	            render view: 'create', model: [viewInstance: viewInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'view.label', default: 'View'), viewInstance.id])
	        redirect action: 'show', id: viewInstance.id
			break
		}
    }

    def show() {
        def viewInstance = View.get(params.id)
        if (!viewInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'view.label', default: 'View'), params.id])
            redirect action: 'list'
            return
        }

        [viewInstance: viewInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def viewInstance = View.get(params.id)
	        if (!viewInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'view.label', default: 'View'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [viewInstance: viewInstance]
			break
		case 'POST':
	        def viewInstance = View.get(params.id)
	        if (!viewInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'view.label', default: 'View'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (viewInstance.version > version) {
	                viewInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'view.label', default: 'View')] as Object[],
	                          "Another user has updated this View while you were editing")
	                render view: 'edit', model: [viewInstance: viewInstance]
	                return
	            }
	        }

	        viewInstance.properties = params
	        viewInstance.controller = params.paramController
	        viewInstance.action = params.paramAction

	        if (!viewInstance.save(flush: true)) {
	            render view: 'edit', model: [viewInstance: viewInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'view.label', default: 'View'), viewInstance.id])
	        redirect action: 'show', id: viewInstance.id
			break
		}
    }

    def delete() {
        def viewInstance = View.get(params.id)
        if (!viewInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'view.label', default: 'View'), params.id])
            redirect action: 'list'
            return
        }

        try {
            viewInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'view.label', default: 'View'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'view.label', default: 'View'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
