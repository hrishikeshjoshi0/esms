<%@ page import="com.esms.model.calendar.Event"%>
<%@ page import="com.esms.model.calendar.EventRecurType"%>
<%@ page import="org.joda.time.Instant"%>
<%@page import="com.esms.model.party.Organization"%>

<script>
	$(document).ready(function(){
		$('.callFields').hide();
		$('.meetingFields').hide();
		$('.maintenanceVisitFields').hide();
		$('.breakdownVisitFields').hide();

		var val = $('#eventType').val();
		onEventTypeChange(val);		
	});
	function onEventTypeChange(val) {
		//['CALL','MEETING','MAINTENANCE VISIT','BREAKDOWN CALL']
		if(val == 'CALL') {
			$('.callFields').show();
			$('.meetingFields').hide();
			$('.maintenanceVisitFields').hide();
			$('.breakdownVisitFields').hide();
		} else if(val == 'MEETING') {
			$('.callFields').hide();
			$('.meetingFields').show();
			$('.maintenanceVisitFields').hide();
			$('.breakdownVisitFields').hide();
		} else if(val == 'MAINTENANCE VISIT') {
			$('.callFields').hide();
			$('.meetingFields').hide();
			$('.maintenanceVisitFields').show();
			$('.breakdownVisitFields').hide();
		} else if(val == 'BREAKDOWN CALL') {
			$('.callFields').show();
			$('.meetingFields').hide();
			$('.maintenanceVisitFields').hide();
			$('.breakdownVisitFields').show();
		}
	}
</script>

<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'party', 'error')}">
	
	<label for="organization" class="col-md-2 control-label"><g:message
			code="quote.organization.label" default="Organization" /></label>
	<br/>		
	<g:select name="party.id" from="${Organization.list()}"
			optionKey="id" optionValue="name" class="input-xxlarge"
			value="${eventInstance?.party?.id}" />
</div>

<hr/>

<div class="row">
	<div class="col-md-12">
			<div class="maintenanceVisitFields page-header">
				<h3>Maintenance Visit Information</h3>
			</div>
			
			<div class="meetingFields page-header">
				<h3>Meeting Notes</h3>
			</div>
			
			<div class="breakdownVisitFields page-header">
				<h3>Breakdown Visit Information</h3>
			</div>
	</div>
</div>
	
<div class="row">
	<div class="col-md-6">
		<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventType', 'error')}">
			<label for="eventType"><g:message code="event.eventType.label"
					default="Event Type" /></label>
			<g:select name="eventType" onchange="onEventTypeChange(this.value);"
				from="${eventInstance.constraints.eventType.inList}"
				value="${eventInstance?.eventType}"
				valueMessagePrefix="event.eventType" noSelection="['': '']" />
		</div>
		
		<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'assignedTo', 'error')}">
			<label for="assignedTo"><g:message code="event.assignedTo.label"
					default="Assigned To" /></label>
			<g:textField name="assignedTo" value="${eventInstance?.assignedTo}" />
		</div>
		
		<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'title', 'error')}">
			<label for="title"><g:message code="event.title.label"
					default="Title" /></label>
			<g:textField name="title" value="${eventInstance?.title}" style="width:400px;"/>
		</div>
		
		<!-- Maintenance Visit Fields -->
		<div
			class="maintenanceVisitFields fieldcontain ${hasErrors(bean: eventInstance, field: 'maintenanceVisitTechnician', 'error')}">
			<label for="maintenanceVisitTechnician"><g:message
					code="event.maintenanceVisitTechnician.label" default="Technician" /></label>
			<g:textField name="maintenanceVisitTechnician"
				value="${eventInstance?.maintenanceVisitTechnician}" />
		</div>

		<div
			class="maintenanceVisitFields fieldcontain ${hasErrors(bean: eventInstance, field: 'maintenanceVisitTechnicianNotes', 'error')}">
			<label for="maintenanceVisitTechnicianNotes"><g:message
					code="event.maintenanceVisitTechnicianNotes.label" default="Notes" /></label>
			<g:textArea name="maintenanceVisitTechnicianNotes"
				value="${eventInstance?.maintenanceVisitTechnicianNotes}" rows="10"
				cols="100" />
		</div>

		<div
			class="maintenanceVisitFields fieldcontain ${hasErrors(bean: eventInstance, field: 'maintenanceVisitSignedOffBy', 'error')}">
			<label for="maintenanceVisitSignedOffBy"><g:message
					code="event.maintenanceVisitSignedOffBy.label"
					default="Signed Off By" /></label>
			<g:textField name="maintenanceVisitSignedOffBy"
				value="${eventInstance?.maintenanceVisitSignedOffBy}" />
		</div>

		<div
			class="maintenanceVisitFields fieldcontain ${hasErrors(bean: eventInstance, field: 'maintenanceVisitIsRequiresRepair', 'error')}">

			<label for="maintenanceVisitIsRequiresRepair"><g:message
					code="event.maintenanceVisitIsRequiresRepair.label"
					default="Repeat" /></label>
			<g:checkBox name="maintenanceVisitIsRequiresRepair"
				value="${eventInstance.maintenanceVisitIsRequiresRepair}" />
		</div>
		<!-- Maintenance Visit Fields -->

		<!-- Meeting -->
		<div
			class="meetingFields fieldcontain ${hasErrors(bean: eventInstance, field: 'location', 'error')}">
			<label for="location"><g:message
					code="event.location.label"
					default="Location" /></label>
			<g:textField name="location"
				value="${eventInstance?.location}" />
		</div>
		
		<div
			class="meetingFields fieldcontain ${hasErrors(bean: eventInstance, field: 'meetingNotes', 'error')}">
			<label for="meetingNotes"><g:message
					code="event.meetingNotes.label" default="Notes" /></label>
			<g:textArea name="meetingNotes"
				value="${eventInstance?.meetingNotes}" rows="10" cols="100" />
		</div>
		<!-- Meeting -->

		<!-- Breakdown Visit Fields -->
		<div
			class="breakdownVisitFields fieldcontain ${hasErrors(bean: eventInstance, field: 'breakdownVisitTechnician', 'error')}">
			<label for="breakdownVisitTechnician"><g:message
					code="event.breakdownVisitTechnician.label" default="Technician" /></label>
			<g:textField name="breakdownVisitTechnician"
				value="${eventInstance?.breakdownVisitTechnician}" />
		</div>

		<div
			class="breakdownVisitFields fieldcontain ${hasErrors(bean: eventInstance, field: 'breakdownVisitTechnicianNotes', 'error')}">
			<label for="breakdownVisitTechnicianNotes"><g:message
					code="event.breakdownVisitTechnicianNotes.label" default="Notes/Parts Replaced." /></label>
			<g:textArea name="breakdownVisitTechnicianNotes"
				value="${eventInstance?.breakdownVisitTechnicianNotes}" rows="10"
				cols="100" />
		</div>

		<div
			class="breakdownVisitFields fieldcontain ${hasErrors(bean: eventInstance, field: 'breakdownVisitSignedOffBy', 'error')}">
			<label for="breakdownVisitSignedOffBy"><g:message
					code="event.breakdownVisitSignedOffBy.label"
					default="Signed Off By" /></label>
			<g:textField name="breakdownVisitSignedOffBy"
				value="${eventInstance?.breakdownVisitSignedOffBy}" />
		</div>
		<!-- Breakdown Visit Fields -->

		<%--<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'description', 'error')}">
			<label for="description"><g:message
					code="event.description.label" default="Description" /></label>
			<g:textArea name="description" value="${eventInstance?.description}"
				rows="10" cols="100" />
		</div>
		--%>
	</div>

	<div class="col-md-6">
		<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'status', 'error')}">
			<label for="status"><g:message code="event.status.label"
					default="Status" /></label>
			<g:select name="status"
				from="${eventInstance.constraints.status.inList}"
				value="${eventInstance?.status}" valueMessagePrefix="event.status"
				noSelection="['': '']" />
		</div>

		<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'priority', 'error')}">
			<label for="priority"><g:message code="event.priority.label"
					default="Priority" /></label>
			<g:select name="priority"
				from="${eventInstance.constraints.priority.inList}"
				value="${eventInstance?.priority}"
				valueMessagePrefix="event.priority" noSelection="['': '']" />
		</div>

		<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'relatedTo', 'error')}">
			<label for="relatedTo"><g:message
					code="event.relatedTo.label" default="Related To" /></label>
			
			<g:select name="relatedTo"
				from="${eventInstance.constraints.relatedTo.inList}"
				value="${eventInstance?.relatedTo}"
				valueMessagePrefix="event.relatedTo" noSelection="['': '']" />
				
			<g:textField name="relatedToValue" value="${eventInstance?.relatedToValue}" />
			<!-- Add a link here. Link the order or the organization from here. -->
		</div>

		<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'startTime', 'error')}">
			<label for="startTime"><g:message
					code="event.startTime.label" default="Start Time" /></label>
			<richui:dateChooser name="startTime"
				value="${eventInstance?.startTime}" time="true"
				hourClass="input-mini" minuteClass="input-mini" />
			<%--
				<g:datePicker name="startTime" value="${eventInstance?.startTime}" />
				
				<g:textField name="startTime"
				value="${formatDate(date: occurrenceStart ? new Instant(occurrenceStart).toDate() : eventInstance?.startTime, format: 'MM/dd/yyyy hh:mm a')}"
				class="datetime" />
			--%>
		</div>


		<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'endTime', 'error')}">
			<label for="endTime"><g:message code="event.endTime.label"
					default="End Time" /></label>
			<richui:dateChooser name="endTime" value="${eventInstance?.endTime}" 
				time="true" hourClass="input-mini" minuteClass="input-mini" />		
			<%--
			<g:datePicker name="endTime" value="${eventInstance?.endTime}" />
			<g:textField name="endTime"
				value="${formatDate(date: occurrenceEnd ? new Instant(occurrenceEnd).toDate() : eventInstance?.endTime, format: 'MM/dd/yyyy hh:mm a')}"
				class="datetime" />
			--%>
		</div>

		<%--<div
			class="fieldcontain ${hasErrors(bean: eventInstance, field: 'isRecurring', 'error')}">
		
			<label for="isRecurring"><g:message
					code="event.isRecurring.label" default="Repeat" /></label>
			<g:checkBox name="isRecurring" value="${eventInstance.isRecurring}" />
			<span id="recurDescription"></span> <a id="editRecurringLink"
				${eventInstance.isRecurring ?  "" : 'style="display:none"'} href="#">Edit</a>
		</div>
		<div id="recurPopup"></div>
		--%>

		<%--<div id="recurOptions" style="display: none">
			<div>
				<label>Repeats:</label>
				<g:select name="recurType" from="${EventRecurType.values()}"
					optionValue="name" value="${eventInstance?.recurType}" />
			</div>
		
			<div>
				<label>Repeat every:</label>
				<g:select name="recurInterval" from="${1..30}"
					value="${eventInstance?.recurInterval}" />
				<span id="repeatLabel"></span>
			</div>
		
			<div id="weeklyOptions"
				${eventInstance.recurType != EventRecurType.WEEKLY ? 'style="display:none"' : ''}>
				<label>Repeat on: </label>
				<div class="options">
					<calendar:daysOfWeek name="recurDaysOfWeek"
						selectedDays="${eventInstance?.recurDaysOfWeek}" />
				</div>
			</div>
		
			<div>
				<label>Ends:</label>
				<div class="input">
					<input id="recurEndOption1" name="recurEndOption" type="radio"
						group="recurEndOption"
						${(!eventInstance.recurCount && !eventInstance.recurUntil) ? 'checked="checked"' : ''}
						value="never" /> <label for="recurEndOption1">Never</label><br />
		
					<input id="recurEndOption2" name="recurEndOption" type="radio"
						group="recurEndOption"
						${(eventInstance.recurCount) ? 'checked="checked"' : ''}
						value="occurrences" /> <label for="recurEndOption2">After <g:textField
							name="recurCount" size="3" value="${eventInstance?.recurCount}" />
						occurrences
					</label><br /> <input id="recurEndOption3" name="recurEndOption"
						type="radio" group="recurEndOption"
						${(!eventInstance.recurCount && eventInstance.recurUntil) ? 'checked="checked"' : ''}
						value="endDate" /> <label for="recurEndOption3">On <g:textField
							name="recurUntil" size="8"
							value="${formatDate(date: (eventInstance?.recurCount ? null : eventInstance?.recurUntil), format: 'MM/dd/yyyy hh:mm a')}" /></label>
				</div>
			</div>
		
			<div>
				<strong><span id="recurSummary"></span></strong>
			</div>
			
		</div>
		--%>
	</div>
</div>
