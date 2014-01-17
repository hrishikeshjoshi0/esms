
<%@ page import="com.esms.model.party.Contact"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'contact.label', default: 'Contact')}" />
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
						<g:sortableColumn property="externalId"
							title="${message(code: 'contact.externalId.label', default: 'External Id')}" />
						<g:sortableColumn property="designation"
							title="${message(code: 'contact.designation.label', default: 'Designation')}" />
						<g:sortableColumn property="firstName"
							title="${message(code: 'contact.firstName.label', default: 'First Name')}" />
						<g:sortableColumn property="lastName"
							title="${message(code: 'contact.lastName.label', default: 'Last Name')}" />
						<g:sortableColumn property="phoneBook.email"
							title="${message(code: 'phoneBook.email.label', default: 'Email')}" />
						<g:sortableColumn property="phoneBook.homePhone"
							title="${message(code: 'phoneBook.homePhone.label', default: 'Home Phone')}" />
						<g:sortableColumn property="phoneBook.mobilePhone"
							title="${message(code: 'phoneBook.mobilePhone.label', default: 'Mobile Phone')}" />
						<g:sortableColumn property="phoneBook.officePhone"
							title="${message(code: 'phoneBook.officePhone.label', default: 'Office Phone')}" />
						<g:sortableColumn property="phoneBook.otherPhone"
							title="${message(code: 'phoneBook.otherPhone.label', default: 'Other Phone')}" />
						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${organizationInstance?.contacts}"
						var="contactInstance">
						<g:set value="${contactInstance?.phoneBooks?.first()}"
							var="phoneBookInstance" />
						<tr>
							<td>
								${fieldValue(bean: contactInstance, field: "externalId")}
							</td>
							<td>
								${fieldValue(bean: contactInstance, field: "designation")}
							</td>
							<td>
								${fieldValue(bean: contactInstance, field: "firstName")}
							</td>
							<td>
								${fieldValue(bean: contactInstance, field: "lastName")}
							</td>

							<td>
								${fieldValue(bean: phoneBookInstance, field: "email")}
							</td>

							<td>
								${fieldValue(bean: phoneBookInstance, field: "homePhone")}
							</td>

							<td>
								${fieldValue(bean: phoneBookInstance, field: "mobilePhone")}
							</td>

							<td>
								${fieldValue(bean: phoneBookInstance, field: "officePhone")}
							</td>

							<td>
								${fieldValue(bean: phoneBookInstance, field: "otherPhone")}
							</td>

							<td class="link"><g:link action="show" controller="contact"
									id="${contactInstance.id}" class="lnk ">Show &raquo;</g:link></td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pgn">
				<bootstrap:paginate total="${contactInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
