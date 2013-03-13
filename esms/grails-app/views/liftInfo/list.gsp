
<%@ page import="com.esms.model.maintenance.LiftInfo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'liftInfo.label', default: 'LiftInfo')}" />
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
						
							<g:sortableColumn property="liftMake" title="${message(code: 'liftInfo.liftMake.label', default: 'Lift Make')}" />
						
							<g:sortableColumn property="liftControlSystem" title="${message(code: 'liftInfo.liftControlSystem.label', default: 'Lift Control System')}" />
						
							<g:sortableColumn property="lastServiceProvider" title="${message(code: 'liftInfo.lastServiceProvider.label', default: 'Last Service Provider')}" />
						
							<g:sortableColumn property="lastContractEndDate" title="${message(code: 'liftInfo.lastContractEndDate.label', default: 'Last Contract End Date')}" />
						
							<g:sortableColumn property="typeOfEnquiry" title="${message(code: 'liftInfo.typeOfEnquiry.label', default: 'Type Of Enquiry')}" />
						
							<g:sortableColumn property="noOfFloors" title="${message(code: 'liftInfo.noOfFloors.label', default: 'No Of Floors')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${liftInfoInstanceList}" var="liftInfoInstance">
						<tr>
						
							<td>${fieldValue(bean: liftInfoInstance, field: "liftMake")}</td>
						
							<td>${fieldValue(bean: liftInfoInstance, field: "liftControlSystem")}</td>
						
							<td>${fieldValue(bean: liftInfoInstance, field: "lastServiceProvider")}</td>
						
							<td><g:formatDate date="${liftInfoInstance.lastContractEndDate}" /></td>
						
							<td>${fieldValue(bean: liftInfoInstance, field: "typeOfEnquiry")}</td>
						
							<td>${fieldValue(bean: liftInfoInstance, field: "noOfFloors")}</td>
						
							<td class="link">
								<g:link action="show" id="${liftInfoInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${liftInfoInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>