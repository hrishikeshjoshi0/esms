<g:each in="${upcomingTasks}" var="taskInstance">
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
			${fieldValue(bean: taskInstance, field: "assignedTo")}
		</td>

		<td>
			${fieldValue(bean: taskInstance, field: "assignedToValue")}
		</td>

		<td class="link"><g:link action="show" id="${taskInstance.id}"
				controller="task" class="btn btn-small">Show &raquo;</g:link></td>
	</tr>
</g:each>