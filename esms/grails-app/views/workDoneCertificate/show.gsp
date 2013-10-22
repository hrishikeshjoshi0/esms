

<%@ page import="com.esms.model.maintenance.WorkDoneCertificate"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${workDoneCertificateInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit"
						id="${workDoneCertificateInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="workDoneCertificate.workDoneDate.label"
						default="Work Done Date" />
				</dt>

				<dd>
					<g:formatDate date="${workDoneCertificateInstance?.workDoneDate}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.customerName.label"
						default="Customer Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${workDoneCertificateInstance}"
						field="customerName" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.contract.label"
						default="Contract" />
				</dt>

				<dd>
					<g:fieldValue bean="${workDoneCertificateInstance}"
						field="contract" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.machineNumber.label"
						default="Machine Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${workDoneCertificateInstance}"
						field="machineNumber" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.routeNumber.label"
						default="Route Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${workDoneCertificateInstance}"
						field="routeNumber" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.location.label"
						default="Location" />
				</dt>

				<dd>
					<g:fieldValue bean="${workDoneCertificateInstance}"
						field="location" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.routineService.label"
						default="Routine Service" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.routineService}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.serviceCodeAttended.label"
						default="Service Code Attended" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.serviceCodeAttended}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.breakDownCall.label"
						default="Break Down Call" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.breakDownCall}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.callBackCodeAttended.label"
						default="Call Back Code Attended" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.callBackCodeAttended}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.arrivalTime.label"
						default="Arrival Time" />
				</dt>

				<dd>
					<g:formatDate date="${workDoneCertificateInstance?.arrivalTime}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.repairs.label"
						default="Repairs" />
				</dt>

				<dd>
					<g:formatBoolean boolean="${workDoneCertificateInstance?.repairs}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.repairsWorkCompleted.label"
						default="Repairs Work Completed" />
				</dt>

				<dd>
					<g:formatDate
						date="${workDoneCertificateInstance?.repairsWorkCompleted}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.ind_T_S_OrderExecution.label"
						default="Ind TSO rder Execution" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.ind_T_S_OrderExecution}" />
				</dd>


				<dt>
					<g:message
						code="workDoneCertificate.ind_T_S_OrderExecutionWorkStarted.label"
						default="Ind TSO rder Execution Work Started" />
				</dt>

				<dd>
					<g:formatDate
						date="${workDoneCertificateInstance?.ind_T_S_OrderExecutionWorkStarted}" />
				</dd>


				<dt>
					<g:message
						code="workDoneCertificate.ind_T_S_OrderExecutionWorkCompleted.label"
						default="Ind TSO rder Execution Work Completed" />
				</dt>

				<dd>
					<g:formatDate
						date="${workDoneCertificateInstance?.ind_T_S_OrderExecutionWorkCompleted}" />
				</dd>


				<dt>
					<g:message
						code="workDoneCertificate.majorRepairs_Adjustment_ExtraExamination.label"
						default="Major Repairs Adjustment Extra Examination" />
				</dt>

				<dd>
					<g:fieldValue bean="${workDoneCertificateInstance}"
						field="majorRepairs_Adjustment_ExtraExamination" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.examinerName.label"
						default="Examiner Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${workDoneCertificateInstance}"
						field="examinerName" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.customerSignedOffBy.label"
						default="Customer Signed Off By" />
				</dt>

				<dd>
					<g:fieldValue bean="${workDoneCertificateInstance}"
						field="customerSignedOffBy" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.customerRemark.label"
						default="Customer Remark" />
				</dt>

				<dd>
					<g:fieldValue bean="${workDoneCertificateInstance}"
						field="customerRemark" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.buttonsAndSignals.label"
						default="Buttons And Signals" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.buttonsAndSignals}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.carEntrance.label"
						default="Car Entrance" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.carEntrance}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.carFanLight.label"
						default="Car Fan Light" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.carFanLight}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.carOperatingPanel.label"
						default="Car Operating Panel" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.carOperatingPanel}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.doorOperation.label"
						default="Door Operation" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.doorOperation}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.doorProtection.label"
						default="Door Protection" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.doorProtection}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.emergencyAlarm.label"
						default="Emergency Alarm" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.emergencyAlarm}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.entrance.label"
						default="Entrance" />
				</dt>

				<dd>
					<g:formatBoolean boolean="${workDoneCertificateInstance?.entrance}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.floorLevels.label"
						default="Floor Levels" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.floorLevels}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.machineRoom.label"
						default="Machine Room" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.machineRoom}" />
				</dd>


				<dt>
					<g:message code="workDoneCertificate.rideQuality.label"
						default="Ride Quality" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${workDoneCertificateInstance?.rideQuality}" />
				</dd>


			</dl>
		</div>
	</div>
</body>
</html>
