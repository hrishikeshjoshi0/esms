
<%@ page import="com.esms.model.party.Contact"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'contact.label', default: 'Contact')}" />
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

			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<g:sortableColumn property="externalId"
							title="${message(code: 'contact.externalId.label', default: 'External Id')}" />
						<g:sortableColumn property="firstName"
							title="${message(code: 'contact.firstName.label', default: 'First Name')}" />
						<g:sortableColumn property="lastName"
							title="${message(code: 'contact.lastName.label', default: 'Last Name')}" />
						<g:sortableColumn property="organization.name"
							title="${message(code: 'contact.organization.name.label', default: 'Organization Name')}" />
						<th>
							Email
						</th>		
						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${contactInstanceList}" var="contactInstance">
						<tr>
							<td>
								${fieldValue(bean: contactInstance, field: "externalId")}
							</td>
							<td>
								${fieldValue(bean: contactInstance, field: "firstName")}
							</td>
							<td>
								${fieldValue(bean: contactInstance, field: "lastName")}
							</td>
							<td>
								<g:link controller="organization" action="show" id="${contactInstance?.organization?.id}">
									${fieldValue(bean: contactInstance, field: "organization.name")}
								</g:link>
							</td>
							<td>
								<g:if test="${contactInstance.phoneBooks?.size() != 0}">
									${contactInstance.phoneBooks(0)?.email}
								</g:if>
							</td>
							<td class="link"><g:link action="show"
									id="${contactInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<bootstrap:paginate total="${contactInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
