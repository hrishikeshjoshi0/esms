<%@page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.order.Order" %>
<script>
	function updateTasks() {
		$('#upcomingTasks').html('');
		$('#upcomingTasks').showSpinner();
		
	}
</script>
<div class="page-header">
	<h5>
		By month :
		<g:select name="upcomingRenewalMonthParam1" from="${filteredMonthMap}"
			optionKey="key" optionValue="value"
			value="${params.upcomingRenewalMonthParam}"
			onchange="${remoteFunction(action: 'upcomingTasks',onLoading:'updateTasks();',
                       update: [success: 'upcomingTasks'],method:'GET',onFailure:'$.growl.error({ title: "Error!", message: "There was some technical error." });',
                       params: '\'upcomingRenewalMonthParam=\' + this.value + \'&upcomingRenewalYearParam=\' + document.getElementById(\'upcomingRenewalYearParam1\').value')}" />

		<g:select name="upcomingRenewalYearParam1" from="${years}"
			value="${params.upcomingRenewalYearParam}"
			onchange="${remoteFunction(action: 'upcomingTasks',onLoading:'updateTasks();',
                       update: [success: 'upcomingTasks'],method:'GET',onFailure:'$.growl.error({ title: "Error!", message: "There was some technical error." });',
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
				${message(code: 'task.status.label', default: 'Status')}
			</th>
			
			<th>
				${message(code: 'task.dueDateTime.label', default: 'Due Date')}
			</th>

			<th>
				${message(code: 'task.priority.label', default: 'Priority')}
			</th>

			<th>
				${message(code: 'task.assignedTo.label', default: 'Assigned To')}
			</th>

		</tr>
	</thead>
	<tbody id="upcomingTasks">
		<g:each in="${upcomingTasks}" var="taskInstance">
			<tr>

				<td>
					<g:link action="show" id="${taskInstance.id}"
						controller="task" class="lnk ">
						${fieldValue(bean: taskInstance, field: "taskName")}
					</g:link>	
				</td>
				
				<td>
					${fieldValue(bean: taskInstance, field: "status")}
				</td>
				
				<td>
					${fieldValue(bean: taskInstance, field: "dueDateTime")}
				</td>
				
				<td>
					${fieldValue(bean: taskInstance, field: "priority")}
				</td>

				<td>
					${fieldValue(bean: taskInstance, field: "assignedTo")}
				</td>

			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th class="link" colspan="10">
				<g:link controller="task" action="list" params="[relatedTo:'ORDER']" class="lnk ">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>