<%@ page import="com.esms.model.core.ui.View" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'view.label', default: 'View')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<g:hasErrors bean="${viewInstance}">
				<bootstrap:alert class="alert-danger">
					<ul>
						<g:eachError bean="${viewInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<fieldset>
				<g:form class="form-horizontal" action="create"
					>
					<fieldset>
						<div class="row">
							<div class="col-md-6">
								<g:render template="form"></g:render>
								<div class="form-actions">
									<button type="submit" class="btn btn-sm btn-primary">
										<i class="icon-ok icon-white"></i>
										<g:message code="default.button.create.label" default="Create" />
									</button>
								</div>
							</div>
						</div>		
					</fieldset>
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>
