

<%@ page import="com.esms.model.maintenance.LiftInfo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'liftInfo.label', default: 'LiftInfo')}" />
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
				<g:hiddenField name="id" value="${liftInfoInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${liftInfoInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">
				
							<dt><g:message code="liftInfo.liftMake.label" default="Lift Make" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="liftMake"/></dd>
						
				
							<dt><g:message code="liftInfo.liftControlSystem.label" default="Lift Control System" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="liftControlSystem"/></dd>
						
				
							<dt><g:message code="liftInfo.lastServiceProvider.label" default="Last Service Provider" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="lastServiceProvider"/></dd>
						
				
							<dt><g:message code="liftInfo.lastContractEndDate.label" default="Last Contract End Date" /></dt>
						
							<dd><g:formatDate date="${liftInfoInstance?.lastContractEndDate}" /></dd>
						
				
							<dt><g:message code="liftInfo.typeOfEnquiry.label" default="Type Of Enquiry" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="typeOfEnquiry"/></dd>
						
				
							<dt><g:message code="liftInfo.buildingType.label" default="Building Type" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="buildingType"/></dd>
						
				
							<dt><g:message code="liftInfo.gateType.label" default="Gate Type" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="gateType"/></dd>
						
				
							<dt><g:message code="liftInfo.retiringCamType.label" default="Retiring Cam Type" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="retiringCamType"/></dd>
						
				
							<dt><g:message code="liftInfo.lockType.label" default="Lock Type" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="lockType"/></dd>
						
				
							<dt><g:message code="liftInfo.drive.label" default="Drive" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="drive"/></dd>
						
				
							<dt><g:message code="liftInfo.driveCapacity.label" default="Drive Capacity" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="driveCapacity"/></dd>
						
				
							<dt><g:message code="liftInfo.driveMake.label" default="Drive Make" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="driveMake"/></dd>
						
				
							<dt><g:message code="liftInfo.noOfFloors.label" default="No Of Floors" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="noOfFloors"/></dd>
						
				
							<dt><g:message code="liftInfo.numberOfLifts.label" default="Number Of Lifts" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="numberOfLifts"/></dd>
						
				
							<dt><g:message code="liftInfo.organization.label" default="Organization" /></dt>
						
							<dd><g:link controller="organization" action="show" id="${liftInfoInstance?.organization?.id}">${liftInfoInstance?.organization?.encodeAsHTML()}</g:link></dd>
						
				
							<dt><g:message code="liftInfo.servicePeriod.label" default="Service Period" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="servicePeriod"/></dd>
						
				
			</dl>
		</div>
	</div>
</body>
</html>
