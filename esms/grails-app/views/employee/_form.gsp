<%@ page import="com.esms.model.party.Employee"%>

<div
	class="control-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'firstName', 'error')} required">
	<label for="firstName" class="control-label"><g:message
			code="employee.firstName.label" default="First Name" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="firstName" required=""
			value="${employeeInstance?.firstName}" />
		<span class="help-inline">
			${hasErrors(bean: employeeInstance, field: 'firstName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastName', 'error')} ">
	<label for="lastName" class="control-label"><g:message
			code="employee.lastName.label" default="Last Name" /></label>
	<div class="controls">
		<g:textField name="lastName" value="${employeeInstance?.lastName}" />
		<span class="help-inline">
			${hasErrors(bean: employeeInstance, field: 'lastName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'middleName', 'error')} ">
	<label for="middleName" class="control-label"><g:message
			code="employee.middleName.label" default="Middle Name" /></label>
	<div class="controls">
		<g:textField name="middleName" value="${employeeInstance?.middleName}" />
		<span class="help-inline">
			${hasErrors(bean: employeeInstance, field: 'middleName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'previousExperience', 'error')} required">
	<label for="previousExperience" class="control-label"><g:message
			code="employee.previousExperience.label"
			default="Previous Experience" /><span class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="previousExperience" step="any"
			required="" value="${employeeInstance.previousExperience}" />
		<span class="help-inline">
			${hasErrors(bean: employeeInstance, field: 'previousExperience', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'salary', 'error')} required">
	<label for="salary" class="control-label"><g:message
			code="employee.salary.label" default="Salary" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="salary" step="any" required=""
			value="${employeeInstance.salary}" />
		<span class="help-inline">
			${hasErrors(bean: employeeInstance, field: 'salary', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'employmentStartDate', 'error')} required">
	<label for="salary" class="control-label"><g:message
			code="employee.employmentStartDate.label" default="Employment Start Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:datePicker name="employmentStartDate" precision="day" value="${employeeInstance.employmentStartDate}"/>
		<span class="help-inline">
			${hasErrors(bean: employeeInstance, field: 'employmentStartDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'benefits', 'error')} ">
	<label for="benefits" class="control-label"><g:message
			code="employee.benefits.label" default="Benefits" /></label>
	<div class="controls">
		<g:textArea name="benefits" cols="40" rows="5" maxlength="1000"
			value="${employeeInstance?.benefits}" />
		<span class="help-inline">
			${hasErrors(bean: employeeInstance, field: 'benefits', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'skillLevel', 'error')} ">
	<label for="skillLevel" class="control-label"><g:message
			code="employee.skillLevel.label" default="Skill Level" /></label>
	<div class="controls">
		<g:select name="skillLevel"
			from="${employeeInstance.constraints.skillLevel.inList}"
			value="${employeeInstance?.skillLevel}"
			valueMessagePrefix="employee.skillLevel" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: employeeInstance, field: 'skillLevel', 'error')}
		</span>
	</div>
</div>

<!-- PhoneBook -->
<div class="page-header">
	<h3>
		Phones, Emails etc.
	</h3>
</div>
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

<div class="page-header">
	<h3>
		Address
	</h3>
</div>
<g:render template="/address/form"></g:render>