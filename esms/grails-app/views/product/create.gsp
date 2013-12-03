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
	<div class="row">
		<div class="col-md-12">
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

			<bs3:pageHeader pageHeaderLabel="${message(code: 'default.create.label',args:[entityName])}" />

			<bs3:form action="create"/>		
		</div>
	</div>
</body>
</html>
