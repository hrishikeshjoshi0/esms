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

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'party', 'error')}">
			<label for="organization" class="col-md-3 control-label"><g:message
					code="quote.organization.label" default="Organization" /></label>
			<div class="col-md-9">
				<g:select name="party.id" from="${Organization.list()}"
						optionKey="id" optionValue="name" class="form-control"
						value="${eventInstance?.party?.id}" />
			</div>		
		</div>
	</div>
</div>	

<hr/>

<div class="row">
	<div class="col-md-6">
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
			class="form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'eventType', 'error')}">
			<label class="col-md-3 control-label" for="eventType"><g:message code="event.eventType.label"
					default="Event Type" /></label>
			<div class="col-md-9">
				<g:select name="eventType" onchange="onEventTypeChange(this.value);" class="form-control"
					from="${eventInstance.constraints.eventType.inList}"
					value="${eventInstance?.eventType}"
					valueMessagePrefix="event.eventType" noSelection="['': '']" />
			</div>		
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'assignedTo', 'error')}">
			<label class="col-md-3 control-label" for="assignedTo"><g:message code="event.assignedTo.label"
					default="Assigned To" /></label>
			<div class="col-md-9">
				<g:textField name="assignedTo" value="${eventInstance?.assignedTo}" class="form-control"/>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'title', 'error')}">
			<label class="col-md-3 control-label" for="title"><g:message code="event.title.label"
					default="Title" /></label>
			<div class="col-md-9">
				<g:textField name="title" value="${eventInstance?.title}" class="form-control"/>
			</div>		
		</div>
		
		<!-- Maintenance Visit Fields -->
		<div
			class="maintenanceVisitFields form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'maintenanceVisitTechnician', 'error')}">
			<label class="col-md-3 control-label" for="maintenanceVisitTechnician"><g:message
					code="event.maintenanceVisitTechnician.label" default="Technician" /></label>
			<div class="col-md-9">
				<g:textField name="maintenanceVisitTechnician" class="form-control"
					value="${eventInstance?.maintenanceVisitTechnician}" />
			</div>
		</div>

		<div
			class="maintenanceVisitFields form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'maintenanceVisitTechnicianNotes', 'error')}">
			<label class="col-md-3 control-label" for="maintenanceVisitTechnicianNotes"><g:message
					code="event.maintenanceVisitTechnicianNotes.label" default="Notes" /></label>
			<div class="col-md-9">
				<g:textArea name="maintenanceVisitTechnicianNotes" class="form-control"
					value="${eventInstance?.maintenanceVisitTechnicianNotes}" rows="10"
					cols="100" />
			</div>	
		</div>

		<div
			class="maintenanceVisitFields form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'maintenanceVisitSignedOffBy', 'error')}">
			<label class="col-md-3 control-label" for="maintenanceVisitSignedOffBy"><g:message
					code="event.maintenanceVisitSignedOffBy.label"
					default="Signed Off By" /></label>
			<div class="col-md-9">
				<g:textField name="maintenanceVisitSignedOffBy" class="form-control"
					value="${eventInstance?.maintenanceVisitSignedOffBy}" />
			</div>
		</div>

		<div
			class="maintenanceVisitFields form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'maintenanceVisitIsRequiresRepair', 'error')}">

			<label class="col-md-3 control-label" for="maintenanceVisitIsRequiresRepair"><g:message
					code="event.maintenanceVisitIsRequiresRepair.label"
					default="Repeat" /></label>
			<div class="col-md-9 checkbox"> 
				<g:checkBox name="maintenanceVisitIsRequiresRepair"
					value="${eventInstance.maintenanceVisitIsRequiresRepair}" />
			</div>
		</div>
		<!-- Maintenance Visit Fields -->

		<!-- Meeting -->
		<div
			class="meetingFields form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'location', 'error')}">
			<label class="col-md-3 control-label" for="location"><g:message
					code="event.location.label"
					default="Location" /></label>
			<div class="col-md-9">
				<g:textField name="location" class="form-control"
					value="${eventInstance?.location}" />
			</div>
		</div>
		
		<div
			class="meetingFields form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'meetingNotes', 'error')}">
			<label  class="col-md-3 control-label"for="meetingNotes"><g:message
					code="event.meetingNotes.label" default="Notes" /></label>
			<div class="col-md-9">
				<g:textArea name="meetingNotes" class="form-control"
					value="${eventInstance?.meetingNotes}" rows="10" cols="100" />
			</div>
		</div>
		<!-- Meeting -->

		<!-- Breakdown Visit Fields -->
		<div
			class="breakdownVisitFields form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'breakdownVisitTechnician', 'error')}">
			<label class="col-md-3 control-label" for="breakdownVisitTechnician"><g:message
					code="event.breakdownVisitTechnician.label" default="Technician" /></label>
			<div class="col-md-9">
				<g:textField name="breakdownVisitTechnician" class="form-control"
					value="${eventInstance?.breakdownVisitTechnician}" />
			</div>
		</div>

		<div
			class="breakdownVisitFields form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'breakdownVisitTechnicianNotes', 'error')}">
			<label class="col-md-3 control-label" for="breakdownVisitTechnicianNotes"><g:message
					code="event.breakdownVisitTechnicianNotes.label" default="Notes/Parts Replaced." /></label>
			<div class="col-md-9">
				<g:textArea name="breakdownVisitTechnicianNotes" class="form-control"
					value="${eventInstance?.breakdownVisitTechnicianNotes}" rows="10"
					cols="100" />
			</div>
		</div>

		<div
			class="breakdownVisitFields form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'breakdownVisitSignedOffBy', 'error')}">
			<label class="col-md-3 control-label"for="breakdownVisitSignedOffBy"><g:message
					code="event.breakdownVisitSignedOffBy.label"
					default="Signed Off By" /></label>
			<div class="col-md-9">
				<g:textField name="breakdownVisitSignedOffBy" class="form-control"
					value="${eventInstance?.breakdownVisitSignedOffBy}" />
			</div>
		</div>
		<!-- Breakdown Visit Fields -->
	</div>

	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'status', 'error')}">
			<label class="col-md-3 control-label"for="status"><g:message code="event.status.label"
					default="Status" /></label>
			<div class="col-md-9">
				<g:select name="status" class="form-control"
					from="${eventInstance.constraints.status.inList}"
					value="${eventInstance?.status}" valueMessagePrefix="event.status"
					noSelection="['': '']" />
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'priority', 'error')}">
			<label class="col-md-3 control-label"for="priority"><g:message code="event.priority.label"
					default="Priority" /></label>
			<div class="col-md-9">
				<g:select name="priority" class="form-control"
					from="${eventInstance.constraints.priority.inList}"
					value="${eventInstance?.priority}"
					valueMessagePrefix="event.priority" noSelection="['': '']" />
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'relatedTo', 'error')}">
			<label class="col-md-3 control-label"for="relatedTo"><g:message
					code="event.relatedTo.label" default="Related To" /></label>
			<div class="col-md-9">
				<g:select name="relatedTo" class="form-control"
					from="${eventInstance.constraints.relatedTo.inList}"
					value="${eventInstance?.relatedTo}"
					valueMessagePrefix="event.relatedTo" noSelection="['': '']" />
				<g:textField name="relatedToValue" class="form-control" value="${eventInstance?.relatedToValue}" />
			</div>
				
			<!-- Add a link here. Link the order or the organization from here. -->
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'startTime', 'error')}">
			<label class="col-md-3 control-label"for="startTime"><g:message
					code="event.startTime.label" default="Start Time" /></label>
			<div class="col-md-9">
				<richui:dateChooser name="startTime" class="col-md-6"
					value="${eventInstance?.startTime}" time="true" 
					hourClass="col-md-2" minuteClass="col-md-2" />
			</div>
		</div>


		<div
			class="form-group fieldcontain ${hasErrors(bean: eventInstance, field: 'endTime', 'error')}">
			<label class="col-md-3 control-label"for="endTime"><g:message code="event.endTime.label"
					default="End Time" /></label>
			<div class="col-md-9">
				<richui:dateChooser class="col-md-6" name="endTime" value="${eventInstance?.endTime}" 
					time="true" hourClass="col-md-2" minuteClass="col-md-2" />		
			</div>
		</div>

	</div>
</div>
