package com.esms.model.maintenance



import org.junit.*
import grails.test.mixin.*

/**
 * WorkDoneCertificateControllerTests
 * A unit test class is used to test individual methods or blocks of code without considering the surrounding infrastructure
 */
@TestFor(WorkDoneCertificateController)
@Mock(WorkDoneCertificate)
class WorkDoneCertificateControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/workDoneCertificate/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.workDoneCertificateInstanceList.size() == 0
        assert model.workDoneCertificateInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.workDoneCertificateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.workDoneCertificateInstance != null
        assert view == '/workDoneCertificate/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/workDoneCertificate/show/1'
        assert controller.flash.message != null
        assert WorkDoneCertificate.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/workDoneCertificate/list'


        populateValidParams(params)
        def workDoneCertificate = new WorkDoneCertificate(params)

        assert workDoneCertificate.save() != null

        params.id = workDoneCertificate.id

        def model = controller.show()

        assert model.workDoneCertificateInstance == workDoneCertificate
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/workDoneCertificate/list'


        populateValidParams(params)
        def workDoneCertificate = new WorkDoneCertificate(params)

        assert workDoneCertificate.save() != null

        params.id = workDoneCertificate.id

        def model = controller.edit()

        assert model.workDoneCertificateInstance == workDoneCertificate
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/workDoneCertificate/list'

        response.reset()


        populateValidParams(params)
        def workDoneCertificate = new WorkDoneCertificate(params)

        assert workDoneCertificate.save() != null

        // test invalid parameters in update
        params.id = workDoneCertificate.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/workDoneCertificate/edit"
        assert model.workDoneCertificateInstance != null

        workDoneCertificate.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/workDoneCertificate/show/$workDoneCertificate.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        workDoneCertificate.clearErrors()

        populateValidParams(params)
        params.id = workDoneCertificate.id
        params.version = -1
        controller.update()

        assert view == "/workDoneCertificate/edit"
        assert model.workDoneCertificateInstance != null
        assert model.workDoneCertificateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/workDoneCertificate/list'

        response.reset()

        populateValidParams(params)
        def workDoneCertificate = new WorkDoneCertificate(params)

        assert workDoneCertificate.save() != null
        assert WorkDoneCertificate.count() == 1

        params.id = workDoneCertificate.id

        controller.delete()

        assert WorkDoneCertificate.count() == 0
        assert WorkDoneCertificate.get(workDoneCertificate.id) == null
        assert response.redirectedUrl == '/workDoneCertificate/list'
    }
}
