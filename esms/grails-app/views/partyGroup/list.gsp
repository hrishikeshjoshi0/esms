
<%@ page import="com.esms.party.PartyGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partyGroup.label', default: 'PartyGroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-partyGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-partyGroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'partyGroup.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="partyType" title="${message(code: 'partyGroup.partyType.label', default: 'Party Type')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'partyGroup.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="relationshipType" title="${message(code: 'partyGroup.relationshipType.label', default: 'Relationship Type')}" />
					
						<g:sortableColumn property="comments" title="${message(code: 'partyGroup.comments.label', default: 'Comments')}" />
					
						<g:sortableColumn property="groupName" title="${message(code: 'partyGroup.groupName.label', default: 'Group Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${partyGroupInstanceList}" status="i" var="partyGroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${partyGroupInstance.id}">${fieldValue(bean: partyGroupInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: partyGroupInstance, field: "partyType")}</td>
					
						<td>${fieldValue(bean: partyGroupInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: partyGroupInstance, field: "relationshipType")}</td>
					
						<td>${fieldValue(bean: partyGroupInstance, field: "comments")}</td>
					
						<td>${fieldValue(bean: partyGroupInstance, field: "groupName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${partyGroupInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
