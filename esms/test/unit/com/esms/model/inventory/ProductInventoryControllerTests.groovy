package com.esms.model.inventory



import org.junit.*
import grails.test.mixin.*

/**
 * ProductInventoryControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(ProductInventoryController)
@Mock(ProductInventory)
class ProductInventoryControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/productInventory/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.productInventoryInstanceList.size() == 0
        assert model.productInventoryInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.productInventoryInstance != null
    }

    void testSave() {
        controller.save()

        assert model.productInventoryInstance != null
        assert view == '/productInventory/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/productInventory/show/1'
        assert controller.flash.message != null
        assert ProductInventory.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/productInventory/list'


        populateValidParams(params)
        def productInventory = new ProductInventory(params)

        assert productInventory.save() != null

        params.id = productInventory.id

        def model = controller.show()

        assert model.productInventoryInstance == productInventory
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/productInventory/list'


        populateValidParams(params)
        def productInventory = new ProductInventory(params)

        assert productInventory.save() != null

        params.id = productInventory.id

        def model = controller.edit()

        assert model.productInventoryInstance == productInventory
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/productInventory/list'

        response.reset()


        populateValidParams(params)
        def productInventory = new ProductInventory(params)

        assert productInventory.save() != null

        // test invalid parameters in update
        params.id = productInventory.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/productInventory/edit"
        assert model.productInventoryInstance != null

        productInventory.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/productInventory/show/$productInventory.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        productInventory.clearErrors()

        populateValidParams(params)
        params.id = productInventory.id
        params.version = -1
        controller.update()

        assert view == "/productInventory/edit"
        assert model.productInventoryInstance != null
        assert model.productInventoryInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/productInventory/list'

        response.reset()

        populateValidParams(params)
        def productInventory = new ProductInventory(params)

        assert productInventory.save() != null
        assert ProductInventory.count() == 1

        params.id = productInventory.id

        controller.delete()

        assert ProductInventory.count() == 0
        assert ProductInventory.get(productInventory.id) == null
        assert response.redirectedUrl == '/productInventory/list'
    }
}
