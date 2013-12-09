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
							class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'handedOveryBy', 'error')} ">
							<label for="branch" class="col-md-3 control-label"><g:message
									code="payment.clearanceDate.label" default="Clearance Date" /></label>
							<div class="col-md-9">
								<g:datePicker precision="day" class="form-control" name="clearanceDate" value="${paymentInstance?.clearanceDate}" />
								<span class="help-inline">
									${hasErrors(bean: paymentInstance, field: 'clearanceDate', 'error')}
								</span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-sm btn-primary">
									<g:message code="default.button.save.label" default="Save" />
								</button>
							</div>
						</div>
					</fieldset>
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>