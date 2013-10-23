<%@ page import="com.esms.model.calendar.Task"%>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'taskName', 'error')} required">
			<label for="taskName" class="control-label"><g:message
					code="task.taskName.label" default="Task Name" /><span
				class="required-indicator">*</span></label>
			<div class="controls">
				<g:textField name="taskName" required=""
					value="${taskInstance?.taskName}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'taskName', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="span6"></div>
</div>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'status', 'error')} ">
			<label for="status" class="control-label"><g:message
					code="task.status.label" default="Status" /></label>
			<div class="controls">
				<g:select name="status"
					from="${taskInstance.constraints.status.inList}"
					value="${taskInstance?.status}" valueMessagePrefix="task.status"
					noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'status', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'priority', 'error')} ">
			<label for="priority" class="control-label"><g:message
					code="task.priority.label" default="Priority" /></label>
			<div class="controls">
				<g:select name="priority"
					from="${taskInstance.constraints.priority.inList}"
					value="${taskInstance?.priority}"
					valueMessagePrefix="task.priority" noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'priority', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'assignedTo', 'error')} ">
			<label for="assignedTo" class="control-label"><g:message
					code="task.assignedTo.label" default="Assigned To" /></label>
			<div class="controls">
				<g:textField name="assignedTo" value="${taskInstance?.assignedTo}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'assignedTo', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'assignedToValue', 'error')} ">
			<label for="assignedToValue" class="control-label"><g:message
					code="task.assignedToValue.label" default="Assigned To Value" /></label>
			<div class="controls">
				<g:textField name="assignedToValue"
					value="${taskInstance?.assignedToValue}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'assignedToValue', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'relatedTo', 'error')} ">
			<label for="relatedTo" class="control-label"><g:message
					code="task.relatedTo.label" default="Related To" /></label>
			<div class="controls">
				<g:select name="relatedTo"
					from="${taskInstance.constraints.relatedTo.inList}"
					value="${taskInstance?.relatedTo}"
					valueMessagePrefix="task.relatedTo" noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'relatedTo', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'relatedToValue', 'error')} ">
			<label for="relatedToValue" class="control-label"><g:message
					code="task.relatedToValue.label" default="Related To Value" /></label>
			<div class="controls">
				<g:textField name="relatedToValue"
					value="${taskInstance?.relatedToValue}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'relatedToValue', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'dateTime', 'error')}">
			<label for="dateTime" class="control-label"><g:message
					code="task.dateTime.label" default="Date Time" /></label>
			<div class="controls">
				<richui:dateChooser name="dateTime" value="${taskInstance?.dateTime}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'dateTime', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'dueDateTime', 'error')}">
			<label for="dueDateTime" class="control-label"><g:message
					code="task.dueDateTime.label" default="Due Date Time" /></label>
			<div class="controls">
				<richui:dateChooser name="dueDateTime" value="${taskInstance?.dueDateTime}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'dueDateTime', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'notification', 'error')} ">
			<label for="notification" class="control-label"><g:message
					code="task.notification.label" default="Notification" /></label>
			<div class="controls">
				<g:checkBox name="notification"
					value="${taskInstance?.notification}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'notification', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="span6"></div>
</div>

<div class="page-header">
	<h1>
		Task Description
	</h1>
</div>

<div class="row-fluid">
	<div class="span12">
		<div
			class="control-group fieldcontain ${hasErrors(bean: taskInstance, field: 'taskDescription', 'error')} ">
			<div class="controls">
				<g:textArea name="taskDescription" rows="10" cols="100"
					value="${taskInstance?.taskDescription}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'taskDescription', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>