
<%@ page import="com.esms.model.party.Organization" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'organization.label', default: 'Customers')}" />
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
				
				<div class="span12">
					<g:render template="listFilter"></g:render>
				</div>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<g:sortableColumn property="externalId" title="${message(code: 'organization.externalId.label', default: 'External Id')}" />
							<g:sortableColumn property="name" title="${message(code: 'organization.name.label', default: 'Name')}" />
							<g:sortableColumn property="partyType" title="${message(code: 'organization.partyType.label', default: 'Party Type')}" />
							<g:sortableColumn property="assignedTo" title="${message(code: 'organization.assignedTo.label', default: 'Assigned To')}" />
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${organizationInstanceList}" var="organizationInstance">
						<tr>
							<td>${fieldValue(bean: organizationInstance, field: "externalId")}</td>
							<td>${fieldValue(bean: organizationInstance, field: "name")}</td>
							<td>${fieldValue(bean: organizationInstance, field: "partyType")}</td>
							<td>${fieldValue(bean: organizationInstance, field: "assignedTo")}</td>
							<td class="link">
								<g:link action="show" id="${organizationInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${organizationInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
