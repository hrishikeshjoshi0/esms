

<%@ page import="com.esms.model.maintenance.LiftInfo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'liftInfo.label', default: 'LiftInfo')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:message code="default.show.label" args="[entityName]" />
				</h3>
			</div>
			
			<g:form>
				<g:hiddenField name="id" value="${liftInfoInstance?.id}" />
				<div class="form-group">
					<g:link class="btn btn-default btn-sm" action="edit" id="${liftInfoInstance?.id}">
						
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-sm btn-danger" type="submit" name="_action_delete">
						
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
						
				
							<dt><g:message code="liftInfo.driveSerialNumber.label" default="Drive Serial Number" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="driveSerialNumber"/></dd>
						
				
							<dt><g:message code="liftInfo.buildingOpening.label" default="Building Opening" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="buildingOpening"/></dd>
						
				
							<dt><g:message code="liftInfo.carCapacity.label" default="Car Capacity" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="carCapacity"/></dd>
						
				
							<dt><g:message code="liftInfo.typeOfElevator.label" default="Type Of Elevator" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="typeOfElevator"/></dd>
						
				
							<dt><g:message code="liftInfo.motorHP.label" default="Motor HP" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="motorHP"/></dd>
						
				
							<dt><g:message code="liftInfo.motorCurrent.label" default="Motor Current" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="motorCurrent"/></dd>
						
				
							<dt><g:message code="liftInfo.motorRpm.label" default="Motor Rpm" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="motorRpm"/></dd>
						
				
							<dt><g:message code="liftInfo.governerSpeed.label" default="Governer Speed" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="governerSpeed"/></dd>
						
				
							<dt><g:message code="liftInfo.trippingSpeed.label" default="Tripping Speed" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="trippingSpeed"/></dd>
						
				
							<dt><g:message code="liftInfo.machineMake.label" default="Machine Make" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="machineMake"/></dd>
						
				
							<dt><g:message code="liftInfo.pulleyDiameter.label" default="Pulley Diameter" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="pulleyDiameter"/></dd>
						
				
							<dt><g:message code="liftInfo.numberOfGrooves.label" default="Number Of Grooves" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="numberOfGrooves"/></dd>
						
				
							<dt><g:message code="liftInfo.ropeSize.label" default="Rope Size" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="ropeSize"/></dd>
						
				
							<dt><g:message code="liftInfo.numberOfRopes.label" default="Number Of Ropes" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="numberOfRopes"/></dd>
						
				
							<dt><g:message code="liftInfo.driveMake.label" default="Drive Make" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="driveMake"/></dd>
						
				
							<dt><g:message code="liftInfo.noOfFloors.label" default="No Of Floors" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="noOfFloors"/></dd>
						
				
							<dt><g:message code="liftInfo.numberOfLifts.label" default="Number Of Lifts" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="numberOfLifts"/></dd>
						
				
							<dt><g:message code="liftInfo.organization.label" default="Organization" /></dt>
						
							<dd><g:link controller="organization" action="show" id="${liftInfoInstance?.organization?.id}">${liftInfoInstance?.organization?.name}</g:link></dd>
						
				
							<dt><g:message code="liftInfo.servicePeriod.label" default="Service Period" /></dt>
						
							<dd><g:fieldValue bean="${liftInfoInstance}" field="servicePeriod"/></dd>
						
				
			</dl>
		</div>
	</div>
</body>
</html>
