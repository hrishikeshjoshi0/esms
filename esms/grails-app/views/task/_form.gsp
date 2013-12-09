<%@ page import="com.esms.model.calendar.Task"%>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'taskName', 'error')} required">
			<label for="taskName" class="col-md-3 control-label"><g:message
					code="task.taskName.label" default="Task Name" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:textField name="taskName" required="" class="form-control"
					value="${taskInstance?.taskName}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'taskName', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="col-md-6"></div>
</div>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'status', 'error')} ">
			<label for="status" class="col-md-3 control-label"><g:message
					code="task.status.label" default="Status" /></label>
			<div class="col-md-9">
				<g:select name="status" class="form-control"
					from="${taskInstance.constraints.status.inList}"
					value="${taskInstance?.status}" valueMessagePrefix="task.status"
					noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'status', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'priority', 'error')} ">
			<label for="priority" class="col-md-3 control-label"><g:message
					code="task.priority.label" default="Priority" /></label>
			<div class="col-md-9">
				<g:select name="priority" class="form-control"
					from="${taskInstance.constraints.priority.inList}"
					value="${taskInstance?.priority}"
					valueMessagePrefix="task.priority" noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'priority', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'assignedTo', 'error')} ">
			<label for="assignedTo" class="col-md-3 control-label"><g:message
					code="task.assignedTo.label" default="Assigned To" /></label>
			<div class="col-md-9">
				<g:textField class="form-control" name="assignedTo" value="${taskInstance?.assignedTo}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'assignedTo', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'assignedToValue', 'error')} ">
			<label for="assignedToValue" class="col-md-3 control-label"><g:message
					code="task.assignedToValue.label" default="Assigned To Value" /></label>
			<div class="col-md-9">
				<g:textField class="form-control" name="assignedToValue"
					value="${taskInstance?.assignedToValue}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'assignedToValue', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'relatedTo', 'error')} ">
			<label for="relatedTo" class="col-md-3 control-label"><g:message
					code="task.relatedTo.label" default="Related To" /></label>
			<div class="col-md-9">
				<g:select name="relatedTo" class="form-control"
					from="${taskInstance.constraints.relatedTo.inList}"
					value="${taskInstance?.relatedTo}"
					valueMessagePrefix="task.relatedTo" noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'relatedTo', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'relatedToValue', 'error')} ">
			<label for="relatedToValue" class="col-md-3 control-label"><g:message
					code="task.relatedToValue.label" default="Related To Value" /></label>
			<div class="col-md-9">
				<g:textField name="relatedToValue" class="form-control"
					value="${taskInstance?.relatedToValue}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'relatedToValue', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'dateTime', 'error')}">
			<label for="dateTime" class="col-md-3 control-label"><g:message
					code="task.dateTime.label" default="Date Time" /></label>
			<div class="col-md-9">
				<richui:dateChooser class="form-control" name="dateTime" value="${taskInstance?.dateTime}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'dateTime', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'dueDateTime', 'error')}">
			<label for="dueDateTime" class="col-md-3 control-label"><g:message
					code="task.dueDateTime.label" default="Due Date Time" /></label>
			<div class="col-md-9">
				<richui:dateChooser class="form-control" name="dueDateTime" value="${taskInstance?.dueDateTime}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'dueDateTime', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: taskInstance, field: 'notification', 'error')} ">
			<label for="notification" class="col-md-3 control-label"><g:message
					code="task.notification.label" default="Notification" /></label>
			<div class="checkbox">
				<g:checkBox name="notification" 
					value="${taskInstance?.notification}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'notification', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="col-md-6"></div>
</div>

<div class="row">
	<div class="col-md-12">
		<div
			class="form-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'taskDescription', 'error')}">
			<label for="taskDescription" class="col-md-3 control-label"><g:message
					code="taskInstance.taskDescription.label" default="taskDescription" /></label>
			<div class="col-md-9">
				<g:textArea name="taskDescription" rows="10" cols="100" class="form-control"
					value="${taskInstance?.taskDescription}" />
				<span class="help-inline"> ${hasErrors(bean: taskInstance, field: 'taskDescription', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>