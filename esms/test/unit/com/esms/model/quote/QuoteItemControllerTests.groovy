package com.esms.model.quote



import org.junit.*
import grails.test.mixin.*

/**
 * QuoteItemControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(QuoteItemController)
@Mock(QuoteItem)
class QuoteItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/quoteItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.quoteItemInstanceList.size() == 0
        assert model.quoteItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.quoteItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.quoteItemInstance != null
        assert view == '/quoteItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/quoteItem/show/1'
        assert controller.flash.message != null
        assert QuoteItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/quoteItem/list'


        populateValidParams(params)
        def quoteItem = new QuoteItem(params)

        assert quoteItem.save() != null

        params.id = quoteItem.id

        def model = controller.show()

        assert model.quoteItemInstance == quoteItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/quoteItem/list'


        populateValidParams(params)
        def quoteItem = new QuoteItem(params)

        assert quoteItem.save() != null

        params.id = quoteItem.id

        def model = controller.edit()

        assert model.quoteItemInstance == quoteItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/quoteItem/list'

        response.reset()


        populateValidParams(params)
        def quoteItem = new QuoteItem(params)

        assert quoteItem.save() != null

        // test invalid parameters in update
        params.id = quoteItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/quoteItem/edit"
        assert model.quoteItemInstance != null

        quoteItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/quoteItem/show/$quoteItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        quoteItem.clearErrors()

        populateValidParams(params)
        params.id = quoteItem.id
        params.version = -1
        controller.update()

        assert view == "/quoteItem/edit"
        assert model.quoteItemInstance != null
        assert model.quoteItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/quoteItem/list'

        response.reset()

        populateValidParams(params)
        def quoteItem = new QuoteItem(params)

        assert quoteItem.save() != null
        assert QuoteItem.count() == 1

        params.id = quoteItem.id

        controller.delete()

        assert QuoteItem.count() == 0
        assert QuoteItem.get(quoteItem.id) == null
        assert response.redirectedUrl == '/quoteItem/list'
    }
}
