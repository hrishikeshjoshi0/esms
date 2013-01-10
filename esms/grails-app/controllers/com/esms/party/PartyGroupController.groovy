package com.esms.party

import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.party.PartyGroup;

class PartyGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [partyGroupInstanceList: PartyGroup.list(params), partyGroupInstanceTotal: PartyGroup.count()]
    }

    def create() {
        [partyGroupInstance: new PartyGroup(params)]
    }

    def save() {
        def partyGroupInstance = new PartyGroup(params)
        if (!partyGroupInstance.save(flush: true)) {
            render(view: "create", model: [partyGroupInstance: partyGroupInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), partyGroupInstance.partyId])
        redirect(action: "show", id: partyGroupInstance.id)
    }

    def show(Long id) {
        def partyGroupInstance = PartyGroup.get(id)
        if (!partyGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), id])
            redirect(action: "list")
            return
        }

        [partyGroupInstance: partyGroupInstance]
    }

    def edit(Long id) {
        def partyGroupInstance = PartyGroup.get(id)
        if (!partyGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), id])
            redirect(action: "list")
            return
        }

        [partyGroupInstance: partyGroupInstance]
    }

    def update(Long id, Long version) {
        def partyGroupInstance = PartyGroup.get(id)
        if (!partyGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (partyGroupInstance.version > version) {
                partyGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'partyGroup.label', default: 'PartyGroup')] as Object[],
                          "Another user has updated this PartyGroup while you were editing")
                render(view: "edit", model: [partyGroupInstance: partyGroupInstance])
                return
            }
        }

        partyGroupInstance.properties = params

        if (!partyGroupInstance.save(flush: true)) {
            render(view: "edit", model: [partyGroupInstance: partyGroupInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), partyGroupInstance.partyId])
        redirect(action: "show", id: partyGroupInstance.partyId)
    }

    def delete(Long id) {
        def partyGroupInstance = PartyGroup.get(id)
        if (!partyGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), id])
            redirect(action: "list")
            return
        }

        try {
            partyGroupInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'partyGroup.label', default: 'PartyGroup'), id])
            redirect(action: "show", id: id)
        }
    }
}
