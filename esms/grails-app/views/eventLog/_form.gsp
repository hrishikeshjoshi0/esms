<%@ page import="com.esms.model.calendar.EventLog"%>

<div
	class="control-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'loggedDate', 'error')} required">
	<label for="loggedDate" class="control-label"><g:message
			code="eventLog.loggedDate.label" default="Logged Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:datePicker name="loggedDate"
			value="${eventLogInstance?.loggedDate}" precision="day"/>
		<span class="help-inline">
			${hasErrors(bean: eventLogInstance, field: 'loggedDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'workDoneBy', 'error')} required">
	<label for="workDoneBy" class="control-label"><g:message
			code="eventLog.workDoneBy.label" default="Work Done By" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="workDoneBy" required=""
			value="${eventLogInstance?.workDoneBy}" />
		<span class="help-inline">
			${hasErrors(bean: eventLogInstance, field: 'workDoneBy', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'reviewedBy', 'error')} required">
	<label for="reviewedBy" class="control-label"><g:message
			code="eventLog.reviewedBy.label" default="Reviewed By" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="reviewedBy" required=""
			value="${eventLogInstance?.reviewedBy}" />
		<span class="help-inline">
			${hasErrors(bean: eventLogInstance, field: 'reviewedBy', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'comments', 'error')} ">
	<label for="comments" class="control-label"><g:message
			code="eventLog.comments.label" default="Comments" /></label>
	<div class="controls">
		<g:textArea name="comments" cols="40" rows="5" maxlength="1000"
			value="${eventLogInstance?.comments}" />
		<span class="help-inline">
			${hasErrors(bean: eventLogInstance, field: 'comments', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'isProblemReported', 'error')} ">
	<label for="isProblemReported" class="control-label"><g:message
			code="eventLog.isProblemReported.label" default="Is Problem Reported" /></label>
	<div class="controls">
		<g:checkBox name="isProblemReported"
			value="${eventLogInstance?.isProblemReported}" />
		<span class="help-inline">
			${hasErrors(bean: eventLogInstance, field: 'isProblemReported', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'urgency', 'error')} ">
	<label for="urgency" class="control-label"><g:message
			code="eventLog.urgency.label" default="Urgency" /></label>
	<div class="controls">
		<g:select name="urgency"
			from="${eventLogInstance.constraints.urgency.inList}"
			value="${eventLogInstance?.urgency}"
			valueMessagePrefix="eventLog.urgency" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: eventLogInstance, field: 'urgency', 'error')}
		</span>
	</div>
</div>