package com.esms.model.maintenance

import org.springframework.dao.DataIntegrityViolationException

class WorkDoneCertificateController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [workDoneCertificateInstanceList: WorkDoneCertificate.list(params), workDoneCertificateInstanceTotal: WorkDoneCertificate.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[workDoneCertificateInstance: new WorkDoneCertificate(params)]
			break
		case 'POST':
	        def workDoneCertificateInstance = new WorkDoneCertificate(params)
	        if (!workDoneCertificateInstance.save(flush: true)) {
	            render view: 'create', model: [workDoneCertificateInstance: workDoneCertificateInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate'), workDoneCertificateInstance.id])
	        redirect action: 'show', id: workDoneCertificateInstance.id
			break
		}
    }

    def show() {
        def workDoneCertificateInstance = WorkDoneCertificate.get(params.id)
        if (!workDoneCertificateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate'), params.id])
            redirect action: 'list'
            return
        }

        [workDoneCertificateInstance: workDoneCertificateInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def workDoneCertificateInstance = WorkDoneCertificate.get(params.id)
	        if (!workDoneCertificateInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate'), params.id])
	            redirect action: 'list'
	            return
	        }

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

    def delete() {
        def workDoneCertificateInstance = WorkDoneCertificate.get(params.id)
        if (!workDoneCertificateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate'), params.id])
            redirect action: 'list'
            return
        }

        try {
            workDoneCertificateInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
