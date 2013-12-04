<%@ page import="com.esms.model.party.PhoneBook"%>

<div
	class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')} ">
	<label for="email" class="col-lg-2 control-label"><g:message
			code="phoneBook.email.label" default="Primary Email" /></label>
	<div class="col-lg-10">
		<g:textField name="email" value="${phoneBookInstance?.email}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'email', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')} ">
	<label for="secondaryEmail" class="col-lg-2 control-label"><g:message
			code="phoneBook.secondaryEmail.label" default="Secondary Email" /></label>
	<div class="col-lg-10">
		<g:textField name="secondaryEmail"
			value="${phoneBookInstance?.secondaryEmail}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')} ">
	<label for="homePhone" class="col-lg-2 control-label"><g:message
			code="phoneBook.homePhone.label" default="Home Phone" /></label>
	<div class="col-lg-10">
		<g:textField name="homePhone" value="${phoneBookInstance?.homePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')} ">
	<label for="mobilePhone" class="col-lg-2 control-label"><g:message
			code="phoneBook.mobilePhone.label" default="Mobile Phone" /></label>
	<div class="col-lg-10">
		<g:textField name="mobilePhone"
			value="${phoneBookInstance?.mobilePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')} ">
	<label for="officePhone" class="col-lg-2 control-label"><g:message
			code="phoneBook.officePhone.label" default="Office Phone" /></label>
	<div class="col-lg-10">
		<g:textField name="officePhone"
			value="${phoneBookInstance?.officePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')} ">
	<label for="otherPhone" class="col-lg-2 control-label"><g:message
			code="phoneBook.otherPhone.label" default="Other Phone" /></label>
	<div class="col-lg-10">
		<g:textField name="otherPhone"
			value="${phoneBookInstance?.otherPhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')}
		</span>
	</div>
</div>