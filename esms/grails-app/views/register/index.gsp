<html>

<head>
<meta name='layout' content='register' />
<title><g:message code='spring.security.ui.register.title' /></title>
</head>

<body>
	
	<g:hasErrors bean="${user}">
		<bootstrap:alert class="alert-danger">
			<ul>
				<g:eachError bean="${user}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</bootstrap:alert>
	</g:hasErrors>

	<div class="page-header">
		<h3>
			<g:message code="spring.security.ui.register.title" />
		</h3>
	</div>
	
	<div class="col-md-12">
		<g:form action='register' name='registerForm'>
			<fieldset>
				<g:render template="form"></g:render>
			</fieldset>
			<div class="form-group">
				<div class="col-md-10 col-md-offset-2">
					<button type="submit" class="btn btn-sm btn-primary">
						<g:message code="default.button.create.label" default="Create" />
					</button>
				</div>
			</div>
		</g:form>
	</div>

	<script>
		$(document).ready(function() {
			$('#username').focus();
		});
	</script>

</body>
</html>
