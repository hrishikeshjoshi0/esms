package com.esms.model.order



import org.junit.*
import grails.test.mixin.*

/**
 * OrderItemControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(OrderItemController)
@Mock(OrderItem)
class OrderItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/orderItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.orderItemInstanceList.size() == 0
        assert model.orderItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.orderItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.orderItemInstance != null
        assert view == '/orderItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/orderItem/show/1'
        assert controller.flash.message != null
        assert OrderItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/orderItem/list'


        populateValidParams(params)
        def orderItem = new OrderItem(params)

        assert orderItem.save() != null

        params.id = orderItem.id

        def model = controller.show()

        assert model.orderItemInstance == orderItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/orderItem/list'


        populateValidParams(params)
        def orderItem = new OrderItem(params)

        assert orderItem.save() != null

        params.id = orderItem.id

        def model = controller.edit()

        assert model.orderItemInstance == orderItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/orderItem/list'

        response.reset()


        populateValidParams(params)
        def orderItem = new OrderItem(params)

        assert orderItem.save() != null

        // test invalid parameters in update
        params.id = orderItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/orderItem/edit"
        assert model.orderItemInstance != null

        orderItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/orderItem/show/$orderItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        orderItem.clearErrors()

        populateValidParams(params)
        params.id = orderItem.id
        params.version = -1
        controller.update()

        assert view == "/orderItem/edit"
        assert model.orderItemInstance != null
        assert model.orderItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/orderItem/list'

        response.reset()

        populateValidParams(params)
        def orderItem = new OrderItem(params)

        assert orderItem.save() != null
        assert OrderItem.count() == 1

        params.id = orderItem.id

        controller.delete()

        assert OrderItem.count() == 0
        assert OrderItem.get(orderItem.id) == null
        assert response.redirectedUrl == '/orderItem/list'
    }
}
