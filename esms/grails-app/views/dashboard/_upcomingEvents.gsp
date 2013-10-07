<%@ page import="com.esms.model.calendar.Event" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<div class="page-header">
					<h1>
						Upcoming Events
					</h1>
				</div>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<g:sortableColumn property="startTime" title="${message(code: 'event.startTime.label', default: 'Start Time')}" />
							
							<g:sortableColumn property="title" title="${message(code: 'event.title.label', default: 'Title')}" />
						
							<g:sortableColumn property="location" title="${message(code: 'event.location.label', default: 'Location')}" />
							
							<g:sortableColumn property="status" title="${message(code: 'event.status.label', default: 'Status')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:if test="${upcomingEvents != null && upcomingEvents.size() != 0}">
						<g:each in="${upcomingEvents}" var="eventInstance">
							<tr>
								<td>${fieldValue(bean: eventInstance, field: "startTime")}</td>
							
								<td>${fieldValue(bean: eventInstance, field: "title")}</td>
							
								<td>${fieldValue(bean: eventInstance, field: "location")}</td>
								
								<td>${fieldValue(bean: eventInstance, field: "status")}</td>
							
								<td class="link">
									<g:link action="show" id="${eventInstance.id}" class="btn btn-small">Show &raquo;</g:link>
								</td>
							</tr>
						</g:each>
					</g:if>
					<g:else>
						<tr>
							<th colspan="5">
								<h4 style="color:red;">
									No Records Found !
								</h4>
							</th>
						</tr>
					</g:else>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${upcomingEvents?.size()}" />
				</div>
				<br/>
			</div>
		</div>
	</body>
</html>