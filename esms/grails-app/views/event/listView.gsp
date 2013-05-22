
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
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${eventInstanceTotal}" />
				</div>
				<br/>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						
							<g:sortableColumn property="title" title="${message(code: 'event.title.label', default: 'Title')}" />
						
							<g:sortableColumn property="location" title="${message(code: 'event.location.label', default: 'Location')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${eventInstanceList}" var="eventInstance">
						<tr>
						
							<td>${fieldValue(bean: eventInstance, field: "title")}</td>
						
							<td>${fieldValue(bean: eventInstance, field: "location")}</td>
						
							<td class="link">
								<g:link action="show" id="${eventInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${eventInstanceList.size()}" />
				</div>
				<br/>
			</div>
		</div>
	</body>
</html>
