<%@ page import="com.esms.model.party.Contact"%>
<div
	class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'externalId', 'error')} required">
	<label for="externalId" class="col-md-3 control-label"><g:message
			code="contact.externalId.label" default="External Id" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:textField name="externalId" required="" readonly="readonly"
			value="${contactInstance?.externalId}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'externalId', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'designation', 'error')} ">
	<label for="designation" class="col-md-3 control-label"><g:message
			code="contact.designation.label" default="Designation" /></label>
	<div class="col-md-9">
		<g:select name="designation"
			from="${contactInstance.constraints.designation.inList}"
			value="${contactInstance?.designation}"
			noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'designation', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'salutation', 'error')} ">
	<label for="salutation" class="col-md-3 control-label"><g:message
			code="contact.salutation.label" default="Salutation" /></label>
	<div class="col-md-9">
		<g:textField name="salutation" value="${contactInstance?.salutation}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'salutation', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'firstName', 'error')} required">
	<label for="firstName" class="col-md-3 control-label"><g:message
			code="contact.firstName.label" default="First Name" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:textField name="firstName" required=""
			value="${contactInstance?.firstName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'firstName', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'middleName', 'error')} ">
	<label for="middleName" class="col-md-3 control-label"><g:message
			code="contact.middleName.label" default="Middle Name" /></label>
	<div class="col-md-9">
		<g:textField name="middleName" value="${contactInstance?.middleName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'middleName', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'lastName', 'error')} ">
	<label for="lastName" class="col-md-3 control-label"><g:message
			code="contact.lastName.label" default="Last Name" /></label>
	<div class="col-md-9">
		<g:textField name="lastName" value="${contactInstance?.lastName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'lastName', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'description', 'error')} ">
	<label for="description" class="col-md-3 control-label"><g:message
			code="contact.description.label" default="Description" /></label>
	<div class="col-md-9">
		<g:textArea name="description" cols="40" rows="5" maxlength="1000"
			value="${contactInstance?.description}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'description', 'error')}
		</span>
	</div>
</div>

