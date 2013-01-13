

<%@ page import="com.esms.model.party.Organization" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'organization.label', default: 'Organization')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>

			<dl class="dl-horizontal">
				
					<g:if test="${organizationInstance?.description}">
						<dt><g:message code="organization.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${organizationInstance}" field="description"/></dd>
						
					</g:if>
				
					<g:if test="${organizationInstance?.partyType}">
						<dt><g:message code="organization.partyType.label" default="Party Type" /></dt>
						
							<dd><g:fieldValue bean="${organizationInstance}" field="partyType"/></dd>
						
					</g:if>
				
					<g:if test="${organizationInstance?.status}">
						<dt><g:message code="organization.status.label" default="Status" /></dt>
						
							<dd><g:fieldValue bean="${organizationInstance}" field="status"/></dd>
						
					</g:if>
				
					<g:if test="${organizationInstance?.externalId}">
						<dt><g:message code="organization.externalId.label" default="External Id" /></dt>
						
							<dd><g:fieldValue bean="${organizationInstance}" field="externalId"/></dd>
						
					</g:if>
				
					<g:if test="${organizationInstance?.name}">
						<dt><g:message code="organization.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${organizationInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${organizationInstance?.salesStatus}">
						<dt><g:message code="organization.salesStatus.label" default="Sales Status" /></dt>
						
							<dd><g:fieldValue bean="${organizationInstance}" field="salesStatus"/></dd>
						
					</g:if>
				
					<g:if test="${organizationInstance?.addresses}">
						<dt><g:message code="organization.addresses.label" default="Addresses" /></dt>
						
							<g:each in="${organizationInstance.addresses}" var="a">
							<dd><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${organizationInstance?.assignedTo}">
						<dt><g:message code="organization.assignedTo.label" default="Assigned To" /></dt>
						
							<dd><g:fieldValue bean="${organizationInstance}" field="assignedTo"/></dd>
						
					</g:if>
				
					<g:if test="${organizationInstance?.contacts}">
						<dt><g:message code="organization.contacts.label" default="Contacts" /></dt>
						
							<g:each in="${organizationInstance.contacts}" var="c">
							<dd><g:link controller="contact" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
					<g:if test="${organizationInstance?.phoneBooks}">
						<dt><g:message code="organization.phoneBooks.label" default="Phone Books" /></dt>
						
							<g:each in="${organizationInstance.phoneBooks}" var="p">
							<dd><g:link controller="phoneBook" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></dd>
							</g:each>
						
					</g:if>
				
			</dl>

			<g:form>
				<g:hiddenField name="id" value="${organizationInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${organizationInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
