<%@ page import="com.esms.model.calendar.Task"%>
<%@page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'task.label', default: 'Task')}" />
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

						<th>
							${message(code: 'task.taskName.label', default: 'Task Name')}
						</th>

						<th>
							${message(code: 'task.dateTime.label', default: 'Date')}
						</th>

						<th>
							${message(code: 'task.dueDateTime.label', default: 'Due Date')}
						</th>

						<th>
							${message(code: 'task.relatedToValue.label', default: 'Organization')}
						</th>

						<th>
							${message(code: 'task.status.label', default: 'Status')}
						</th>

						<th>
							${message(code: 'task.priority.label', default: 'Priority')}
						</th>

						<th>
							${message(code: 'task.assignedToValue.label', default: 'Assigned To Value')}
						</th>

						<th></th>
					</tr>
				</thead>
				<tbody id="upcomingTasks">
					<g:each in="${taskInstanceList}" var="taskInstance">
						<tr>

							<td>
								${fieldValue(bean: taskInstance, field: "taskName")}
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "dateTime")}
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "dueDateTime")}
							</td>

							<td>
								<%
									def o
									if(taskInstance.relatedToValue?.startsWith('ORG')) {
										o = Organization.findByExternalId(taskInstance.relatedToValue)
										println o?.name
									}
								 %>
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "status")}
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "priority")}
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "assignedToValue")}
							</td>

							<td class="link"><g:link action="show"
									id="${taskInstance.id}" controller="task" class="btn btn-small">Show &raquo;</g:link></td>
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
