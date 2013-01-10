package com.esms.party



import org.junit.*

import com.esms.model.party.PartyGroup;

import grails.test.mixin.*

@TestFor(PartyGroupController)
@Mock(PartyGroup)
class PartyGroupControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/partyGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.partyGroupInstanceList.size() == 0
        assert model.partyGroupInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.partyGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.partyGroupInstance != null
        assert view == '/partyGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/partyGroup/show/1'
        assert controller.flash.message != null
        assert PartyGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/partyGroup/list'

        populateValidParams(params)
        def partyGroup = new PartyGroup(params)

        assert partyGroup.save() != null

        params.id = partyGroup.id

        def model = controller.show()

        assert model.partyGroupInstance == partyGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/partyGroup/list'

        populateValidParams(params)
        def partyGroup = new PartyGroup(params)

        assert partyGroup.save() != null

        params.id = partyGroup.id

        def model = controller.edit()

        assert model.partyGroupInstance == partyGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/partyGroup/list'

        response.reset()

        populateValidParams(params)
        def partyGroup = new PartyGroup(params)

        assert partyGroup.save() != null

        // test invalid parameters in update
        params.id = partyGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/partyGroup/edit"
        assert model.partyGroupInstance != null

        partyGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/partyGroup/show/$partyGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        partyGroup.clearErrors()

        populateValidParams(params)
        params.id = partyGroup.id
        params.version = -1
        controller.update()

        assert view == "/partyGroup/edit"
        assert model.partyGroupInstance != null
        assert model.partyGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/partyGroup/list'

        response.reset()

        populateValidParams(params)
        def partyGroup = new PartyGroup(params)

        assert partyGroup.save() != null
        assert PartyGroup.count() == 1

        params.id = partyGroup.id

        controller.delete()

        assert PartyGroup.count() == 0
        assert PartyGroup.get(partyGroup.id) == null
        assert response.redirectedUrl == '/partyGroup/list'
    }
}
