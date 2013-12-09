
<%@ page import="com.esms.model.party.PartyGroup" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'partyGroup.label', default: 'PartyGroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h3>
						<g:message code="default.list.label" args="[entityName]" />
					</h3>
				</div>
				
				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
						
							<g:sortableColumn property="description" title="${message(code: 'partyGroup.description.label', default: 'Description')}" />
						
							<g:sortableColumn property="partyType" title="${message(code: 'partyGroup.partyType.label', default: 'Party Type')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'partyGroup.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="relationshipType" title="${message(code: 'partyGroup.relationshipType.label', default: 'Relationship Type')}" />
						
							<g:sortableColumn property="groupName" title="${message(code: 'partyGroup.groupName.label', default: 'Group Name')}" />
						
							<g:sortableColumn property="externalId" title="${message(code: 'partyGroup.externalId.label', default: 'External Id')}" />
						
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
						
							<td>${fieldValue(bean: partyGroupInstance, field: "groupName")}</td>
						
							<td>${fieldValue(bean: partyGroupInstance, field: "externalId")}</td>
						
							<td class="link">
								<g:link action="show" id="${partyGroupInstance.id}" class="lnk">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate total="${partyGroupInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
