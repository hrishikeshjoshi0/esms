
<%@ page import="com.esms.model.party.Employee"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
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
			
			<filterpane:filterPane domain="com.esms.model.party.Employee"
						filterProperties="${['firstName', 'lastName']}"
						titleKey="default.filterPane.header" dialog="yes" visible="n"
										showSortPanel="y" showTitle="y" showButtons="y"
										fullAssociationPathFieldNames="false" />
						
			<table class="table table-striped table-condensed table-bordered">
				<thead>
					<tr>
						<g:sortableColumn params="${filterParams}" property="firstName"
							title="${message(code: 'employee.firstName.label', default: 'First Name')}" />

						<g:sortableColumn params="${filterParams}" property="lastName"
							title="${message(code: 'employee.lastName.label', default: 'Last Name')}" />

						<th>Mobile Number</th>

						<th>Home Number</th>

						<g:sortableColumn params="${filterParams}"
							property="addresses.address1"
							title="${message(code: 'address.address1.label', default: 'Address1')}" />
						<g:sortableColumn params="${filterParams}"
							property="addresses.address2"
							title="${message(code: 'address.address2.label', default: 'Address2')}" />
						<g:sortableColumn params="${filterParams}"
							property="addresses.city"
							title="${message(code: 'address.city.label', default: 'City')}" />
						
						<g:sortableColumn params="${filterParams}" property="skillLevel"
							title="${message(code: 'employee.skillLevel.label', default: 'Skill Level')}" />	

						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${employeeInstanceList}" var="employeeInstance">
						<g:set var="addressInstance" value="${employeeInstance?.addresses?.first()}" />
						<tr>

							<td>
								${fieldValue(bean: employeeInstance, field: "firstName")}
							</td>

							<td>
								${fieldValue(bean: employeeInstance, field: "lastName")}
							</td>
							
							<td>
								${employeeInstance?.phoneBooks?.first()?.mobilePhone}
							</td>
							
							<td>
								${employeeInstance?.phoneBooks?.first()?.homePhone}
							</td>

							<td>
								${addressInstance?.address1}
							</td>
							<td>
								${addressInstance?.address2}
							</td>
							<td>
								${addressInstance?.city}
							</td>
							
							<td>
								${fieldValue(bean: employeeInstance, field: "skillLevel")}
							</td>

							<td class="link"><g:link action="show"
									id="${employeeInstance.id}" class="lnk">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pgn">
				<bootstrap:paginate total="${employeeInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
