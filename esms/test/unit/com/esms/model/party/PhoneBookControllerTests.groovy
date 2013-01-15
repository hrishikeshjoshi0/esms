package com.esms.model.party



import org.junit.*
import grails.test.mixin.*

/**
 * PhoneBookControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PhoneBookController)
@Mock(PhoneBook)
class PhoneBookControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/phoneBook/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.phoneBookInstanceList.size() == 0
        assert model.phoneBookInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.phoneBookInstance != null
    }

    void testSave() {
        controller.save()

        assert model.phoneBookInstance != null
        assert view == '/phoneBook/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/phoneBook/show/1'
        assert controller.flash.message != null
        assert PhoneBook.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/phoneBook/list'


        populateValidParams(params)
        def phoneBook = new PhoneBook(params)

        assert phoneBook.save() != null

        params.id = phoneBook.id

        def model = controller.show()

        assert model.phoneBookInstance == phoneBook
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/phoneBook/list'


        populateValidParams(params)
        def phoneBook = new PhoneBook(params)

        assert phoneBook.save() != null

        params.id = phoneBook.id

        def model = controller.edit()

        assert model.phoneBookInstance == phoneBook
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/phoneBook/list'

        response.reset()


        populateValidParams(params)
        def phoneBook = new PhoneBook(params)

        assert phoneBook.save() != null

        // test invalid parameters in update
        params.id = phoneBook.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/phoneBook/edit"
        assert model.phoneBookInstance != null

        phoneBook.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/phoneBook/show/$phoneBook.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        phoneBook.clearErrors()

        populateValidParams(params)
        params.id = phoneBook.id
        params.version = -1
        controller.update()

        assert view == "/phoneBook/edit"
        assert model.phoneBookInstance != null
        assert model.phoneBookInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/phoneBook/list'

        response.reset()

        populateValidParams(params)
        def phoneBook = new PhoneBook(params)

        assert phoneBook.save() != null
        assert PhoneBook.count() == 1

        params.id = phoneBook.id

        controller.delete()

        assert PhoneBook.count() == 0
        assert PhoneBook.get(phoneBook.id) == null
        assert response.redirectedUrl == '/phoneBook/list'
    }
}
