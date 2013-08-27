<%@ page import="com.esms.model.calendar.Event"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />
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
				<g:hiddenField name="id" value="${eventInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${eventInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
					<g:if test="${eventInstance?.workDoneCertificate == null}">
						<g:link class="btn" action="attachWorkDoneCertificate" id="${eventInstance?.id}">
							<i class="icon-pencil"></i>
							Attach Work Done Certificate
						</g:link>
					</g:if>
					<g:else>
						<g:link class="btn" action="editWorkDoneCertificate" id="${eventInstance?.workDoneCertificate?.id}">
							<i class="icon-pencil"></i>
							Edit Work Done Certificate
						</g:link>
					</g:else>
					<a href="#" data-toggle="modal"
						data-target="#activityModal" role="button" class="btn"> <i class="icon-plus"></i> Add Event Log
					</a>
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="event.title.label" default="Title" />
				</dt>

				<dd>
					<g:fieldValue bean="${eventInstance}" field="title" />
				</dd>


				<dt>
					<g:message code="event.location.label" default="Location" />
				</dt>

				<dd>
					<g:fieldValue bean="${eventInstance}" field="location" />
				</dd>


				<dt>
					<g:message code="event.startTime.label" default="Start Time" />
				</dt>

				<dd>
					<g:formatDate date="${eventInstance?.startTime}" type="datetime"/>
				</dd>
				
				<dt>
					<g:message code="event.endTime.label" default="End Time" />
				</dt>

				<dd>
					<g:formatDate date="${eventInstance?.endTime}" type="datetime" />
				</dd>

				<g:if test="${eventInstance?.isRecurring}">
					<dt>
						<g:message code="event.isRecurring.label" default="Is Recurring" />
					</dt>

					<dd>
						<g:formatBoolean boolean="${eventInstance?.isRecurring}" />
					</dd>

					<dt>
						<g:message code="event.recurType.label" default="Recur Type" />
					</dt>

					<dd>
						<g:fieldValue bean="${eventInstance}" field="recurType" />
					</dd>


					<dt>
						<g:message code="event.recurInterval.label"
							default="Recur Interval" />
					</dt>

					<dd>
						<g:fieldValue bean="${eventInstance}" field="recurInterval" />
					</dd>


					<dt>
						<g:message code="event.recurUntil.label" default="Recur Until" />
					</dt>

					<dd>
						<g:formatDate date="${eventInstance?.recurUntil}" />
					</dd>


					<dt>
						<g:message code="event.recurCount.label" default="Recur Count" />
					</dt>

					<dd>
						<g:fieldValue bean="${eventInstance}" field="recurCount" />
					</dd>


					<dt>
						<g:message code="event.excludeDays.label" default="Exclude Days" />
					</dt>

					<dd>
						<g:fieldValue bean="${eventInstance}" field="excludeDays" />
					</dd>

					<dt>
						<g:message code="event.recurDaysOfWeek.label"
							default="Recur Days Of Week" />
					</dt>

					<dd>
						<g:fieldValue bean="${eventInstance}" field="recurDaysOfWeek" />
					</dd>
				</g:if>

				<dt>
					<g:message code="event.sourceEvent.label" default="Source Event" />
				</dt>

				<dd>
					<g:link controller="event" action="show"
						id="${eventInstance?.sourceEvent?.id}">
						${eventInstance?.sourceEvent?.title}
					</g:link>
				</dd>

				<dt>
					<g:message code="event.description.label" default="Description" />
				</dt>

				<dd>
					<g:fieldValue bean="${eventInstance}" field="description" />
				</dd>
			</dl>

		</div>
	</div>
	
	<div class="span12">
			<!--  -->
			<ul class="nav nav-tabs" id="organization_show_tab">
			  <li class="active"><a href="#activityLogTabPane" data-toggle="tab">Activity Log</a></li>
			  <li><a href="#workDoneCertificateTabPane" data-toggle="tab">Work Done Certificate</a></li>
			</ul>
			 
			<div class="tab-content">
			  <div class="tab-pane active" id="activityLogTabPane">
			  	 <g:each in="${eventInstance.eventLogs}" var="log">
			  	 	<dl>
				  	 	<dt>
							Logged Date
						</dt>
						<dd>
							<g:formatDate date="${log?.loggedDate}" />
						</dd>
						
						<dt>
							Work Done By
						</dt>
						<dd>
							${log?.workDoneBy}
						</dd>
						
						<dt>
							Reviewed By
						</dt>
						<dd>
							${log?.reviewedBy}
						</dd>
						
						<dt>
							Was Problem Reported ?
						</dt>
						<dd>
							<g:formatBoolean boolean="${log?.isProblemReported}" true="Yes" false="No"/>
						</dd>
						
						<dt>
							Urgency
						</dt>
						<dd>
							${log?.urgency}
						</dd>
					</dl>
			  	 </g:each>
			  </div>
			  <div class="tab-pane" id="workDoneCertificateTabPane">
			  	<div class="row-fluid">
					<div class="span6">
						<dl class="dl-horizontal">

					<dt>
						<g:message code="workDoneCertificate.date.label"
							default="Work Done Date" />
					</dt>

					<dd>
						<g:formatDate date="${eventInstance?.workDoneCertificate?.date}" />
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
							boolean="${eventInstance?.workDoneCertificate?.routineService}" />
					</dd>


					<dt>
						<g:message code="workDoneCertificate.serviceCodeAttended.label"
							default="Service Code Attended" />
					</dt>

					<dd>
						<g:formatBoolean
							boolean="${eventInstance?.workDoneCertificate?.serviceCodeAttended}" />
					</dd>


					<dt>
						<g:message code="workDoneCertificate.breakDownCall.label"
							default="Break Down Call" />
					</dt>

					<dd>
						<g:formatBoolean
							boolean="${eventInstance?.workDoneCertificate?.breakDownCall}" />
					</dd>


					<dt>
						<g:message code="workDoneCertificate.callBackCodeAttended.label"
							default="Call Back Code Attended" />
					</dt>

					<dd>
						<g:formatBoolean
							boolean="${eventInstance?.workDoneCertificate?.callBackCodeAttended}" />
					</dd>


					<dt>
						<g:message code="workDoneCertificate.arrivalTime.label"
							default="Arrival Time" />
					</dt>

					<dd>
						<g:formatDate date="${eventInstance?.workDoneCertificate?.arrivalTime}" />
					</dd>


					<dt>
						<g:message code="workDoneCertificate.repairs.label"
							default="Repairs" />
					</dt>

					<dd>
						<g:formatBoolean boolean="${eventInstance?.workDoneCertificate?.repairs}" />
					</dd>


					<dt>
						<g:message code="workDoneCertificate.repairsWorkCompleted.label"
							default="Repairs Work Completed" />
					</dt>

					<dd>
						<g:formatDate
							date="${eventInstance?.workDoneCertificate?.repairsWorkCompleted}" />
					</dd>


					<dt>
						<g:message code="workDoneCertificate.ind_T_S_OrderExecution.label"
							default="Ind TSO rder Execution" />
					</dt>

					<dd>
						<g:formatBoolean
							boolean="${eventInstance?.workDoneCertificate?.ind_T_S_OrderExecution}" />
					</dd>


					<dt>
						<g:message
							code="workDoneCertificate.ind_T_S_OrderExecutionWorkStarted.label"
							default="Ind TSO rder Execution Work Started" />
					</dt>

					<dd>
						<g:formatDate
							date="${eventInstance?.workDoneCertificate?.ind_T_S_OrderExecutionWorkStarted}" />
					</dd>


					<dt>
						<g:message
							code="workDoneCertificate.ind_T_S_OrderExecutionWorkCompleted.label"
							default="Ind TSO rder Execution Work Completed" />
					</dt>

					<dd>
						<g:formatDate
							date="${eventInstance?.workDoneCertificate?.ind_T_S_OrderExecutionWorkCompleted}" />
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
				</dl>
					</div>

					<div class="span6">
						<dl class="dl-horizontal">
							<dt>
								<g:message code="workDoneCertificate.buttonsAndSignals.label"
									default="Buttons And Signals" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.buttonsAndSignals}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.carEntrance.label"
									default="Car Entrance" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.carEntrance}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.carFanLight.label"
									default="Car Fan Light" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.carFanLight}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.carOperatingPanel.label"
									default="Car Operating Panel" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.carOperatingPanel}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.doorOperation.label"
									default="Door Operation" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.doorOperation}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.doorProtection.label"
									default="Door Protection" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.doorProtection}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.emergencyAlarm.label"
									default="Emergency Alarm" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.emergencyAlarm}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.entrance.label"
									default="Entrance" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.entrance}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.floorLevels.label"
									default="Floor Levels" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.floorLevels}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.machineRoom.label"
									default="Machine Room" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.machineRoom}" />
							</dd>


							<dt>
								<g:message code="workDoneCertificate.rideQuality.label"
									default="Ride Quality" />
							</dt>

							<dd>
								<g:formatBoolean
									boolean="${eventInstance?.workDoneCertificate?.rideQuality}" />
							</dd>
						</dl>
					</div>
				</div>	
			</div>
			</div>
		</div>
	
		<div id="activityModal" class="modal hide fade" tabindex="-1" role="dialog" 
			data-remote="<g:createLink controller="event" action="createEventLog" id="${eventInstance?.id}" />"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">New Event Log</h3>
			</div>
			<g:form controller="event" action="createEventLog" method="POST">
				<g:hiddenField name="event.id" value="${eventInstance?.id}" />
				<div class="modal-body">
					
				</div>
				<div class="modal-footer">
					<div class="form-actions">
						<button type="submit" class="btn btn-primary">
							<i class="icon-ok icon-white"></i>
							<g:message code="default.button.create.label" default="Save" />
						</button>
					</div>
				</div>
			</g:form>
		</div>
</body>
</html>