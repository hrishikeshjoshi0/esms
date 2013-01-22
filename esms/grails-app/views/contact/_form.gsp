<%@ page import="com.esms.model.party.Contact"%>
<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'externalId', 'error')} required">
	<label for="externalId" class="control-label"><g:message
			code="contact.externalId.label" default="External Id" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="externalId" required=""
			value="${contactInstance?.externalId}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'externalId', 'error')}
		</span>
	</div>
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

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'description', 'error')} ">
	<label for="description" class="control-label"><g:message
			code="contact.description.label" default="Description" /></label>
	<div class="controls">
		<g:textArea name="description" cols="40" rows="5" maxlength="1000"
			value="${contactInstance?.description}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'description', 'error')}
		</span>
	</div>
</div>