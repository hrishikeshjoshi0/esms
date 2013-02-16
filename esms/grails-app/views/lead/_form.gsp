<%@ page import="com.esms.model.party.Organization"%>

<g:hiddenField name="salesStatus" value="LEAD"/>
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

<div class="page-header">
	<h3>
		Contact
	</h3>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'salutation', 'error')} ">
	<label for="salutation" class="control-label"><g:message
			code="contact.salutation.label" default="Salutation" /></label>
	<div class="controls">
		<g:textField name="salutation" value="${contactInstance?.salutation}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'salutation', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'firstName', 'error')} required">
	<label for="firstName" class="control-label"><g:message
			code="contact.firstName.label" default="First Name" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="firstName" required=""
			value="${contactInstance?.firstName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'firstName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'middleName', 'error')} ">
	<label for="middleName" class="control-label"><g:message
			code="contact.middleName.label" default="Middle Name" /></label>
	<div class="controls">
		<g:textField name="middleName" value="${contactInstance?.middleName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'middleName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'lastName', 'error')} ">
	<label for="lastName" class="control-label"><g:message
			code="contact.lastName.label" default="Last Name" /></label>
	<div class="controls">
		<g:textField name="lastName" value="${contactInstance?.lastName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'lastName', 'error')}
		</span>
	</div>
</div>

<div class="page-header">
	<h3>
		Address
	</h3>
</div>
<g:render template="/address/form"></g:render>

<div class="page-header">
	<h3>
		Phones, Emails etc.
	</h3>
</div>
<g:render template="/phoneBook/form"></g:render>

<div class="page-header">
	<h3>
		Reason for Change
	</h3>
</div>
<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'description', 'error')} ">
	<div class="controls">
		<g:textArea name="description" cols="40" rows="5" maxlength="1000" style="width:80%;"
			value="${organizationInstance?.description}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'description', 'error')}
		</span>
	</div>
</div>