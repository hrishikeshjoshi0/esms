

<%@ page import="com.esms.model.party.Contact"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'contact.label', default: 'Contact')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					Contact :
					${contactInstance?.externalId}
				</h1>
				<h3>
					<small>
						${contactInstance?.firstName} ${contactInstance?.lastName}
					</small>
				</h3>
			</div>
			
			<g:form>
				<g:hiddenField name="id" value="${contactInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${contactInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">
				<dt>
					<g:message code="contact.salutation.label" default="Salutation" />
				</dt>

				<dd>
					<g:fieldValue bean="${contactInstance}" field="salutation" />
				</dd>


				<dt>
					<g:message code="contact.status.label" default="Status" />
				</dt>

				<dd>
					<g:fieldValue bean="${contactInstance}" field="status" />
				</dd>


				<dt>
					<g:message code="contact.externalId.label" default="External Id" />
				</dt>

				<dd>
					<g:fieldValue bean="${contactInstance}" field="externalId" />
				</dd>


				<dt>
					<g:message code="contact.firstName.label" default="First Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${contactInstance}" field="firstName" />
				</dd>


				<dt>
					<g:message code="contact.middleName.label" default="Middle Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${contactInstance}" field="middleName" />
				</dd>

				<dt>
					<g:message code="contact.lastName.label" default="Last Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${contactInstance}" field="lastName" />
				</dd>
				<dt>
					<g:message code="contact.organization.label" default="Organization" />
				</dt>

				<dd>
					<g:link controller="party" action="show"
						id="${contactInstance?.organization?.id}">
						${contactInstance?.organization?.name}
					</g:link>
				</dd>


				<dt>
					<g:message code="contact.description.label" default="Description" />
				</dt>

				<dd>
					<g:fieldValue bean="${contactInstance}" field="description" />
				</dd>

			</dl>
		</div>
	</div>
</body>
</html>
