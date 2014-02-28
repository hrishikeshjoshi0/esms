
<%@ page import="com.esms.model.core.ui.View" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'view.label', default: 'View')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-view" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-view" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'view.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="url" title="${message(code: 'view.url.label', default: 'Url')}" />
					
						<g:sortableColumn property="controller" title="${message(code: 'view.controller.label', default: 'Controller')}" />
					
						<g:sortableColumn property="action" title="${message(code: 'view.action.label', default: 'Action')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'view.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'view.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${viewInstanceList}" status="i" var="viewInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${viewInstance.id}">${fieldValue(bean: viewInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: viewInstance, field: "url")}</td>
					
						<td>${fieldValue(bean: viewInstance, field: "controller")}</td>
					
						<td>${fieldValue(bean: viewInstance, field: "action")}</td>
					
						<td><g:formatBoolean boolean="${viewInstance.enabled}" /></td>
					
						<td>${fieldValue(bean: viewInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${viewInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
