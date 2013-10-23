

<%@ page import="com.esms.model.calendar.Task"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'task.label', default: 'Task')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${taskInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${taskInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="task.taskName.label" default="Task Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${taskInstance}" field="taskName" />
				</dd>


				<dt>
					<g:message code="task.taskDescription.label"
						default="Task Description" />
				</dt>

				<dd>
					<g:fieldValue bean="${taskInstance}" field="taskDescription" />
				</dd>


				<dt>
					<g:message code="task.status.label" default="Status" />
				</dt>

				<dd>
					<g:fieldValue bean="${taskInstance}" field="status" />
				</dd>


				<dt>
					<g:message code="task.priority.label" default="Priority" />
				</dt>

				<dd>
					<g:fieldValue bean="${taskInstance}" field="priority" />
				</dd>


				<dt>
					<g:message code="task.assignedTo.label" default="Assigned To" />
				</dt>

				<dd>
					<g:fieldValue bean="${taskInstance}" field="assignedTo" />
				</dd>


				<dt>
					<g:message code="task.assignedToValue.label"
						default="Assigned To Value" />
				</dt>

				<dd>
					<g:fieldValue bean="${taskInstance}" field="assignedToValue" />
				</dd>


				<dt>
					<g:message code="task.relatedTo.label" default="Related To" />
				</dt>

				<dd>
					<g:fieldValue bean="${taskInstance}" field="relatedTo" />
				</dd>


				<dt>
					<g:message code="task.relatedToValue.label"
						default="Related To Value" />
				</dt>

				<dd>
					<g:fieldValue bean="${taskInstance}" field="relatedToValue" />
				</dd>


				<dt>
					<g:message code="task.dateTime.label" default="Date Time" />
				</dt>

				<dd>
					<g:formatDate date="${taskInstance?.dateTime}" />
				</dd>


				<dt>
					<g:message code="task.dueDateTime.label" default="Due Date Time" />
				</dt>

				<dd>
					<g:formatDate date="${taskInstance?.dueDateTime}" />
				</dd>


				<dt>
					<g:message code="task.notification.label" default="Notification" />
				</dt>

				<dd>
					<g:formatBoolean boolean="${taskInstance?.notification}" />
				</dd>


			</dl>
		</div>
	</div>
</body>
</html>
