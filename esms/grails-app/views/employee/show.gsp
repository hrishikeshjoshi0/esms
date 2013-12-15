

<%@ page import="com.esms.model.party.Employee"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
<title>Employee::${employeeInstance?.externalId}
</title>

</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Employee:
					${employeeInstance?.externalId}
				</h3>
				<h4>
					${employeeInstance?.lastName},
					${employeeInstance?.firstName}
				</h4>
			</div>

			<div class="well">
				<g:form>
					<g:hiddenField name="id" value="${employeeInstance?.id}" />
					<div class="form-group">
						<g:link class="btn btn-default btn-sm" action="edit"
							id="${employeeInstance?.id}">

							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>

						<button class="btn btn-sm btn-default" type="submit"
							name="_action_delete">
							<g:message code="default.button.delete.label" default="Delete" />
						</button>

						<g:link class="btn btn-default btn-sm" action="markAsTerminated"
							id="${employeeInstance?.id}">

							<g:message code="default.button.markAsTerminated.label"
								default="Mark as Terminated" />
						</g:link>
					</div>
				</g:form>
			</div>


			<div class="panel panel-default">
				<div class="panel-body">
					<dl class="dl-horizontal">
						<dt>
							<g:message code="employee.firstName.label" default="First Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${employeeInstance}" field="firstName" />
						</dd>


						<dt>
							<g:message code="employee.lastName.label" default="Last Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${employeeInstance}" field="lastName" />
						</dd>


						<dt>
							<g:message code="employee.middleName.label" default="Middle Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${employeeInstance}" field="middleName" />
						</dd>


						<dt>
							<g:message code="employee.previousExperience.label"
								default="Previous Experience" />
						</dt>

						<dd>
							<g:fieldValue bean="${employeeInstance}"
								field="previousExperience" />
						</dd>


						<dt>
							<g:message code="employee.salary.label" default="Salary" />
						</dt>

						<dd>
							<g:fieldValue bean="${employeeInstance}" field="salary" />
						</dd>

						<dt>
							<g:message code="employee.employmentStartDate.label"
								default="Employment Start Date" />
						</dt>

						<dd>
							<g:fieldValue bean="${employeeInstance}"
								field="employmentStartDate" />
						</dd>

						<dt>
							<g:message code="employee.employmentEndDate.label"
								default="Employment End Date" />
						</dt>

						<dd>
							<g:fieldValue bean="${employeeInstance}"
								field="employmentEndDate" />
						</dd>

						<dt>
							<g:message code="employee.skillLevel.label" default="Skill Level" />
						</dt>

						<dd>
							<g:fieldValue bean="${employeeInstance}" field="skillLevel" />
						</dd>
					</dl>
				</div>
			</div>
		</div>


		<div class="col-md-12">
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Addresses" />
					<richui:tabLabel title="Phones" />
					<richui:tabLabel title="Benefits" />
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render template="addressList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="phoneBookList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="benefits" />
					</richui:tabContent>
				</richui:tabContents>
			</richui:tabView>
		</div>

	</div>
</body>
</html>
