<%@ page import="com.esms.model.calendar.EventLog"%>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'loggedDate', 'error')} required">
			<label for="loggedDate" class="col-md-3 control-label"><g:message
					code="eventLog.loggedDate.label" default="Logged Date" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<richui:dateChooser name="loggedDate" value="${eventLogInstance?.loggedDate}" class="form-control"/>	
				<span class="help-inline">
					${hasErrors(bean: eventLogInstance, field: 'loggedDate', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'workDoneBy', 'error')} required">
			<label for="workDoneBy" class="col-md-3 control-label"><g:message
					code="eventLog.workDoneBy.label" default="Work Done By" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:textField name="workDoneBy" required="" class="form-control"
					value="${eventLogInstance?.workDoneBy}" />
				<span class="help-inline">
					${hasErrors(bean: eventLogInstance, field: 'workDoneBy', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'reviewedBy', 'error')} required">
			<label for="reviewedBy" class="col-md-3 control-label"><g:message
					code="eventLog.reviewedBy.label" default="Reviewed By" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:textField name="reviewedBy" required="" class="form-control"
					value="${eventLogInstance?.reviewedBy}" />
				<span class="help-inline">
					${hasErrors(bean: eventLogInstance, field: 'reviewedBy', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>		

<div class="row">
	<g:if test="${eventInstance?.eventType == 'BREAKDOWN CALL'}">
		<div class="col-md-6">
			<div
				class="form-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'isProblemReported', 'error')} ">
				<label for="isProblemReported" class="col-md-3 control-label"><g:message
						code="eventLog.isProblemReported.label" default="Is Problem Repeated" /></label>
				<div class="col-md-9 checkbox">
					<g:checkBox name="isProblemReported"
						value="${eventLogInstance?.isProblemReported}" />
					<span class="help-inline">
						${hasErrors(bean: eventLogInstance, field: 'isProblemReported', 'error')}
					</span>
				</div>
			</div>		
		</div>
	</g:if>
	
	<!-- To Be Replaced -->
	<g:if test="${eventInstance?.eventType == 'MAINTENANCE VISIT'}">
		<div class="col-md-6">
			<div
				class="form-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'toBeReplaced', 'error')} ">
				<label for="tobeReplaced" class="col-md-3 control-label"><g:message
						code="eventLog.toBeReplaced.label" default="To Be Replaced" /></label>
				<div class="col-md-9 checkbox">
					<g:checkBox name="toBeReplaced"
						value="${eventLogInstance?.toBeReplaced}" />
					<span class="help-inline">
						${hasErrors(bean: eventLogInstance, field: 'toBeReplaced', 'error')}
					</span>
				</div>
			</div>
		</div>
	</g:if>
</div>			

<!--  Comments  -->
<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'comments', 'error')} ">
			<label for="comments" class="col-md-3 control-label"><g:message
					code="eventLog.comments.label" default="Comments" /></label>
			<div class="col-md-9">
				<g:textArea name="comments" cols="40" rows="5" maxlength="1000" class="form-control"
					value="${eventLogInstance?.comments}" />
				<span class="help-inline">
					${hasErrors(bean: eventLogInstance, field: 'comments', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: eventLogInstance, field: 'urgency', 'error')} ">
			<label for="urgency" class="col-md-3 control-label"><g:message
					code="eventLog.urgency.label" default="Urgency" /></label>
			<div class="col-md-9">
				<g:select name="urgency" class="form-control"
					from="${eventLogInstance.constraints.urgency.inList}"
					value="${eventLogInstance?.urgency}"
					valueMessagePrefix="eventLog.urgency" noSelection="['': '']" />
				<span class="help-inline">
					${hasErrors(bean: eventLogInstance, field: 'urgency', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>	