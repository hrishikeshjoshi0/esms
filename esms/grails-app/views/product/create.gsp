<%@ page import="com.esms.model.product.Product" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'product.label', default: 'Product')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<g:hasErrors bean="${productInstance}">
				<bootstrap:alert class="alert-error">
					<ul>
						<g:eachError bean="${productInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h2>
					<g:message code="default.create.label" args="[entityName]" />
				</h2>
			</div>

			<div class="well">
				<g:form class="form-horizontal" action="create">
					<fieldset>
						<g:render template="form"></g:render>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-sm btn-primary">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.create.label" default="Create" />
								</button>
							</div>
						</div>
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
