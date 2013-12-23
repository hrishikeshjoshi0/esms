<%@ page import="com.esms.model.order.Order"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'order.label', default: 'Order')}" />
<title>Renewal Lost</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<g:hasErrors bean="${orderInstance}">
				<bootstrap:alert class="alert-danger">
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
				<h3>Renewal Lost</h3>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="renewalLost"
					id="${orderInstance?.id}">
					<fieldset>
						<div class="form-group fieldcontain required">
							<label for="grandTotal" class="col-md-3 control-label"><g:message
									code="order.renewalLostReason.label"
									default="Renewal Lost Reason" /><span
								class="required-indicator">*</span></label>
							<div class="col-md-9">
								<g:textArea name="renewalLostReason"
									value="${params.renewalLostReason}" />
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
