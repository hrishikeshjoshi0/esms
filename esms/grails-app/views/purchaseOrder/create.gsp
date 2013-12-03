<%@ page import="com.esms.model.order.PurchaseOrder" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'purchaseOrder.label', default: 'PurchaseOrder')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<g:hasErrors bean="${purchaseOrderInstance}">
				<bootstrap:alert class="alert-error">
					<ul>
						<g:eachError bean="${purchaseOrderInstance}" var="error">
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

			<bs3:form action="create"/>	
		</div>
	</div>
</body>
</html>
