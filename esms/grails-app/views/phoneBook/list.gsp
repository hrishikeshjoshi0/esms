
<%@ page import="com.esms.model.party.PhoneBook" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'phoneBook.label', default: 'PhoneBook')}" />
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
						
							<g:sortableColumn property="email" title="${message(code: 'phoneBook.email.label', default: 'Email')}" />
						
							<g:sortableColumn property="homePhone" title="${message(code: 'phoneBook.homePhone.label', default: 'Home Phone')}" />
						
							<g:sortableColumn property="mobilePhone" title="${message(code: 'phoneBook.mobilePhone.label', default: 'Mobile Phone')}" />
						
							<g:sortableColumn property="officePhone" title="${message(code: 'phoneBook.officePhone.label', default: 'Office Phone')}" />
						
							<g:sortableColumn property="otherPhone" title="${message(code: 'phoneBook.otherPhone.label', default: 'Other Phone')}" />
						
							<th class="header"><g:message code="phoneBook.party.label" default="Party" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${phoneBookInstanceList}" var="phoneBookInstance">
						<tr>
						
							<td>${fieldValue(bean: phoneBookInstance, field: "email")}</td>
						
							<td>${fieldValue(bean: phoneBookInstance, field: "homePhone")}</td>
						
							<td>${fieldValue(bean: phoneBookInstance, field: "mobilePhone")}</td>
						
							<td>${fieldValue(bean: phoneBookInstance, field: "officePhone")}</td>
						
							<td>${fieldValue(bean: phoneBookInstance, field: "otherPhone")}</td>
						
							<td>${fieldValue(bean: phoneBookInstance, field: "party")}</td>
						
							<td class="link">
								<g:link action="show" id="${phoneBookInstance.id}" class="lnk">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate total="${phoneBookInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
