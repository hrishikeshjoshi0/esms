package com.esms.model.calendar



import org.junit.*
import grails.test.mixin.*

/**
 * EventLogControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(EventLogController)
@Mock(EventLog)
class EventLogControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/eventLog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.eventLogInstanceList.size() == 0
        assert model.eventLogInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.eventLogInstance != null
    }

    void testSave() {
        controller.save()

        assert model.eventLogInstance != null
        assert view == '/eventLog/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/eventLog/show/1'
        assert controller.flash.message != null
        assert EventLog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/eventLog/list'


        populateValidParams(params)
        def eventLog = new EventLog(params)

        assert eventLog.save() != null

        params.id = eventLog.id

        def model = controller.show()

        assert model.eventLogInstance == eventLog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/eventLog/list'


        populateValidParams(params)
        def eventLog = new EventLog(params)

        assert eventLog.save() != null

        params.id = eventLog.id

        def model = controller.edit()

        assert model.eventLogInstance == eventLog
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/eventLog/list'

        response.reset()


        populateValidParams(params)
        def eventLog = new EventLog(params)

        assert eventLog.save() != null

        // test invalid parameters in update
        params.id = eventLog.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/eventLog/edit"
        assert model.eventLogInstance != null

        eventLog.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/eventLog/show/$eventLog.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        eventLog.clearErrors()

        populateValidParams(params)
        params.id = eventLog.id
        params.version = -1
        controller.update()

        assert view == "/eventLog/edit"
        assert model.eventLogInstance != null
        assert model.eventLogInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/eventLog/list'

        response.reset()

        populateValidParams(params)
        def eventLog = new EventLog(params)

        assert eventLog.save() != null
        assert EventLog.count() == 1

        params.id = eventLog.id

        controller.delete()

        assert EventLog.count() == 0
        assert EventLog.get(eventLog.id) == null
        assert response.redirectedUrl == '/eventLog/list'
    }
}
