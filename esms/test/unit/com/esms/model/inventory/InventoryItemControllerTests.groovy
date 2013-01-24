package com.esms.model.inventory



import org.junit.*
import grails.test.mixin.*

/**
 * InventoryItemControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(InventoryItemController)
@Mock(InventoryItem)
class InventoryItemControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/inventoryItem/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.inventoryItemInstanceList.size() == 0
        assert model.inventoryItemInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.inventoryItemInstance != null
    }

    void testSave() {
        controller.save()

        assert model.inventoryItemInstance != null
        assert view == '/inventoryItem/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/inventoryItem/show/1'
        assert controller.flash.message != null
        assert InventoryItem.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/inventoryItem/list'


        populateValidParams(params)
        def inventoryItem = new InventoryItem(params)

        assert inventoryItem.save() != null

        params.id = inventoryItem.id

        def model = controller.show()

        assert model.inventoryItemInstance == inventoryItem
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/inventoryItem/list'


        populateValidParams(params)
        def inventoryItem = new InventoryItem(params)

        assert inventoryItem.save() != null

        params.id = inventoryItem.id

        def model = controller.edit()

        assert model.inventoryItemInstance == inventoryItem
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/inventoryItem/list'

        response.reset()


        populateValidParams(params)
        def inventoryItem = new InventoryItem(params)

        assert inventoryItem.save() != null

        // test invalid parameters in update
        params.id = inventoryItem.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/inventoryItem/edit"
        assert model.inventoryItemInstance != null

        inventoryItem.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/inventoryItem/show/$inventoryItem.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        inventoryItem.clearErrors()

        populateValidParams(params)
        params.id = inventoryItem.id
        params.version = -1
        controller.update()

        assert view == "/inventoryItem/edit"
        assert model.inventoryItemInstance != null
        assert model.inventoryItemInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/inventoryItem/list'

        response.reset()

        populateValidParams(params)
        def inventoryItem = new InventoryItem(params)

        assert inventoryItem.save() != null
        assert InventoryItem.count() == 1

        params.id = inventoryItem.id

        controller.delete()

        assert InventoryItem.count() == 0
        assert InventoryItem.get(inventoryItem.id) == null
        assert response.redirectedUrl == '/inventoryItem/list'
    }
}
