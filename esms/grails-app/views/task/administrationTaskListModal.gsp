<%@ page import="com.esms.model.calendar.Task"%>
<%@page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.order.Order"%>
<!doctype html>
<html>
<head>
</head>
<body>
	<table class="table table-striped table-bordered mediaTable">
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
					${message(code: 'task.status.label', default: 'Status')}
				</th>

				<th>
					${message(code: 'task.priority.label', default: 'Priority')}
				</th>

				<th>
					${message(code: 'task.assignedToValue.label', default: 'Assigned To')}
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
						${fieldValue(bean: taskInstance, field: "status")}
					</td>

					<td>
						${fieldValue(bean: taskInstance, field: "priority")}
					</td>

					<td>
						${fieldValue(bean: taskInstance, field: "assignedToValue")}
					</td>

					<td class="link"><g:link action="show" id="${taskInstance.id}"
							controller="task" class="lnk ">Show &raquo;</g:link></td>
				</tr>
			</g:each>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="7" >
					<g:link action="list" params="[relatedTo:'ADMINISTRATION']"
							controller="task" class="lnk ">Show All &raquo;</g:link>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>
