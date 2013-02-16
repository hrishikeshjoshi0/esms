<%@ page import="com.esms.model.party.PhoneBook"%>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')} ">
	<label for="email" class="control-label"><g:message
			code="phoneBook.email.label" default="Primary Email" /></label>
	<div class="controls">
		<g:textField name="email" value="${phoneBookInstance?.email}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'email', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')} ">
	<label for="secondaryEmail" class="control-label"><g:message
			code="phoneBook.secondaryEmail.label" default="Secondary Email" /></label>
	<div class="controls">
		<g:textField name="secondaryEmail"
			value="${phoneBookInstance?.secondaryEmail}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')} ">
	<label for="homePhone" class="control-label"><g:message
			code="phoneBook.homePhone.label" default="Home Phone" /></label>
	<div class="controls">
		<g:textField name="homePhone" value="${phoneBookInstance?.homePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')} ">
	<label for="mobilePhone" class="control-label"><g:message
			code="phoneBook.mobilePhone.label" default="Mobile Phone" /></label>
	<div class="controls">
		<g:textField name="mobilePhone"
			value="${phoneBookInstance?.mobilePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')} ">
	<label for="officePhone" class="control-label"><g:message
			code="phoneBook.officePhone.label" default="Office Phone" /></label>
	<div class="controls">
		<g:textField name="officePhone"
			value="${phoneBookInstance?.officePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')} ">
	<label for="otherPhone" class="control-label"><g:message
			code="phoneBook.otherPhone.label" default="Other Phone" /></label>
	<div class="controls">
		<g:textField name="otherPhone"
			value="${phoneBookInstance?.otherPhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')}
		</span>
	</div>
</div>