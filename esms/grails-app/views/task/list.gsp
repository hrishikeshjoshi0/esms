
<%@ page import="com.esms.model.calendar.Task" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
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
						
							<g:sortableColumn property="taskName" title="${message(code: 'task.taskName.label', default: 'Task Name')}" />
						
							<g:sortableColumn property="taskDescription" title="${message(code: 'task.taskDescription.label', default: 'Task Description')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'task.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="priority" title="${message(code: 'task.priority.label', default: 'Priority')}" />
						
							<g:sortableColumn property="assignedTo" title="${message(code: 'task.assignedTo.label', default: 'Assigned To')}" />
						
							<g:sortableColumn property="assignedToValue" title="${message(code: 'task.assignedToValue.label', default: 'Assigned To Value')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${taskInstanceList}" var="taskInstance">
						<tr>
						
							<td>${fieldValue(bean: taskInstance, field: "taskName")}</td>
						
							<td>${fieldValue(bean: taskInstance, field: "taskDescription")}</td>
						
							<td>${fieldValue(bean: taskInstance, field: "status")}</td>
						
							<td>${fieldValue(bean: taskInstance, field: "priority")}</td>
						
							<td>${fieldValue(bean: taskInstance, field: "assignedTo")}</td>
						
							<td>${fieldValue(bean: taskInstance, field: "assignedToValue")}</td>
						
							<td class="link">
								<g:link action="show" id="${taskInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${taskInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
