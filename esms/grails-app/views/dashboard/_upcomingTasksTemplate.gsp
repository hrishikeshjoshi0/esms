<%@ page import="com.esms.model.order.Order"%>
<g:each in="${upcomingTasks}" var="taskInstance">
	<tr>

				<td>
					<g:link action="show" id="${taskInstance.id}"
						controller="task" class="lnk ">
						${fieldValue(bean: taskInstance, field: "taskName")}
					</g:link>	
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

			</tr>
</g:each>