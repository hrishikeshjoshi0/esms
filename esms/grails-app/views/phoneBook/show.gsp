

<%@ page import="com.esms.model.party.PhoneBook" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'phoneBook.label', default: 'PhoneBook')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:message code="default.show.label" args="[entityName]" />
				</h3>
			</div>

			<dl class="dl-horizontal">
				
							<dt><g:message code="phoneBook.email.label" default="Email" /></dt>
						
							<dd><g:fieldValue bean="${phoneBookInstance}" field="email"/></dd>
						
				
							<dt><g:message code="phoneBook.homePhone.label" default="Home Phone" /></dt>
						
							<dd><g:fieldValue bean="${phoneBookInstance}" field="homePhone"/></dd>
						
				
							<dt><g:message code="phoneBook.mobilePhone.label" default="Mobile Phone" /></dt>
						
							<dd><g:fieldValue bean="${phoneBookInstance}" field="mobilePhone"/></dd>
						
				
							<dt><g:message code="phoneBook.officePhone.label" default="Office Phone" /></dt>
						
							<dd><g:fieldValue bean="${phoneBookInstance}" field="officePhone"/></dd>
						
				
							<dt><g:message code="phoneBook.otherPhone.label" default="Other Phone" /></dt>
						
							<dd><g:fieldValue bean="${phoneBookInstance}" field="otherPhone"/></dd>
						
				
							<dt><g:message code="phoneBook.party.label" default="Party" /></dt>
						
							<dd><g:link controller="party" action="show" id="${phoneBookInstance?.party?.id}">
								${phoneBookInstance?.party?.encodeAsHTML()}</g:link>
							</dd>
						
				
							<dt><g:message code="phoneBook.secondaryEmail.label" default="Secondary Email" /></dt>
						
							<dd><g:fieldValue bean="${phoneBookInstance}" field="secondaryEmail"/></dd>
						
				
			</dl>

			<g:form>
				<g:hiddenField name="id" value="${phoneBookInstance?.id}" />
				<div class="form-group">
					<g:link class="btn btn-default btn-xs" action="edit" id="${phoneBookInstance?.id}">
						
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
