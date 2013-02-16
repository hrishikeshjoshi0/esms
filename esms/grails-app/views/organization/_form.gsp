<%@ page import="com.esms.model.party.Organization"%>

<g:hiddenField name="salesStatus" value="CUSTOMER"/>
<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'externalId', 'error')} required">
	<label for="externalId" class="control-label"><g:message
			code="organization.externalId.label" default="External Id" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="externalId" required="" readOnly="readOnly"
			value="${organizationInstance?.externalId}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'externalId', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'name', 'error')} ">
	<label for="name" class="control-label"><g:message
			code="organization.name.label" default="Name" /></label>
	<div class="controls">
		<g:textField name="name" value="${organizationInstance?.name}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'name', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo" class="control-label"><g:message
			code="organization.assignedTo.label" default="Assigned To" /></label>
	<div class="controls">
		<g:textField name="assignedTo"
			value="${organizationInstance?.assignedTo}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'assignedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'description', 'error')} ">
	<label for="description" class="control-label"><g:message
			code="organization.description.label" default="Description" /></label>
	<div class="controls">
		<g:textArea name="description" cols="40" rows="5" maxlength="1000" style="width:80%;"
			value="${organizationInstance?.description}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'description', 'error')}
		</span>
	</div>
</div>