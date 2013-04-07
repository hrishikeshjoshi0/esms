package com.esms.model.order



import org.junit.*
import grails.test.mixin.*

/**
 * PurchaseOrderControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(PurchaseOrderController)
@Mock(PurchaseOrder)
class PurchaseOrderControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/purchaseOrder/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.purchaseOrderInstanceList.size() == 0
        assert model.purchaseOrderInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.purchaseOrderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.purchaseOrderInstance != null
        assert view == '/purchaseOrder/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/purchaseOrder/show/1'
        assert controller.flash.message != null
        assert PurchaseOrder.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/purchaseOrder/list'


        populateValidParams(params)
        def purchaseOrder = new PurchaseOrder(params)

        assert purchaseOrder.save() != null

        params.id = purchaseOrder.id

        def model = controller.show()

        assert model.purchaseOrderInstance == purchaseOrder
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/purchaseOrder/list'


        populateValidParams(params)
        def purchaseOrder = new PurchaseOrder(params)

        assert purchaseOrder.save() != null

        params.id = purchaseOrder.id

        def model = controller.edit()

        assert model.purchaseOrderInstance == purchaseOrder
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/purchaseOrder/list'

        response.reset()


        populateValidParams(params)
        def purchaseOrder = new PurchaseOrder(params)

        assert purchaseOrder.save() != null

        // test invalid parameters in update
        params.id = purchaseOrder.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/purchaseOrder/edit"
        assert model.purchaseOrderInstance != null

        purchaseOrder.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/purchaseOrder/show/$purchaseOrder.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        purchaseOrder.clearErrors()

        populateValidParams(params)
        params.id = purchaseOrder.id
        params.version = -1
        controller.update()

        assert view == "/purchaseOrder/edit"
        assert model.purchaseOrderInstance != null
        assert model.purchaseOrderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/purchaseOrder/list'

        response.reset()

        populateValidParams(params)
        def purchaseOrder = new PurchaseOrder(params)

        assert purchaseOrder.save() != null
        assert PurchaseOrder.count() == 1

        params.id = purchaseOrder.id

        controller.delete()

        assert PurchaseOrder.count() == 0
        assert PurchaseOrder.get(purchaseOrder.id) == null
        assert response.redirectedUrl == '/purchaseOrder/list'
    }
}
