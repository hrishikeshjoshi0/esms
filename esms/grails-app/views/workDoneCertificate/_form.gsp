<%@ page import="com.esms.model.maintenance.WorkDoneCertificate"%>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'date', 'error')} required">
			<label for="date" class="control-label"><g:message
					code="workDoneCertificate.date.label" default="Date" /><span
				class="required-indicator">*</span></label>
			<div class="controls">
				<g:datePicker name="date" precision="day" value="${workDoneCertificateInstance?.date}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'date', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'customerName', 'error')} required">
			<label for="customerName" class="control-label"><g:message
					code="workDoneCertificate.customerName.label"
					default="Customer Name" /><span class="required-indicator">*</span></label>
			<div class="controls">
				<g:textField name="customerName" required=""
					value="${workDoneCertificateInstance?.customerName}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'customerName', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'contract', 'error')} ">
			<label for="contract" class="control-label"><g:message
					code="workDoneCertificate.contract.label" default="Contract" /></label>
			<div class="controls">
				<g:textField name="contract"
					value="${workDoneCertificateInstance?.contract}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'contract', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'machineNumber', 'error')} ">
			<label for="machineNumber" class="control-label"><g:message
					code="workDoneCertificate.machineNumber.label"
					default="Machine Number" /></label>
			<div class="controls">
				<g:textField name="machineNumber"
					value="${workDoneCertificateInstance?.machineNumber}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'machineNumber', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'routeNumber', 'error')} ">
			<label for="routeNumber" class="control-label"><g:message
					code="workDoneCertificate.routeNumber.label" default="Route Number" /></label>
			<div class="controls">
				<g:textField name="routeNumber"
					value="${workDoneCertificateInstance?.routeNumber}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'routeNumber', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'location', 'error')} ">
			<label for="location" class="control-label"><g:message
					code="workDoneCertificate.location.label" default="Location" /></label>
			<div class="controls">
				<g:textField name="location"
					value="${workDoneCertificateInstance?.location}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'location', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'routineService', 'error')} ">
			<label for="routineService" class="control-label"><g:message
					code="workDoneCertificate.routineService.label"
					default="Routine Service" /></label>
			<div class="controls">
				<g:checkBox name="routineService"
					value="${workDoneCertificateInstance?.routineService}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'routineService', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'serviceCodeAttended', 'error')} ">
			<label for="serviceCodeAttended" class="control-label"><g:message
					code="workDoneCertificate.serviceCodeAttended.label"
					default="Service Code Attended" /></label>
			<div class="controls">
				<g:checkBox name="serviceCodeAttended"
					value="${workDoneCertificateInstance?.serviceCodeAttended}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'serviceCodeAttended', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'breakDownCall', 'error')} ">
			<label for="breakDownCall" class="control-label"><g:message
					code="workDoneCertificate.breakDownCall.label"
					default="Break Down Call" /></label>
			<div class="controls">
				<g:checkBox name="breakDownCall"
					value="${workDoneCertificateInstance?.breakDownCall}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'breakDownCall', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'callBackCodeAttended', 'error')} ">
			<label for="callBackCodeAttended" class="control-label"><g:message
					code="workDoneCertificate.callBackCodeAttended.label"
					default="Call Back Code Attended" /></label>
			<div class="controls">
				<g:checkBox name="callBackCodeAttended"
					value="${workDoneCertificateInstance?.callBackCodeAttended}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'callBackCodeAttended', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'arrivalTime', 'error')} ">
			<label for="arrivalTime" class="control-label"><g:message
					code="workDoneCertificate.arrivalTime.label" default="Arrival Time" /></label>
			<div class="controls">
				<g:datePicker precision="minute" name="arrivalTime"
					value="${workDoneCertificateInstance?.arrivalTime}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'arrivalTime', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'repairs', 'error')} ">
			<label for="repairs" class="control-label"><g:message
					code="workDoneCertificate.repairs.label" default="Repairs" /></label>
			<div class="controls">
				<g:checkBox name="repairs"
					value="${workDoneCertificateInstance?.repairs}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'repairs', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'repairsWorkCompleted', 'error')} ">
			<label for="repairsWorkCompleted" class="control-label"><g:message
					code="workDoneCertificate.repairsWorkCompleted.label"
					default="Repairs Work Completed" /></label>
			<div class="controls">
				<g:datePicker precision="day" name="repairsWorkCompleted"
					value="${workDoneCertificateInstance?.repairsWorkCompleted}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'repairsWorkCompleted', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'ind_T_S_OrderExecution', 'error')} ">
			<label for="ind_T_S_OrderExecution" class="control-label"><g:message
					code="workDoneCertificate.ind_T_S_OrderExecution.label"
					default="Ind TSO rder Execution" /></label>
			<div class="controls">
				<g:checkBox name="ind_T_S_OrderExecution"
					value="${workDoneCertificateInstance?.ind_T_S_OrderExecution}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'ind_T_S_OrderExecution', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'ind_T_S_OrderExecutionWorkStarted', 'error')} ">
			<label for="ind_T_S_OrderExecutionWorkStarted" class="control-label"><g:message
					code="workDoneCertificate.ind_T_S_OrderExecutionWorkStarted.label"
					default="Ind TSO rder Execution Work Started" /></label>
			<div class="controls">
				<g:datePicker precision="day" name="ind_T_S_OrderExecutionWorkStarted"
					value="${workDoneCertificateInstance?.ind_T_S_OrderExecutionWorkStarted}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'ind_T_S_OrderExecutionWorkStarted', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'ind_T_S_OrderExecutionWorkCompleted', 'error')} ">
			<label for="ind_T_S_OrderExecutionWorkCompleted"
				class="control-label"><g:message
					code="workDoneCertificate.ind_T_S_OrderExecutionWorkCompleted.label"
					default="Ind TSO rder Execution Work Completed" /></label>
			<div class="controls">
				<g:datePicker precision="day" name="ind_T_S_OrderExecutionWorkCompleted"
					value="${workDoneCertificateInstance?.ind_T_S_OrderExecutionWorkCompleted}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'ind_T_S_OrderExecutionWorkCompleted', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'buttonsAndSignals', 'error')} ">
			<label for="buttonsAndSignals" class="control-label"><g:message
					code="workDoneCertificate.buttonsAndSignals.label"
					default="Buttons And Signals" /></label>
			<div class="controls">
				<g:checkBox name="buttonsAndSignals"
					value="${workDoneCertificateInstance?.buttonsAndSignals}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'buttonsAndSignals', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'carEntrance', 'error')} ">
			<label for="carEntrance" class="control-label"><g:message
					code="workDoneCertificate.carEntrance.label" default="Car Entrance" /></label>
			<div class="controls">
				<g:checkBox name="carEntrance"
					value="${workDoneCertificateInstance?.carEntrance}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'carEntrance', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'carFanLight', 'error')} ">
			<label for="carFanLight" class="control-label"><g:message
					code="workDoneCertificate.carFanLight.label"
					default="Car Fan Light" /></label>
			<div class="controls">
				<g:checkBox name="carFanLight"
					value="${workDoneCertificateInstance?.carFanLight}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'carFanLight', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'carOperatingPanel', 'error')} ">
			<label for="carOperatingPanel" class="control-label"><g:message
					code="workDoneCertificate.carOperatingPanel.label"
					default="Car Operating Panel" /></label>
			<div class="controls">
				<g:checkBox name="carOperatingPanel"
					value="${workDoneCertificateInstance?.carOperatingPanel}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'carOperatingPanel', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'doorOperation', 'error')} ">
			<label for="doorOperation" class="control-label"><g:message
					code="workDoneCertificate.doorOperation.label"
					default="Door Operation" /></label>
			<div class="controls">
				<g:checkBox name="doorOperation"
					value="${workDoneCertificateInstance?.doorOperation}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'doorOperation', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'doorProtection', 'error')} ">
			<label for="doorProtection" class="control-label"><g:message
					code="workDoneCertificate.doorProtection.label"
					default="Door Protection" /></label>
			<div class="controls">
				<g:checkBox name="doorProtection"
					value="${workDoneCertificateInstance?.doorProtection}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'doorProtection', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'emergencyAlarm', 'error')} ">
			<label for="emergencyAlarm" class="control-label"><g:message
					code="workDoneCertificate.emergencyAlarm.label"
					default="Emergency Alarm" /></label>
			<div class="controls">
				<g:checkBox name="emergencyAlarm"
					value="${workDoneCertificateInstance?.emergencyAlarm}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'emergencyAlarm', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'entrance', 'error')} ">
			<label for="entrance" class="control-label"><g:message
					code="workDoneCertificate.entrance.label" default="Entrance" /></label>
			<div class="controls">
				<g:checkBox name="entrance"
					value="${workDoneCertificateInstance?.entrance}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'entrance', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'floorLevels', 'error')} ">
			<label for="floorLevels" class="control-label"><g:message
					code="workDoneCertificate.floorLevels.label" default="Floor Levels" /></label>
			<div class="controls">
				<g:checkBox name="floorLevels"
					value="${workDoneCertificateInstance?.floorLevels}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'floorLevels', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'machineRoom', 'error')} ">
			<label for="machineRoom" class="control-label"><g:message
					code="workDoneCertificate.machineRoom.label" default="Machine Room" /></label>
			<div class="controls">
				<g:checkBox name="machineRoom"
					value="${workDoneCertificateInstance?.machineRoom}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'machineRoom', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'rideQuality', 'error')} ">
			<label for="rideQuality" class="control-label"><g:message
					code="workDoneCertificate.rideQuality.label" default="Ride Quality" /></label>
			<div class="controls">
				<g:checkBox name="rideQuality"
					value="${workDoneCertificateInstance?.rideQuality}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'rideQuality', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<hr />

<div class="row-fluid">
	<div class="span12">
		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'majorRepairs_Adjustment_ExtraExamination', 'error')} ">
			<label for="majorRepairs_Adjustment_ExtraExamination"
				class="control-label"><g:message
					code="workDoneCertificate.majorRepairs_Adjustment_ExtraExamination.label"
					default="Major Repairs Adjustment Extra Examination" /></label>
			<div class="controls">
				<g:textArea rows="10" cols="5" name="majorRepairs_Adjustment_ExtraExamination"
					value="${workDoneCertificateInstance?.majorRepairs_Adjustment_ExtraExamination}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'majorRepairs_Adjustment_ExtraExamination', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'examinerName', 'error')} ">
			<label for="examinerName" class="control-label"><g:message
					code="workDoneCertificate.examinerName.label"
					default="Examiner Name" /></label>
			<div class="controls">
				<g:textField name="examinerName"
					value="${workDoneCertificateInstance?.examinerName}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'examinerName', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'customerSignedOffBy', 'error')} ">
			<label for="customerSignedOffBy" class="control-label"><g:message
					code="workDoneCertificate.customerSignedOffBy.label"
					default="Customer Signed Off By" /></label>
			<div class="controls">
				<g:textField name="customerSignedOffBy"
					value="${workDoneCertificateInstance?.customerSignedOffBy}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'customerSignedOffBy', 'error')}
				</span>
			</div>
		</div>

		<div
			class="control-group fieldcontain ${hasErrors(bean: workDoneCertificateInstance, field: 'customerRemark', 'error')} ">
			<label for="customerRemark" class="control-label"><g:message
					code="workDoneCertificate.customerRemark.label"
					default="Customer Remark" /></label>
			<div class="controls">
				<g:textField name="customerRemark"
					value="${workDoneCertificateInstance?.customerRemark}" />
				<span class="help-inline"> ${hasErrors(bean: workDoneCertificateInstance, field: 'customerRemark', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>