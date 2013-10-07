<%@ page import="com.esms.model.payment.Payment" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'payment.label', default: 'Payment')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<g:hasErrors bean="${paymentInstance}">
				<bootstrap:alert class="alert-error">
					<ul>
						<g:eachError bean="${paymentInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h1>
					Update Clearance Date
				</h1>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="updateClearanceDate"
					id="${paymentInstance?.id}">
					<g:hiddenField name="version" value="${paymentInstance?.version}" />
					<fieldset>
						<div
							class="chequeFields control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'clearanceDate', 'error')} ">
							<label for="branch" class="control-label"><g:message
									code="payment.clearanceDate.label" default="Clearance Date" /></label>
							<div class="controls">
								<g:datePicker precision="day" name="clearanceDate" value="${paymentInstance?.clearanceDate}" />
								<span class="help-inline">
									${hasErrors(bean: paymentInstance, field: 'clearanceDate', 'error')}
								</span>
							</div>
						</div>

						<div class="form-actions">
							<button type="submit" class="btn btn-primary">
								<i class="icon-ok icon-white"></i>
								<g:message code="default.button.update.label" default="Update" />
							</button>
							<button type="submit" class="btn btn-danger"
								name="_action_delete" formnovalidate>
								<i class="icon-trash icon-white"></i>
								<g:message code="default.button.delete.label" default="Delete" />
							</button>
						</div>
					</fieldset>
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>