package com.esms.model.party

import org.springframework.dao.DataIntegrityViolationException

class EmployeeController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [employeeInstanceList: Employee.list(params), employeeInstanceTotal: Employee.count()]
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
}
