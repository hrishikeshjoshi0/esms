<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'order.label', default: 'Order')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
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
				<h3>
					<g:message code="default.create.label" args="[entityName]" />
				</h3>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="create"
					>
					<fieldset>
						<g:render template="form"></g:render>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">
								
								<g:message code="default.button.saveAndAddLineItems.label" default="Save & Add Line Items" />
							</button>
						</div>
					</fieldset>
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>
