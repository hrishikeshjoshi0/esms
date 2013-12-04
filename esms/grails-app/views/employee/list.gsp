
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

						<g:sortableColumn params="${filterParams}" property="middleName"
							title="${message(code: 'employee.middleName.label', default: 'Middle Name')}" />

						<g:sortableColumn params="${filterParams}" property="previousExperience"
							title="${message(code: 'employee.previousExperience.label', default: 'Previous Experience')}" />

						<g:sortableColumn params="${filterParams}" property="salary"
							title="${message(code: 'employee.salary.label', default: 'Salary')}" />

						<g:sortableColumn params="${filterParams}" property="benefits"
							title="${message(code: 'employee.benefits.label', default: 'Benefits')}" />
							
						<g:sortableColumn params="${filterParams}" property="employmentStartDate"
							title="${message(code: 'employee.employmentStartDate.label', default: 'Employment Start Date')}" />
							
						<g:sortableColumn params="${filterParams}" property="employmentEndDate"
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
									id="${employeeInstance.id}" class="btn btn-default btn-xs">Show &raquo;</g:link>
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
