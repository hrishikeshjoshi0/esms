package com.esms.model.party

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

class EmployeeController {

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
		
        [employeeInstanceList: Employee.list(params), employeeInstanceTotal: Employee.count()]
    }
	
	def filter = {
		if(!params.offset) {
			params.offset= 0
		} 
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		render( view:'list', model:[ employeeInstanceTotal: filterPaneService.filter( params, Employee),
			employeeInstanceTotal: filterPaneService.count( params, Employee), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}

    def create() {
		switch (request.method) {
		case 'GET':
			def employee = new Employee(params)
			def phoneBookInstance = new PhoneBook()
        	[employeeInstance: employee,phoneBookInstance:phoneBookInstance,addressInstance:new Address()]
			break
		case 'POST':
	        def employeeInstance = new Employee(params)
			
			def list = Party.list();
			int no = (list?list.size():0) + 1;
			employeeInstance.externalId = "EMPL" + String.format("%05d", no)
			employeeInstance.partyType = 'EMPLOYEE'
			employeeInstance.description = ''
			
	        if (!employeeInstance.save(flush: true)) {
	            render view: 'create', model: [employeeInstance: employeeInstance]
	            return
	        }
			
			def phoneBookInstance = new PhoneBook(params)
			phoneBookInstance.party = employeeInstance
			phoneBookInstance.save(flush:true)
			
			def addressInstance = new Address(params)
			addressInstance.party = employeeInstance
			addressInstance.save(flush:true)

			flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance.id])
	        redirect action: 'show', id: employeeInstance.id
			break
		}
    }

    def show() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect action: 'list'
            return
        }

        [employeeInstance: employeeInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def employeeInstance = Employee.get(params.id)
	        if (!employeeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [employeeInstance: employeeInstance]
			break
		case 'POST':
	        def employeeInstance = Employee.get(params.id)
	        if (!employeeInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (employeeInstance.version > version) {
	                employeeInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'employee.label', default: 'Employee')] as Object[],
	                          "Another user has updated this Employee while you were editing")
	                render view: 'edit', model: [employeeInstance: employeeInstance]
	                return
	            }
	        }

	        employeeInstance.properties = params

	        if (!employeeInstance.save(flush: true)) {
	            render view: 'edit', model: [employeeInstance: employeeInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance.id])
	        redirect action: 'show', id: employeeInstance.id
			break
		}
    }

    def delete() {
        def employeeInstance = Employee.get(params.id)
        if (!employeeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect action: 'list'
            return
        }

        try {
            employeeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	
	def markAsTerminated() {
		switch (request.method) {
		case 'GET':
	        def employeeInstance = Employee.get(params.id)
	        [employeeInstance: employeeInstance]
			break
		case 'POST':
	        def employeeInstance = Employee.get(params.id)
	        employeeInstance.employmentEndDate = params.employmentEndDate

	        if (!employeeInstance.save(flush: true)) {
	            render view: 'markAsTerminated', model: [employeeInstance: employeeInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance.id])
	        redirect action: 'show', id: employeeInstance.id
			break
		}
    }
	
	def createAddress() {
		switch (request.method) {
		case 'GET':
			def addressInstance = new Address(params)
			render view: '/_common/modals/createAddress', model: [addressInstance: addressInstance]
			return
		case 'POST':
			def addressInstance = new Address(params)
			if (!addressInstance.save(flush: true)) {
				render view: 'create', model: [addressInstance: addressInstance]
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'contact.label', default: 'Contact'), addressInstance.id])
			redirect controller: 'employee', action: 'show', id: addressInstance?.party?.id
		}
	}
	
	def createPhoneBook() {
		switch (request.method) {
		case 'GET':
			render view: '/_common/modals/createPhoneBook', [phoneBookInstance: new PhoneBook(params)]
			return
		case 'POST':
			def phoneBookInstance = new PhoneBook(params)
			if (!phoneBookInstance.save(flush: true)) {
				render view: 'create', model: [phoneBookInstance: phoneBookInstance]
				return
			}

			flash.message = message(code: 'default.created.message', args: [message(code: 'phoneBook.label', default: 'PhoneBook'), phoneBookInstance.id])
			redirect controller: 'employee', action: 'show', id: phoneBookInstance?.party?.id
			break
		}
	}
}
