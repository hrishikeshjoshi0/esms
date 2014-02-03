
<%@ page import="com.esms.model.core.Module" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'module.label', default: 'Module')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<div class="page-header">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						
							<g:sortableColumn property="name" title="${message(code: 'module.name.label', default: 'Name')}" />
						
							<g:sortableColumn property="active" title="${message(code: 'module.active.label', default: 'Active')}" />
						
							<g:sortableColumn property="url" title="${message(code: 'module.url.label', default: 'Url')}" />
						
							<g:sortableColumn property="controller" title="${message(code: 'module.controller.label', default: 'Controller')}" />
						
							<g:sortableColumn property="action" title="${message(code: 'module.action.label', default: 'Action')}" />
						
							<g:sortableColumn property="comments" title="${message(code: 'module.comments.label', default: 'Comments')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${moduleInstanceList}" var="moduleInstance">
						<tr>
						
							<td>${fieldValue(bean: moduleInstance, field: "name")}</td>
						
							<td><g:formatBoolean boolean="${moduleInstance.active}" /></td>
						
							<td>${fieldValue(bean: moduleInstance, field: "url")}</td>
						
							<td>${fieldValue(bean: moduleInstance, field: "controller")}</td>
						
							<td>${fieldValue(bean: moduleInstance, field: "action")}</td>
						
							<td>${fieldValue(bean: moduleInstance, field: "comments")}</td>
						
							<td class="link">
								<g:link action="show" id="${moduleInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate total="${moduleInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
