

<%@ page import="com.esms.model.party.Employee"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
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

			<g:form>
				<g:hiddenField name="id" value="${employeeInstance?.id}" />
				<div class="form-actions">
					<%--<g:link class="btn" action="edit" id="${employeeInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					--%>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

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
					<g:fieldValue bean="${employeeInstance}" field="previousExperience" />
				</dd>


				<dt>
					<g:message code="employee.salary.label" default="Salary" />
				</dt>

				<dd>
					<g:fieldValue bean="${employeeInstance}" field="salary" />
				</dd>
				
				<dt>
					<g:message code="employee.employmentStartDate.label" default="Employment Start Date" />
				</dt>

				<dd>
					<g:fieldValue bean="${employeeInstance}" field="employmentStartDate" />
				</dd>
				
				<dt>
					<g:message code="employee.employmentEndDate.label" default="Employment End Date" />
				</dt>

				<dd>
					<g:fieldValue bean="${employeeInstance}" field="employmentEndDate" />
				</dd>


				<dt>
					<g:message code="employee.benefits.label" default="Benefits" />
				</dt>

				<dd>
					<g:fieldValue bean="${employeeInstance}" field="benefits" />
				</dd>


				<dt>
					<g:message code="employee.skillLevel.label" default="Skill Level" />
				</dt>

				<dd>
					<g:fieldValue bean="${employeeInstance}" field="skillLevel" />
				</dd>
			</dl>
			
			<div class="span12">
			
			<!--  -->
			<ul class="nav nav-tabs" id="organization_show_tab">
			  <li class="active"><a href="#addressesTabsPane" data-toggle="tab">Addresses</a></li>
			  <li><a href="#phonesTabsPane" data-toggle="tab">Phones</a></li>
			</ul>
			 
			<div class="tab-content">
			  <div class="tab-pane active" id="addressesTabsPane">
			  	<g:render template="addressList" />
			  </div>
			  <div class="tab-pane" id="phonesTabsPane">
			  	<g:render template="phoneBookList" />
			  </div>
			</div> 
		</div>
	</div>
</body>
</html>
