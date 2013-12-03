<%@page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.order.Order" %>
<script>
	function updateTasks() {
		$('#upcomingTasks').html('');
		$('#upcomingTasks').html('Loading...');
	}
</script>
<div class="dashboard-widget-header">
	<h5>
		Upcoming Tasks for
		<g:select name="upcomingRenewalMonthParam1" from="${filteredMonthMap}"
			optionKey="key" optionValue="value"
			value="${params.upcomingRenewalMonthParam}"
			onchange="${remoteFunction(action: 'upcomingTasks',onLoading:'updateTasks();',
                       update: [success: 'upcomingTasks'],method:'GET',onFailure:'alert(\'Error\');',
                       params: '\'upcomingRenewalMonthParam=\' + this.value + \'&upcomingRenewalYearParam=\' + document.getElementById(\'upcomingRenewalYearParam1\').value')}" />

		<g:select name="upcomingRenewalYearParam1" from="${years}"
			value="${params.upcomingRenewalYearParam}"
			onchange="${remoteFunction(action: 'upcomingTasks',onLoading:'updateTasks();',
                       update: [success: 'upcomingTasks'],method:'GET',onFailure:'alert(\'Error\');',
                       params: '\'upcomingRenewalMonthParam=\' + document.getElementById(\'upcomingRenewalMonthParam1\').value + \'&upcomingRenewalYearParam=\' + this.value')}" />
	</h5>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>

			<th>
				${message(code: 'task.taskName.label', default: 'Task Name')}
			</th>
			
			<th>
				${message(code: 'task.relatedToValue.label', default: 'Order Number')}
			</th>
			
			<th>
				${message(code: 'task.organization.label', default: 'Building Name')}
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
				${message(code: 'task.assignedToValue.label', default: 'Assigned To Value')}
			</th>

			<th></th>
		</tr>
	</thead>
	<tbody id="upcomingTasks">
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
						controller="task" class="btn btn-default btn-sm">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th class="link" colspan="10">
				<g:link controller="task" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
<div class="pagination">
	<bootstrap:paginate total="${upcomingTasks?upcomingTasks.size():0}" />
</div>