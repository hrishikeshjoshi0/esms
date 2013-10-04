
<%@ page import="com.esms.model.party.Employee"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<filterpane:currentCriteria
				domainBean="com.esms.model.party.Employee" removeImgDir="images"
				removeImgFile="skin/database_delete.png"
				fullAssociationPathFieldNames="no" />

			<div class="slidingDiv">
				<div class="page-header">
					<h1>Search</h1>
				</div>
				<fieldset>
					<filterpane:filterPane domain="com.esms.model.party.Employee"
						filterProperties="${['firstName', 'lastName']}"
						titleKey="default.filterPane.header" dialog="false" visible="y"
						showSortPanel="n" showTitle="n"
						fullAssociationPathFieldNames="false" />
				</fieldset>
			</div>

			<div class="page-header">
				<h1>
					<g:message code="default.list.label" args="[entityName]" />
				</h1>
			</div>

			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<g:sortableColumn property="firstName"
							title="${message(code: 'employee.firstName.label', default: 'First Name')}" />

						<g:sortableColumn property="lastName"
							title="${message(code: 'employee.lastName.label', default: 'Last Name')}" />

						<g:sortableColumn property="middleName"
							title="${message(code: 'employee.middleName.label', default: 'Middle Name')}" />

						<g:sortableColumn property="previousExperience"
							title="${message(code: 'employee.previousExperience.label', default: 'Previous Experience')}" />

						<g:sortableColumn property="salary"
							title="${message(code: 'employee.salary.label', default: 'Salary')}" />

						<g:sortableColumn property="benefits"
							title="${message(code: 'employee.benefits.label', default: 'Benefits')}" />
							
						<g:sortableColumn property="employmentStartDate"
							title="${message(code: 'employee.employmentStartDate.label', default: 'Employment Start Date')}" />
							
						<g:sortableColumn property="employmentEndDate"
							title="${message(code: 'employee.employmentEndDate.label', default: 'Employment End Date')}" />		

						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${employeeInstanceList}" var="employeeInstance">
						<tr>

							<td>
								${fieldValue(bean: employeeInstance, field: "firstName")}
							</td>

							<td>
								${fieldValue(bean: employeeInstance, field: "lastName")}
							</td>

							<td>
								${fieldValue(bean: employeeInstance, field: "middleName")}
							</td>

							<td>
								${fieldValue(bean: employeeInstance, field: "previousExperience")}
							</td>

							<td>
								${fieldValue(bean: employeeInstance, field: "salary")}
							</td>

							<td>
								${fieldValue(bean: employeeInstance, field: "benefits")}
							</td>

							<td>
								${fieldValue(bean: employeeInstance, field: "employmentStartDate")}
							</td>
							
							<td>
								${fieldValue(bean: employeeInstance, field: "employmentEndDate")}
							</td>

							<td class="link"><g:link action="show"
									id="${employeeInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<bootstrap:paginate total="${employeeInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
