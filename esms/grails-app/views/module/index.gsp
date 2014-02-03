
<%@ page import="com.esms.model.core.Module" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'module.label', default: 'Module')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-module" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-module" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'module.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="active" title="${message(code: 'module.active.label', default: 'Active')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'module.url.label', default: 'Url')}" />
					
						<g:sortableColumn property="controller" title="${message(code: 'module.controller.label', default: 'Controller')}" />
					
						<g:sortableColumn property="action" title="${message(code: 'module.action.label', default: 'Action')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'module.comments.label', default: 'Comments')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${moduleInstanceList}" status="i" var="moduleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${moduleInstance.id}">${fieldValue(bean: moduleInstance, field: "name")}</g:link></td>
					
						<td><g:formatBoolean boolean="${moduleInstance.active}" /></td>
					
						<td>${fieldValue(bean: moduleInstance, field: "url")}</td>
					
						<td>${fieldValue(bean: moduleInstance, field: "controller")}</td>
					
						<td>${fieldValue(bean: moduleInstance, field: "action")}</td>
					
						<td>${fieldValue(bean: moduleInstance, field: "comments")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${moduleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
