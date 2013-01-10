
<%@ page import="com.esms.party.PartyGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'partyGroup.label', default: 'PartyGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-partyGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-partyGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list partyGroup">
			
				<g:if test="${partyGroupInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="partyGroup.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${partyGroupInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyGroupInstance?.partyType}">
				<li class="fieldcontain">
					<span id="partyType-label" class="property-label"><g:message code="partyGroup.partyType.label" default="Party Type" /></span>
					
						<span class="property-value" aria-labelledby="partyType-label"><g:fieldValue bean="${partyGroupInstance}" field="partyType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyGroupInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="partyGroup.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${partyGroupInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyGroupInstance?.relationshipType}">
				<li class="fieldcontain">
					<span id="relationshipType-label" class="property-label"><g:message code="partyGroup.relationshipType.label" default="Relationship Type" /></span>
					
						<span class="property-value" aria-labelledby="relationshipType-label"><g:fieldValue bean="${partyGroupInstance}" field="relationshipType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyGroupInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="partyGroup.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${partyGroupInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyGroupInstance?.groupName}">
				<li class="fieldcontain">
					<span id="groupName-label" class="property-label"><g:message code="partyGroup.groupName.label" default="Group Name" /></span>
					
						<span class="property-value" aria-labelledby="groupName-label"><g:fieldValue bean="${partyGroupInstance}" field="groupName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyGroupInstance?.externalId}">
				<li class="fieldcontain">
					<span id="externalId-label" class="property-label"><g:message code="partyGroup.externalId.label" default="External Id" /></span>
					
						<span class="property-value" aria-labelledby="externalId-label"><g:fieldValue bean="${partyGroupInstance}" field="externalId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${partyGroupInstance?.partyId}">
				<li class="fieldcontain">
					<span id="partyId-label" class="property-label"><g:message code="partyGroup.partyId.label" default="Party Id" /></span>
					
						<span class="property-value" aria-labelledby="partyId-label"><g:fieldValue bean="${partyGroupInstance}" field="partyId"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${partyGroupInstance?.id}" />
					<g:link class="edit" action="edit" id="${partyGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
