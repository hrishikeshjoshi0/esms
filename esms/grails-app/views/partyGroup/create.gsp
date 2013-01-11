<%@ page import="com.esms.model.party.PartyGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'partyGroup.label', default: 'PartyGroup')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
				<g:hasErrors bean="${partyGroupInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${partyGroupInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="create" >
						<fieldset>
							<f:all bean="partyGroupInstance"/>
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
	</body>
</html>
