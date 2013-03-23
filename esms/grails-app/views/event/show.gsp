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
			  <li class="active"><a href="#contactsTabPane">Activity Log</a></li>
			</ul>
			 
			<div class="tab-content">
			  <div class="tab-pane active" id="contactsTabPane">
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