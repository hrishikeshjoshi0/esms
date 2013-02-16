
<%@ page import="com.esms.model.calendar.EventLog" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'eventLog.label', default: 'EventLog')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<div class="page-header">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						
							<g:sortableColumn property="loggedDate" title="${message(code: 'eventLog.loggedDate.label', default: 'Logged Date')}" />
						
							<g:sortableColumn property="workDoneBy" title="${message(code: 'eventLog.workDoneBy.label', default: 'Work Done By')}" />
						
							<g:sortableColumn property="reviewedBy" title="${message(code: 'eventLog.reviewedBy.label', default: 'Reviewed By')}" />
						
							<g:sortableColumn property="comments" title="${message(code: 'eventLog.comments.label', default: 'Comments')}" />
						
							<g:sortableColumn property="isProblemReported" title="${message(code: 'eventLog.isProblemReported.label', default: 'Is Problem Reported')}" />
						
							<g:sortableColumn property="urgency" title="${message(code: 'eventLog.urgency.label', default: 'Urgency')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${eventLogInstanceList}" var="eventLogInstance">
						<tr>
						
							<td><g:formatDate date="${eventLogInstance.loggedDate}" /></td>
						
							<td>${fieldValue(bean: eventLogInstance, field: "workDoneBy")}</td>
						
							<td>${fieldValue(bean: eventLogInstance, field: "reviewedBy")}</td>
						
							<td>${fieldValue(bean: eventLogInstance, field: "comments")}</td>
						
							<td><g:formatBoolean boolean="${eventLogInstance.isProblemReported}" /></td>
						
							<td>${fieldValue(bean: eventLogInstance, field: "urgency")}</td>
						
							<td class="link">
								<g:link action="show" id="${eventLogInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${eventLogInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
