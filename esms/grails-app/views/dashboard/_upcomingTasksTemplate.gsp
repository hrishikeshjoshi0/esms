<%@ page import="com.esms.model.order.Order" %>
<g:each in="${upcomingTasks}" var="taskInstance">
	<g:set var="order" value="${Order.findByOrderNumber(taskInstance.relatedToValue)}"/>
	<tr>

		<td>
			${fieldValue(bean: taskInstance, field: "taskName")}
		</td>

		<td>
			${order?.orderNumber}
		</td>

		<td>
			${order?.organization?.name}
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
				controller="task" class="btn btn-small">Show &raquo;</g:link></td>
	</tr>
</g:each>