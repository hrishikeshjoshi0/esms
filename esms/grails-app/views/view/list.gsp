
<%@ page import="com.esms.model.core.ui.View" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'view.label', default: 'View')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				
				<filterpane:filterPane domain="com.esms.model.core.ui.View"
					filterProperties="${['action', 'actionsTemplate', 'controller', 'enabled','title']}"
					titleKey="default.filterPane.header" dialog="yes" visible="n"
					showSortPanel="y" showTitle="y" showButtons="y"
					fullAssociationPathFieldNames="false" />

				<div class="table-responsive">
					<table class="table table-striped table-condensed table-bordered table-hover">
						<thead>
							<tr>
							
								<g:sortableColumn property="name" title="${message(code: 'view.name.label', default: 'Name')}" />
							
								<g:sortableColumn property="url" title="${message(code: 'view.url.label', default: 'Url')}" />
							
								<g:sortableColumn property="controller" title="${message(code: 'view.controller.label', default: 'Controller')}" />
							
								<g:sortableColumn property="action" title="${message(code: 'view.action.label', default: 'Action')}" />
							
								<g:sortableColumn property="enabled" title="${message(code: 'view.enabled.label', default: 'Enabled')}" />
							
								<g:sortableColumn property="title" title="${message(code: 'view.title.label', default: 'Title')}" />
							
								<th></th>
							</tr>
						</thead>
						<tbody>
						<g:each in="${viewInstanceList}" var="viewInstance">
							<tr>
							
								<td>${fieldValue(bean: viewInstance, field: "name")}</td>
							
								<td>${fieldValue(bean: viewInstance, field: "url")}</td>
							
								<td>${fieldValue(bean: viewInstance, field: "controller")}</td>
							
								<td>${fieldValue(bean: viewInstance, field: "action")}</td>
							
								<td><g:formatBoolean boolean="${viewInstance.enabled}" /></td>
							
								<td>${fieldValue(bean: viewInstance, field: "title")}</td>
							
								<td class="link">
									<g:link action="show" id="${viewInstance.id}">Show &raquo;</g:link>
								</td>
							</tr>
						</g:each>
						</tbody>
					</table>
					<div class="pgn">
						<bootstrap:paginate total="${viewInstanceTotal}" params="${filterParams}" />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
