package com.esms.model.order



import org.junit.*
import grails.test.mixin.*

/**
 * OrderInventoryAssignmentControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(OrderInventoryAssignmentController)
@Mock(InventoryJournal)
class OrderInventoryAssignmentControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/orderInventoryAssignment/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.orderInventoryAssignmentInstanceList.size() == 0
        assert model.orderInventoryAssignmentInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.orderInventoryAssignmentInstance != null
    }

    void testSave() {
        controller.save()

        assert model.orderInventoryAssignmentInstance != null
        assert view == '/orderInventoryAssignment/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/orderInventoryAssignment/show/1'
        assert controller.flash.message != null
        assert InventoryJournal.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/orderInventoryAssignment/list'


        populateValidParams(params)
        def orderInventoryAssignment = new InventoryJournal(params)

        assert orderInventoryAssignment.save() != null

        params.id = orderInventoryAssignment.id

        def model = controller.show()

        assert model.orderInventoryAssignmentInstance == orderInventoryAssignment
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/orderInventoryAssignment/list'


        populateValidParams(params)
        def orderInventoryAssignment = new InventoryJournal(params)

        assert orderInventoryAssignment.save() != null

        params.id = orderInventoryAssignment.id

        def model = controller.edit()

        assert model.orderInventoryAssignmentInstance == orderInventoryAssignment
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/orderInventoryAssignment/list'

        response.reset()


        populateValidParams(params)
        def orderInventoryAssignment = new InventoryJournal(params)

        assert orderInventoryAssignment.save() != null

        // test invalid parameters in update
        params.id = orderInventoryAssignment.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/orderInventoryAssignment/edit"
        assert model.orderInventoryAssignmentInstance != null

        orderInventoryAssignment.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/orderInventoryAssignment/show/$orderInventoryAssignment.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        orderInventoryAssignment.clearErrors()

        populateValidParams(params)
        params.id = orderInventoryAssignment.id
        params.version = -1
        controller.update()

        assert view == "/orderInventoryAssignment/edit"
        assert model.orderInventoryAssignmentInstance != null
        assert model.orderInventoryAssignmentInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/orderInventoryAssignment/list'

        response.reset()

        populateValidParams(params)
        def orderInventoryAssignment = new InventoryJournal(params)

        assert orderInventoryAssignment.save() != null
        assert InventoryJournal.count() == 1

        params.id = orderInventoryAssignment.id

        controller.delete()

        assert InventoryJournal.count() == 0
        assert InventoryJournal.get(orderInventoryAssignment.id) == null
        assert response.redirectedUrl == '/orderInventoryAssignment/list'
    }
}
