<%@ page import="com.esms.model.party.Employee" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
<title>
	Employee ${employeeInstance?.externalId} | ${employeeInstance?.lastName}, ${employeeInstance?.firstName}
</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="col-md-12">
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
					<h3>
						Employee:
						${employeeInstance?.externalId}
					</h3>
					<h4>
						${employeeInstance?.lastName},
						${employeeInstance?.firstName}
					</h4>
				</div>
				
				<div class="well">
					<g:form class="form-horizontal" action="markAsTerminated">
						<g:hiddenField name="id" value="${params.id}"/>
						<fieldset>
							<div class="row">
								<div class="col-md-6">
									<div
										class="form-group fieldcontain ${hasErrors(bean: employeeInstance, field: 'employmentEndDate', 'error')} required">
										<label for="salary" class="col-md-3 control-label"><g:message
												code="employee.employmentEndDate.label" default="Employment End Date" /><span
											class="required-indicator">*</span></label>
										<div class="col-md-9">
											<richui:dateChooser name="employmentEndDate" value="${employeeInstance?.employmentEndDate}"/>
											<span class="help-inline">
												${hasErrors(bean: employeeInstance, field: 'employmentEndDate', 'error')}
											</span>
										</div>
									</div>
								</div>	 
							</div>
							<div class="form-group">
								<div class="col-md-10 col-md-offset-2">
									<button type="submit" class="btn btn-sm btn-primary">
										<g:message code="default.button.create.label" default="Create" />
									</button>
								</div>
							</div>
						</fieldset>
					</g:form>
				</div>		
			</div>
		</div>
	</div>
</body>
</html>
