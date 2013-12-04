<%@ page import="com.esms.model.product.Product" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'product.label', default: 'Product')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
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

			<bs3:pageHeader pageHeaderLabel="${message(code: 'default.edit.label',args:[entityName])}" />
			
			<div class="well">
				<g:form class="form-horizontal" action="edit"
					id="${productInstance?.id}">
					<g:hiddenField name="version" value="${productInstance?.version}" />
					<fieldset>
						<g:render template="form"></g:render>
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
			</div>
			

		</div>
	</div>
</body>
</html>
