<%@ page import="com.esms.model.party.Employee" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<g:hasErrors bean="${employeeInstance}">
				<bootstrap:alert class="alert-error">
					<ul>
						<g:eachError bean="${employeeInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h1>
					Employee # ${employeeInstance?.externalId} | ${employeeInstance?.lastName}, ${employeeInstance?.firstName}
				</h1>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="markAsTerminated" id="${employeeInstance?.id}" method="POST">
					<fieldset>
						<div
							class="control-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'employmentEndDate', 'error')} required">
							<label for="salary" class="control-label"><g:message
									code="employee.employmentEndDate.label" default="Employment End Date" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:datePicker name="employmentEndDate" precision="day" value="${employeeInstance?.employmentEndDate}"/>
								<span class="help-inline">
									${hasErrors(bean: employeeInstance, field: 'employmentEndDate', 'error')}
								</span>
							</div>
						</div>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">
								<i class="icon-ok icon-white"></i>
								<g:message code="default.button.create.label" default="Create" />
							</button>
						</div>
					</fieldset>
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>
