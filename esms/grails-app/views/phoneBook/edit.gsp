<%@ page import="com.esms.model.party.PhoneBook" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'phoneBook.label', default: 'PhoneBook')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<g:hasErrors bean="${phoneBookInstance}">
				<bootstrap:alert class="alert-error">
					<ul>
						<g:eachError bean="${phoneBookInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h1>
					<g:message code="default.edit.label" args="[entityName]" />
				</h1>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="edit"
					id="${phoneBookInstance?.id}"
					>
					<g:hiddenField name="version" value="${phoneBookInstance?.version}" />
					<fieldset>
						<g:render template="form"></g:render>
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">
								<i class="icon-ok icon-white"></i>
								<g:message code="default.button.update.label" default="Update" />
							</button>
							<button type="submit" class="btn btn-danger"
								name="_action_delete" formnovalidate>
								<i class="icon-trash icon-white"></i>
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
