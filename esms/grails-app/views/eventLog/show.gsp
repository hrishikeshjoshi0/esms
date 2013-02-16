

<%@ page import="com.esms.model.calendar.EventLog" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'eventLog.label', default: 'EventLog')}" />
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
				<g:hiddenField name="id" value="${eventLogInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${eventLogInstance?.id}">
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
				
							<dt><g:message code="eventLog.loggedDate.label" default="Logged Date" /></dt>
						
							<dd><g:formatDate date="${eventLogInstance?.loggedDate}" /></dd>
						
				
							<dt><g:message code="eventLog.workDoneBy.label" default="Work Done By" /></dt>
						
							<dd><g:fieldValue bean="${eventLogInstance}" field="workDoneBy"/></dd>
						
				
							<dt><g:message code="eventLog.reviewedBy.label" default="Reviewed By" /></dt>
						
							<dd><g:fieldValue bean="${eventLogInstance}" field="reviewedBy"/></dd>
						
				
							<dt><g:message code="eventLog.comments.label" default="Comments" /></dt>
						
							<dd><g:fieldValue bean="${eventLogInstance}" field="comments"/></dd>
						
				
							<dt><g:message code="eventLog.isProblemReported.label" default="Is Problem Reported" /></dt>
						
							<dd><g:formatBoolean boolean="${eventLogInstance?.isProblemReported}" /></dd>
						
				
							<dt><g:message code="eventLog.urgency.label" default="Urgency" /></dt>
						
							<dd><g:fieldValue bean="${eventLogInstance}" field="urgency"/></dd>
						
				
							<dt><g:message code="eventLog.event.label" default="Event" /></dt>
						
							<dd><g:link controller="event" action="show" id="${eventLogInstance?.event?.id}">${eventLogInstance?.event?.encodeAsHTML()}</g:link></dd>
						
				
			</dl>
		</div>
	</div>
</body>
</html>
