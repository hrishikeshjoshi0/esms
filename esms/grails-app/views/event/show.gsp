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
					EVENT 
					|
					${eventInstance?.title}
					|
					<g:link controller="organization" action="show"
						id="${eventInstance?.party?.id}">
						${eventInstance?.party?.name}
					</g:link>
					|
					<g:formatDate date="${eventInstance?.startTime}" format="dd.MM.yyyy HH:mm:ss" />
						-
					<g:formatDate date="${eventInstance?.endTime}" format="dd.MM.yyyy HH:mm:ss" />
					|
					${eventInstance?.eventType}
					|
					${eventInstance?.status}
					|
					ASSIGNED TO : 
					${eventInstance?.assignedTo}
					|
					PRIORITY : 
					${eventInstance?.priority}
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
					<g:if test="${eventInstance?.eventType != 'REPAIR WORK' && eventInstance?.workDoneCertificate == null}">
						<g:link class="btn" action="attachWorkDoneCertificate"
							id="${eventInstance?.id}">
							<i class="icon-pencil"></i>
							Attach Work Done Certificate
						</g:link>
					</g:if>
					<g:elseif test="${eventInstance?.eventType != 'REPAIR WORK'}">
						<g:link class="btn" action="editWorkDoneCertificate"
							id="${eventInstance?.workDoneCertificate?.id}">
							<i class="icon-pencil"></i>
							Edit Work Done Certificate
						</g:link>
					</g:elseif>
					<a href="#" data-toggle="modal" data-target="#activityModal"
						role="button" class="btn"> <i class="icon-plus"></i> Add Event
						Log
					</a>
				</div>
			</g:form>

			<div class="row-fluid">
				<div class="span6">
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
							<g:formatDate date="${eventInstance?.startTime}" type="datetime" />
						</dd>
		
						<dt>
							<g:message code="event.endTime.label" default="End Time" />
						</dt>
		
						<dd>
							<g:formatDate date="${eventInstance?.endTime}" type="datetime" />
						</dd>
		
						<%--<g:if test="${eventInstance?.isRecurring}">
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
						--%>
						<dt>
							<g:message code="event.description.label" default="Description" />
						</dt>
		
						<dd>
							<g:fieldValue bean="${eventInstance}" field="description" />
						</dd>
					</dl>
				</div>
				
				<div class="span6">
					<dl class="dl-horizontal">
						<g:if test="${eventInstance?.eventType == 'MAINTENANCE VISIT' }">
							<dt>
								<g:message code="event.eventType.label" default="Type" />
							</dt>
							
							<dd>
								<g:fieldValue bean="${eventInstance}" field="eventType" />
							</dd>
							
							<dt>
								<g:message code="event.maintenanceVisitTechnician.label" default="Technician" />
							</dt>
							
							<dd>
								<g:fieldValue bean="${eventInstance}" field="maintenanceVisitTechnician" />
							</dd>
							
							<dt>
								<g:message code="event.maintenanceVisitTechnicianNotes.label" default="Notes" />
							</dt>
							
							<dd>
								<g:fieldValue bean="${eventInstance}" field="maintenanceVisitTechnicianNotes" />
							</dd>
						</g:if>
						
						<g:if test="${eventInstance?.eventType == 'BREAKDOWN CALL' }">
							<dt>
								<g:message code="event.eventType.label" default="Type" />
							</dt>
							
							<dd>
								<g:fieldValue bean="${eventInstance}" field="eventType" />
							</dd>
							
							<dt>
								<g:message code="event.breakdownVisitTechnician.label" default="Technician" />
							</dt>
							
							<dd>
								<g:fieldValue bean="${eventInstance}" field="breakdownVisitTechnician" />
							</dd>
							
							<dt>
								<g:message code="event.breakdownVisitTechnicianNotes.label" default="Notes" />
							</dt>
							
							<dd>
								<g:fieldValue bean="${eventInstance}" field="breakdownVisitTechnicianNotes" />
							</dd>
							
							<dt>
								<g:message code="event.breakdownVisitSignedOffBy.label" default="Signed Off By" />
							</dt>
							
							<dd>
								<g:fieldValue bean="${eventInstance}" field="breakdownVisitSignedOffBy" />
							</dd>
						</g:if>
						
						<g:if test="${eventInstance?.eventType == 'MEETING' }">
							<dt>
								<g:message code="event.meetingNotes.label" default="Type" />
							</dt>
							
							<dd>
								<g:fieldValue bean="${eventInstance}" field="meetingNotes" />
							</dd>
						</g:if>
					</dl>	
				</div>
			</div>	
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Activity Log" />
					<g:if test="${eventInstance?.eventType != 'REPAIR WORK'}">
						<richui:tabLabel title="Work Done Certificate" />
					</g:if>	
				</richui:tabLabels>
	
				<richui:tabContents>
					<richui:tabContent>
						<g:each in="${eventInstance.eventLogs}" var="log">
							<dl>
								<dt>Logged Date</dt>
								<dd>
									<g:formatDate date="${log?.loggedDate}" />
								</dd>
	
								<dt>Work Done By</dt>
								<dd>
									${log?.workDoneBy}
								</dd>
	
								<dt>Reviewed By</dt>
								<dd>
									${log?.reviewedBy}
								</dd>
	
								<g:if test="${eventInstance?.eventType == 'BREAKDOWN CALL'}">
									<dt>Was Problem Repeated ?</dt>
									<dd>
										<g:formatBoolean boolean="${log?.isProblemReported}" true="Yes"
											false="No" />
									</dd>
									<dt>Problem Description</dt>
									<dd>
										${log?.comments}
									</dd>
								</g:if>
								<g:elseif test="${eventInstance?.eventType == 'MAINTENANCE VISIT'}">
									<dt>To Be Replaced</dt>
									<dd>
										<g:formatBoolean boolean="${log?.toBeReplaced}" true="Yes"
											false="No" />
									</dd>
									<dt>To Be Replaced Parts</dt>
									<dd>
										${log?.comments}
									</dd>
								</g:elseif>
								
								<dt>Urgency</dt>
								<dd>
									${log?.urgency}
								</dd>
							</dl>
						</g:each>
					</richui:tabContent>
	
					<g:if test="${eventInstance?.eventType != 'REPAIR WORK'}">
						<richui:tabContent>
							<div class="row-fluid">
								<div class="span6">
									<dl class="dl-horizontal">
		
										<dt>
											<g:message code="workDoneCertificate.date.label"
												default="Work Done Date" />
										</dt>
		
										<dd>
											<g:formatDate
												date="${eventInstance?.workDoneCertificate?.date}" />
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
											<g:message
												code="workDoneCertificate.callBackCodeAttended.label"
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
											<g:formatDate
												date="${eventInstance?.workDoneCertificate?.arrivalTime}" />
										</dd>
		
		
										<dt>
											<g:message code="workDoneCertificate.repairs.label"
												default="Repairs" />
										</dt>
		
										<dd>
											<g:formatBoolean
												boolean="${eventInstance?.workDoneCertificate?.repairs}" />
										</dd>
		
		
										<dt>
											<g:message
												code="workDoneCertificate.repairsWorkCompleted.label"
												default="Repairs Work Completed" />
										</dt>
		
										<dd>
											<g:formatDate
												date="${eventInstance?.workDoneCertificate?.repairsWorkCompleted}" />
										</dd>
		
		
										<dt>
											<g:message
												code="workDoneCertificate.ind_T_S_OrderExecution.label"
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
						</richui:tabContent>
					</g:if>
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>

	<div id="activityModal" class="modal hide fade" tabindex="-1"
		role="dialog"
		data-remote="<g:createLink controller="event" action="createEventLog" id="${eventInstance?.id}" />"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">New Event Log</h3>
		</div>
		<g:form controller="event" action="createEventLog" method="POST">
			<g:hiddenField name="event.id" value="${eventInstance?.id}" />
			<div class="modal-body"></div>
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