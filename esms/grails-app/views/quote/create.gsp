<%@ page import="com.esms.model.quote.Quote" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'quote.label', default: 'Quote')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
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
				<h1>
					<g:message code="default.create.label" args="[entityName]" />
				</h1>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="create"
					>
					<fieldset>
						<g:render template="form"></g:render>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">
								<i class="icon-ok icon-white"></i>
								<g:message code="default.button.create.label" default="Create" />
							</button>
						</div>
					</fieldset>
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>
