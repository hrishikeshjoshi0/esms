<g:set var="liftInfoInstance" value="${organizationInstance?.liftInfo}" />
<dl class="dl-horizontal">

	<dt>
		<g:message code="liftInfo.liftMake.label" default="Lift Make" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="liftMake" />
	</dd>


	<dt>
		<g:message code="liftInfo.liftControlSystem.label"
			default="Lift Control System" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="liftControlSystem" />
	</dd>


	<dt>
		<g:message code="liftInfo.lastServiceProvider.label"
			default="Last Service Provider" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="lastServiceProvider" />
	</dd>


	<dt>
		<g:message code="liftInfo.lastContractEndDate.label"
			default="Last Contract End Date" />
	</dt>

	<dd>
		<g:formatDate date="${liftInfoInstance?.lastContractEndDate}" />
	</dd>


	<dt>
		<g:message code="liftInfo.typeOfEnquiry.label"
			default="Type Of Enquiry" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="typeOfEnquiry" />
	</dd>


	<dt>
		<g:message code="liftInfo.buildingType.label" default="Building Type" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="buildingType" />
	</dd>


	<dt>
		<g:message code="liftInfo.gateType.label" default="Gate Type" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="gateType" />
	</dd>


	<dt>
		<g:message code="liftInfo.retiringCamType.label"
			default="Retiring Cam Type" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="retiringCamType" />
	</dd>


	<dt>
		<g:message code="liftInfo.lockType.label" default="Lock Type" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="lockType" />
	</dd>


	<dt>
		<g:message code="liftInfo.drive.label" default="Drive" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="drive" />
	</dd>


	<dt>
		<g:message code="liftInfo.driveCapacity.label"
			default="Drive Capacity" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="driveCapacity" />
	</dd>


	<dt>
		<g:message code="liftInfo.driveMake.label" default="Drive Make" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="driveMake" />
	</dd>


	<dt>
		<g:message code="liftInfo.noOfFloors.label" default="No Of Floors" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="noOfFloors" />
	</dd>


	<dt>
		<g:message code="liftInfo.numberOfLifts.label"
			default="Number Of Lifts" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="numberOfLifts" />
	</dd>


	<dt>
		<g:message code="liftInfo.servicePeriod.label"
			default="Service Period" />
	</dt>

	<dd>
		<g:fieldValue bean="${liftInfoInstance}" field="servicePeriod" />
	</dd>


</dl>