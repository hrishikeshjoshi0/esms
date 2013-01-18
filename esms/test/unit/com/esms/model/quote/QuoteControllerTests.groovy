package com.esms.model.quote



import org.junit.*
import grails.test.mixin.*

/**
 * QuoteControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(QuoteController)
@Mock(Quote)
class QuoteControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/quote/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.quoteInstanceList.size() == 0
        assert model.quoteInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.quoteInstance != null
    }

    void testSave() {
        controller.save()

        assert model.quoteInstance != null
        assert view == '/quote/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/quote/show/1'
        assert controller.flash.message != null
        assert Quote.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/quote/list'


        populateValidParams(params)
        def quote = new Quote(params)

        assert quote.save() != null

        params.id = quote.id

        def model = controller.show()

        assert model.quoteInstance == quote
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/quote/list'


        populateValidParams(params)
        def quote = new Quote(params)

        assert quote.save() != null

        params.id = quote.id

        def model = controller.edit()

        assert model.quoteInstance == quote
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/quote/list'

        response.reset()


        populateValidParams(params)
        def quote = new Quote(params)

        assert quote.save() != null

        // test invalid parameters in update
        params.id = quote.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/quote/edit"
        assert model.quoteInstance != null

        quote.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/quote/show/$quote.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        quote.clearErrors()

        populateValidParams(params)
        params.id = quote.id
        params.version = -1
        controller.update()

        assert view == "/quote/edit"
        assert model.quoteInstance != null
        assert model.quoteInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/quote/list'

        response.reset()

        populateValidParams(params)
        def quote = new Quote(params)

        assert quote.save() != null
        assert Quote.count() == 1

        params.id = quote.id

        controller.delete()

        assert Quote.count() == 0
        assert Quote.get(quote.id) == null
        assert response.redirectedUrl == '/quote/list'
    }
}
