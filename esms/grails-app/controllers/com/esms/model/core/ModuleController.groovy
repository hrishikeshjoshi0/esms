package com.esms.model.core



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ModuleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        Module.async.task {
            [moduleInstanceList: list(params), count: count() ]
        }.then { result ->
            respond result.moduleInstanceList, model:[moduleInstanceCount: result.count]
        }
    }

    def show(Long id) {
        Module.async.get(id).then { moduleInstance ->
            respond moduleInstance
        }
    }

    def create() {
        respond new Module(params)
    }

    def save(Module moduleInstance) {
        Module.async.withTransaction {
            if (moduleInstance == null) {
                notFound()
                return
            }

            if(moduleInstance.hasErrors()) {
                respond moduleInstance.errors, view:'create' // STATUS CODE 422
                return
            }

            moduleInstance.save flush:true
            request.withFormat {
                form {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'moduleInstance.label', default: 'Module'), moduleInstance.id])
                    redirect moduleInstance
                }
                '*' { respond moduleInstance, [status: CREATED] }
            }
        }
    }

    def edit(Long id) {
        Module.async.get(id).then { moduleInstance ->
            respond moduleInstance
        }
    }

    def update(Long id) {
        Module.async.withTransaction {
            def moduleInstance = Module.get(id)
            if (moduleInstance == null) {
                notFound()
                return
            }

            moduleInstance.properties = params
            if( !moduleInstance.save(flush:true) ) {
                respond moduleInstance.errors, view:'edit' // STATUS CODE 422
                return
            }

            request.withFormat {
                form {
                    flash.message = message(code: 'default.updated.message', args: [message(code: 'Module.label', default: 'Module'), moduleInstance.id])
                    redirect moduleInstance
                }
                '*'{ respond moduleInstance, [status: OK] }
            }
        }
    }

    def delete(Long id) {
        Module.async.withTransaction {
            def moduleInstance = Module.get(id)
            if (moduleInstance == null) {
                notFound()
                return
            }

            moduleInstance.delete flush:true

            request.withFormat {
                form {
                    flash.message = message(code: 'default.deleted.message', args: [message(code: 'Module.label', default: 'Module'), moduleInstance.id])
                    redirect action:"index", method:"GET"
                }
                '*'{ render status: NO_CONTENT }
            }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'moduleInstance.label', default: 'Module'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
