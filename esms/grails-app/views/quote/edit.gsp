<%@ page import="com.esms.model.quote.Quote" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'quote.label', default: 'Quote')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<g:hasErrors bean="${quoteInstance}">
				<bootstrap:alert class="alert-error">
					<ul>
						<g:eachError bean="${quoteInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h3>
					<g:message code="default.edit.label" args="[entityName]" />
				</h3>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="edit"
					id="${quoteInstance?.id}"
					>
					<g:hiddenField name="version" value="${quoteInstance?.version}" />
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
			</fieldset>
		</div>
	</div>
</body>
</html>
