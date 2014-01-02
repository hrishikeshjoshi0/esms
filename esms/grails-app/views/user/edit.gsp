<html>
<%@ page import="org.codehaus.groovy.grails.plugins.PluginManagerHolder" %>

<sec:ifNotSwitched>
	<sec:ifAllGranted roles='ROLE_SWITCH_USER'>
	<g:if test='${user.username}'>
	<g:set var='canRunAs' value='${true}'/>
	</g:if>
	</sec:ifAllGranted>
</sec:ifNotSwitched>

<head>
	<meta name='layout' content='bootstrap3'/>
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
	<title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

<div class="page-header">
	<h3><g:message code="default.edit.label" args="[entityName]"/></h3>
</div>

<g:form action="update" name='userEditForm' class="button-style">
	<g:hiddenField name="id" value="${user?.id}"/>
	<g:hiddenField name="version" value="${user?.version}"/>

	<fieldset>
		<g:render template="form"></g:render>
		<div class="form-group">
			<button type="submit" class="btn btn-primary">
				<g:message code="default.button.update.label" default="Update" />
			</button>
			<button type="submit" class="btn btn-sm btn-default"
				name="_action_delete" formnovalidate>
				<g:message code="default.button.delete.label" default="Delete" />
			</button>
		</div>
	</fieldset>
</g:form>

<script>
$(document).ready(function() {
	$('#username').focus();
});
</script>

</body>
</html>
