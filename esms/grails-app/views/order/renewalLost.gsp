<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'order.label', default: 'Order')}" />
<title>
	Renewal Lost
</title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<g:hasErrors bean="${orderInstance}">
				<bootstrap:alert class="alert-error">
					<ul>
						<g:eachError bean="${orderInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h1>
					Renewal Lost
				</h1>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="renewalLost" id="${orderInstance?.id}">
					<fieldset>
						<div
							class="control-group fieldcontain required">
							<label for="grandTotal" class="control-label"><g:message
									code="order.renewalLostReason.label" default="Renewal Lost Reason" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:textArea name="renewalLostReason" value="${params.renewalLostReason}" />
							</div>
						</div>
												
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">
								<i class="icon-ok icon-white"></i>
								<g:message code="default.button.save.label" default="Save" />
							</button>
						</div>
					</fieldset>
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>
