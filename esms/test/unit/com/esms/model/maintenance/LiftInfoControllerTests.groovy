package com.esms.model.maintenance



import org.junit.*
import grails.test.mixin.*

/**
 * LiftInfoControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(LiftInfoController)
@Mock(LiftInfo)
class LiftInfoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/liftInfo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.liftInfoInstanceList.size() == 0
        assert model.liftInfoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.liftInfoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.liftInfoInstance != null
        assert view == '/liftInfo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/liftInfo/show/1'
        assert controller.flash.message != null
        assert LiftInfo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/liftInfo/list'


        populateValidParams(params)
        def liftInfo = new LiftInfo(params)

        assert liftInfo.save() != null

        params.id = liftInfo.id

        def model = controller.show()

        assert model.liftInfoInstance == liftInfo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/liftInfo/list'


        populateValidParams(params)
        def liftInfo = new LiftInfo(params)

        assert liftInfo.save() != null

        params.id = liftInfo.id

        def model = controller.edit()

        assert model.liftInfoInstance == liftInfo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/liftInfo/list'

        response.reset()


        populateValidParams(params)
        def liftInfo = new LiftInfo(params)

        assert liftInfo.save() != null

        // test invalid parameters in update
        params.id = liftInfo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/liftInfo/edit"
        assert model.liftInfoInstance != null

        liftInfo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/liftInfo/show/$liftInfo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        liftInfo.clearErrors()

        populateValidParams(params)
        params.id = liftInfo.id
        params.version = -1
        controller.update()

        assert view == "/liftInfo/edit"
        assert model.liftInfoInstance != null
        assert model.liftInfoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/liftInfo/list'

        response.reset()

        populateValidParams(params)
        def liftInfo = new LiftInfo(params)

        assert liftInfo.save() != null
        assert LiftInfo.count() == 1

        params.id = liftInfo.id

        controller.delete()

        assert LiftInfo.count() == 0
        assert LiftInfo.get(liftInfo.id) == null
        assert response.redirectedUrl == '/liftInfo/list'
    }
}
