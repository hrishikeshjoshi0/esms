package com.esms.model.party



import org.junit.*
import grails.test.mixin.*

/**
 * ContactControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ContactController)
@Mock(Contact)
class ContactControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/contact/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.contactInstanceList.size() == 0
        assert model.contactInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.contactInstance != null
    }

    void testSave() {
        controller.save()

        assert model.contactInstance != null
        assert view == '/contact/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/contact/show/1'
        assert controller.flash.message != null
        assert Contact.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/contact/list'


        populateValidParams(params)
        def contact = new Contact(params)

        assert contact.save() != null

        params.id = contact.id

        def model = controller.show()

        assert model.contactInstance == contact
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/contact/list'


        populateValidParams(params)
        def contact = new Contact(params)

        assert contact.save() != null

        params.id = contact.id

        def model = controller.edit()

        assert model.contactInstance == contact
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/contact/list'

        response.reset()


        populateValidParams(params)
        def contact = new Contact(params)

        assert contact.save() != null

        // test invalid parameters in update
        params.id = contact.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/contact/edit"
        assert model.contactInstance != null

        contact.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/contact/show/$contact.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        contact.clearErrors()

        populateValidParams(params)
        params.id = contact.id
        params.version = -1
        controller.update()

        assert view == "/contact/edit"
        assert model.contactInstance != null
        assert model.contactInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/contact/list'

        response.reset()

        populateValidParams(params)
        def contact = new Contact(params)

        assert contact.save() != null
        assert Contact.count() == 1

        params.id = contact.id

        controller.delete()

        assert Contact.count() == 0
        assert Contact.get(contact.id) == null
        assert response.redirectedUrl == '/contact/list'
    }
}
