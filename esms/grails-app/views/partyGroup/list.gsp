
<%@ page import="com.esms.model.party.PartyGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'partyGroup.label', default: 'PartyGroup')}" />
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
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="description" title="${message(code: 'partyGroup.description.label', default: 'Description')}" />
						
							<g:sortableColumn property="partyType" title="${message(code: 'partyGroup.partyType.label', default: 'Party Type')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'partyGroup.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="relationshipType" title="${message(code: 'partyGroup.relationshipType.label', default: 'Relationship Type')}" />
						
							<g:sortableColumn property="comments" title="${message(code: 'partyGroup.comments.label', default: 'Comments')}" />
						
							<g:sortableColumn property="groupName" title="${message(code: 'partyGroup.groupName.label', default: 'Group Name')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${partyGroupInstanceList}" var="partyGroupInstance">
						<tr>
						
							<td>${fieldValue(bean: partyGroupInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: partyGroupInstance, field: "partyType")}</td>
						
							<td>${fieldValue(bean: partyGroupInstance, field: "status")}</td>
						
							<td>${fieldValue(bean: partyGroupInstance, field: "relationshipType")}</td>
						
							<td>${fieldValue(bean: partyGroupInstance, field: "comments")}</td>
						
							<td>${fieldValue(bean: partyGroupInstance, field: "groupName")}</td>
						
							<td class="link">
								<g:link action="show" id="${partyGroupInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${partyGroupInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
