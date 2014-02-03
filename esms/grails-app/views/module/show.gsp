

<%@ page import="com.esms.model.core.Module" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'module.label', default: 'Module')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>
			
			<g:form>
				<g:hiddenField name="id" value="${moduleInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${moduleInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">
				
							<dt><g:message code="module.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${moduleInstance}" field="name"/></dd>
						
				
							<dt><g:message code="module.active.label" default="Active" /></dt>
						
							<dd><g:formatBoolean boolean="${moduleInstance?.active}" /></dd>
						
				
							<dt><g:message code="module.url.label" default="Url" /></dt>
						
							<dd><g:fieldValue bean="${moduleInstance}" field="url"/></dd>
						
				
							<dt><g:message code="module.controller.label" default="Controller" /></dt>
						
							<dd><g:fieldValue bean="${moduleInstance}" field="controller"/></dd>
						
				
							<dt><g:message code="module.action.label" default="Action" /></dt>
						
							<dd><g:fieldValue bean="${moduleInstance}" field="action"/></dd>
						
				
							<dt><g:message code="module.comments.label" default="Comments" /></dt>
						
							<dd><g:fieldValue bean="${moduleInstance}" field="comments"/></dd>
						
				
							<dt><g:message code="module.displayText.label" default="Display Text" /></dt>
						
							<dd><g:fieldValue bean="${moduleInstance}" field="displayText"/></dd>
						
				
			</dl>
		</div>
	</div>
</body>
</html>
