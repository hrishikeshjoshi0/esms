<%@ page import="com.esms.model.party.Employee"%>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'firstName', 'error')} required">
			<label for="firstName" class="col-md-3 control-label"><g:message
					code="employee.firstName.label" default="First Name" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:textField name="firstName" required="" class="form-control"
					value="${employeeInstance?.firstName}" />
				<span class="help-inline">
					${hasErrors(bean: employeeInstance, field: 'firstName', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastName', 'error')} ">
			<label for="lastName" class="col-md-3 control-label"><g:message
					code="employee.lastName.label" default="Last Name" /></label>
			<div class="col-md-9">
				<g:textField name="lastName" value="${employeeInstance?.lastName}" class="form-control"/>
				<span class="help-inline">
					${hasErrors(bean: employeeInstance, field: 'lastName', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'middleName', 'error')} ">
			<label for="middleName" class="col-md-3 control-label"><g:message
					code="employee.middleName.label" default="Middle Name" /></label>
			<div class="col-md-9">
				<g:textField name="middleName" value="${employeeInstance?.middleName}" class="form-control"/>
				<span class="help-inline">
					${hasErrors(bean: employeeInstance, field: 'middleName', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'previousExperience', 'error')} required">
			<label for="previousExperience" class="col-md-3 control-label"><g:message
					code="employee.previousExperience.label"
					default="Previous Experience" /><span class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:field type="number" min="0" name="previousExperience" step="any" class="form-control"
					required="" value="${employeeInstance.previousExperience}" />
				<span class="help-inline">
					${hasErrors(bean: employeeInstance, field: 'previousExperience', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'salary', 'error')} required">
			<label for="salary" class="col-md-3 control-label"><g:message
					code="employee.salary.label" default="Salary" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:field type="number" name="salary" step="any" required="" class="form-control"
					value="${employeeInstance.salary}" />
				<span class="help-inline">
					${hasErrors(bean: employeeInstance, field: 'salary', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'employmentStartDate', 'error')} required">
			<label for="salary" class="col-md-3 control-label"><g:message
					code="employee.employmentStartDate.label" default="Employment Start Date" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<richui:dateChooser class="form-control" name="employmentStartDate" value="${employeeInstance.employmentStartDate}"/>
				<span class="help-inline">
					${hasErrors(bean: employeeInstance, field: 'employmentStartDate', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'benefits', 'error')} ">
			<label for="benefits" class="col-md-3 control-label"><g:message
					code="employee.benefits.label" default="Benefits" /></label>
			<div class="col-md-9">
				<g:textArea name="benefits" cols="40" rows="5" maxlength="1000" class="form-control"
					value="${employeeInstance?.benefits}" />
				<span class="help-inline">
					${hasErrors(bean: employeeInstance, field: 'benefits', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'skillLevel', 'error')} ">
			<label for="skillLevel" class="col-md-3 control-label"><g:message
					code="employee.skillLevel.label" default="Skill Level" /></label>
			<div class="col-md-9">
				<g:select name="skillLevel" class="form-control"
					from="${employeeInstance.constraints.skillLevel.inList}"
					value="${employeeInstance?.skillLevel}"
					valueMessagePrefix="employee.skillLevel" noSelection="['': '']" />
				<span class="help-inline">
					${hasErrors(bean: employeeInstance, field: 'skillLevel', 'error')}
				</span>
			</div>
		</div>
	</div>	
</div>

<!-- PhoneBook -->
<div class="page-header">
	<h5>
		Phones, Emails etc.
	</h5>
</div>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')} ">
			<label for="email" class="col-md-3 control-label"><g:message
					code="phoneBook.email.label" default="Primary Email" /></label>
			<div class="col-md-9">
				<g:textField name="email" value="${phoneBookInstance?.email}" class="form-control" />
				<span class="help-inline">
					${hasErrors(bean: phoneBookInstance, field: 'email', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')} ">
			<label for="secondaryEmail" class="col-md-3 control-label"><g:message
					code="phoneBook.secondaryEmail.label" default="Secondary Email" /></label>
			<div class="col-md-9">
				<g:textField name="secondaryEmail" class="form-control"
					value="${phoneBookInstance?.secondaryEmail}" />
				<span class="help-inline">
					${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')} ">
			<label for="homePhone" class="col-md-3 control-label"><g:message
					code="phoneBook.homePhone.label" default="Home Phone" /></label>
			<div class="col-md-9">
				<g:textField name="homePhone" class="form-control" value="${phoneBookInstance?.homePhone}" />
				<span class="help-inline">
					${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')} ">
			<label for="mobilePhone" class="col-md-3 control-label"><g:message
					code="phoneBook.mobilePhone.label" default="Mobile Phone" /></label>
			<div class="col-md-9">
				<g:textField name="mobilePhone" class="form-control"
					value="${phoneBookInstance?.mobilePhone}" />
				<span class="help-inline">
					${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')} ">
			<label for="officePhone" class="col-md-3 control-label"><g:message
					code="phoneBook.officePhone.label" default="Office Phone" /></label>
			<div class="col-md-9">
				<g:textField name="officePhone" class="form-control"
					value="${phoneBookInstance?.officePhone}" />
				<span class="help-inline">
					${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')} ">
			<label for="otherPhone" class="col-md-3 control-label"><g:message
					code="phoneBook.otherPhone.label" default="Other Phone" /></label>
			<div class="col-md-9">
				<g:textField name="otherPhone" class="form-control"
					value="${phoneBookInstance?.otherPhone}" />
				<span class="help-inline">
					${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>
	
<div class="page-header">
	<h5>
		Address
	</h5>
</div>
<div class="row">
	<div class="col-md-6">
		<g:render template="/address/form"></g:render>
	</div>
</div>	