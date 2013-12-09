
<%@ page import="com.esms.model.calendar.Event" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h3>
						<g:message code="default.list.label" args="[entityName]" />
					</h3>
				</div>
				
				<table class="table table-striped table-condensed table-bordered">
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
								<g:link action="show" id="${eventInstance.id}" class="lnk">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate params="${filterParams}" total="${eventInstanceList.size()}" />
				</div>
			</div>
		</div>
	</body>
</html>
