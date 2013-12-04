

<%@ page import="com.esms.model.party.PartyGroup" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'partyGroup.label', default: 'PartyGroup')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:message code="default.list.label" args="[entityName]" />
				</h3>
			</div>

			<dl class="dl-horizontal">
				
					<g:if test="${partyGroupInstance?.description}">
						<dt><g:message code="partyGroup.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${partyGroupInstance}" field="description"/></dd>
						
					</g:if>
				
					<g:if test="${partyGroupInstance?.partyType}">
						<dt><g:message code="partyGroup.partyType.label" default="Party Type" /></dt>
						
							<dd><g:fieldValue bean="${partyGroupInstance}" field="partyType"/></dd>
						
					</g:if>
				
					<g:if test="${partyGroupInstance?.status}">
						<dt><g:message code="partyGroup.status.label" default="Status" /></dt>
						
							<dd><g:fieldValue bean="${partyGroupInstance}" field="status"/></dd>
						
					</g:if>
				
					<g:if test="${partyGroupInstance?.relationshipType}">
						<dt><g:message code="partyGroup.relationshipType.label" default="Relationship Type" /></dt>
						
							<dd><g:fieldValue bean="${partyGroupInstance}" field="relationshipType"/></dd>
						
					</g:if>
				
					<g:if test="${partyGroupInstance?.groupName}">
						<dt><g:message code="partyGroup.groupName.label" default="Group Name" /></dt>
						
							<dd><g:fieldValue bean="${partyGroupInstance}" field="groupName"/></dd>
						
					</g:if>
				
					<g:if test="${partyGroupInstance?.addresses}">
						<dt><g:message code="partyGroup.addresses.label" default="Addresses" /></dt>
						
							<g:each in="${partyGroupInstance.addresses}" var="a">
							<dd><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${partyGroupInstance?.contactMechs}">
						<dt><g:message code="partyGroup.contactMechs.label" default="Contact Mechs" /></dt>
						
							<g:each in="${partyGroupInstance.contactMechs}" var="c">
							<dd><g:link controller="contactMech" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${partyGroupInstance?.externalId}">
						<dt><g:message code="partyGroup.externalId.label" default="External Id" /></dt>
						
							<dd><g:fieldValue bean="${partyGroupInstance}" field="externalId"/></dd>
						
					</g:if>
				
			</dl>

			<g:form>
				<g:hiddenField name="id" value="${partyGroupInstance?.id}" />
				<div class="form-group">
					<g:link class="btn btn-default btn-sm" action="edit" id="${partyGroupInstance?.id}">
						
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-sm btn-danger" type="submit" name="_action_delete">
						
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
