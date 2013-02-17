package com.esms.model.payment



import org.junit.*
import grails.test.mixin.*

/**
 * PaymentItemControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PaymentItemController)
@Mock(PaymentItem)
class PaymentItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/paymentItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.paymentItemInstanceList.size() == 0
        assert model.paymentItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.paymentItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.paymentItemInstance != null
        assert view == '/paymentItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/paymentItem/show/1'
        assert controller.flash.message != null
        assert PaymentItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentItem/list'


        populateValidParams(params)
        def paymentItem = new PaymentItem(params)

        assert paymentItem.save() != null

        params.id = paymentItem.id

        def model = controller.show()

        assert model.paymentItemInstance == paymentItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentItem/list'


        populateValidParams(params)
        def paymentItem = new PaymentItem(params)

        assert paymentItem.save() != null

        params.id = paymentItem.id

        def model = controller.edit()

        assert model.paymentItemInstance == paymentItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/paymentItem/list'

        response.reset()


        populateValidParams(params)
        def paymentItem = new PaymentItem(params)

        assert paymentItem.save() != null

        // test invalid parameters in update
        params.id = paymentItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/paymentItem/edit"
        assert model.paymentItemInstance != null

        paymentItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/paymentItem/show/$paymentItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        paymentItem.clearErrors()

        populateValidParams(params)
        params.id = paymentItem.id
        params.version = -1
        controller.update()

        assert view == "/paymentItem/edit"
        assert model.paymentItemInstance != null
        assert model.paymentItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/paymentItem/list'

        response.reset()

        populateValidParams(params)
        def paymentItem = new PaymentItem(params)

        assert paymentItem.save() != null
        assert PaymentItem.count() == 1

        params.id = paymentItem.id

        controller.delete()

        assert PaymentItem.count() == 0
        assert PaymentItem.get(paymentItem.id) == null
        assert response.redirectedUrl == '/paymentItem/list'
    }
}
