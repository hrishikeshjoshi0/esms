<%@ page import="com.esms.model.payment.Payment" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'payment.label', default: 'Payment')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
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
				<h3>
					Update Clearance Date
				</h3>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="updateClearanceDate"
					id="${paymentInstance?.id}">
					<g:hiddenField name="version" value="${paymentInstance?.version}" />
					<fieldset>
						<div
							class="chequeFields control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'clearanceDate', 'error')} ">
							<label for="branch" class="col-lg-2 control-label"><g:message
									code="payment.clearanceDate.label" default="Clearance Date" /></label>
							<div class="col-lg-10">
								<g:datePicker precision="day" name="clearanceDate" value="${paymentInstance?.clearanceDate}" />
								<span class="help-inline">
									${hasErrors(bean: paymentInstance, field: 'clearanceDate', 'error')}
								</span>
							</div>
						</div>

						<div class="form-group">
							<button type="submit" class="btn btn-primary">
								
								<g:message code="default.button.update.label" default="Update" />
							</button>
							<button type="submit" class="btn btn-sm btn-danger"
								name="_action_delete" formnovalidate>
								
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