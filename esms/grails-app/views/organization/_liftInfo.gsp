<g:set var="liftInfoInstance" value="${organizationInstance?.liftInfo}"/>
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
		<g:message code="liftInfo.organization.label" default="Organization" />
	</dt>

	<dd>
		<g:link controller="organization" action="show"
			id="${liftInfoInstance?.organization?.id}">
			${liftInfoInstance?.organization?.encodeAsHTML()}
		</g:link>
	</dd>


</dl>