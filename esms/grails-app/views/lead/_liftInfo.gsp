<div class="pull-right">
	<g:if test="${organizationInstance?.liftInfo}">
		<a href="<g:createLink controller="liftInfo" action="edit" id="${organizationInstance?.liftInfo?.id}" />"
			role="button" class="btn btn-sm btn-default"> 
			Edit Lift Information
		</a>
	</g:if>
	<g:else>
		<a href="<g:createLink controller="liftInfo" action="create" params="['organization.id':organizationInstance.id]" />"
			role="button" class="btn btn-sm btn-default"> 
			Add Lift Information
		</a>
	</g:else>
</div>

<g:set var="liftInfoInstance" value="${organizationInstance?.liftInfo}" />
<div class="table-responsive">
	<table class="table table-striped table-condensed table-bordered">
		<tr>
			<td><g:message code="liftInfo.typeOfEnquiry.label"
					default="Type Of Enquiry" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="typeOfEnquiry" /></td>

			<td><g:message code="liftInfo.lockType.label"
					default="Lock Type" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="lockType" />
			</td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.liftMake.label"
					default="Lift Make" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="liftMake" />
			</td>

			<td><g:message code="liftInfo.liftControlSystem.label"
					default="Lift Control System" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="liftControlSystem" /></td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.lastServiceProvider.label"
					default="Last Service Provider" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="lastServiceProvider" /></td>

			<td><g:message code="liftInfo.lastContractEndDate.label"
					default="Last Contract End Date" /></td>

			<td><g:formatDate
					date="${liftInfoInstance?.lastContractEndDate}" /></td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.buildingType.label"
					default="Building Type" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="buildingType" /></td>


			<td><g:message code="liftInfo.gateType.label"
					default="Gate Type" /></td>

			<g:if test="${liftInfoInstance?.gateType == 'OTHER'}">
				<td><g:message code="liftInfo.gateTypeOther.label"
						default="Gate Type (Other)" /></td>

				<td><g:fieldValue bean="${liftInfoInstance}"
						field="gateTypeOther" /></td>
			</g:if>
			<g:else>
				<td><g:fieldValue bean="${liftInfoInstance}" field="gateType" />
			</td>	
			</g:else>
		</tr>

		<tr>
			<td><g:message code="liftInfo.drive.label" default="Drive" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="drive" /></td>

			<td><g:message code="liftInfo.retiringCamType.label"
					default="Retiring Cam Type" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="retiringCamType" /></td>
		</tr>

		<g:if test="${liftInfoInstance?.drive == 'YES'}">
			<tr>
				<td><g:message code="liftInfo.driveCapacity.label"
						default="Drive Capacity" /></td>

				<td><g:fieldValue bean="${liftInfoInstance}"
						field="driveCapacity" /></td>

				<td><g:message code="liftInfo.driveSerialNumber.label"
						default="Drive Serial Number" /></td>

				<td><g:fieldValue bean="${liftInfoInstance}"
						field="driveSerialNumber" /></td>
			</tr>
		</g:if>

		<tr>
			<td><g:message code="liftInfo.buildingOpening.label"
					default="Building Opening" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="buildingOpening" /></td>


			<td><g:message code="liftInfo.carCapacity.label"
					default="Car Capacity" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="carCapacity" />
			</td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.typeOfElevator.label"
					default="Type Of Elevator" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="typeOfElevator" /></td>

			<td><g:message code="liftInfo.motorHP.label" default="Motor HP" />
			</td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="motorHP" />
			</td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.motorCurrent.label"
					default="Motor Current" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="motorCurrent" /></td>


			<td><g:message code="liftInfo.motorRpm.label"
					default="Motor Rpm" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="motorRpm" />
			</td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.governerSpeed.label"
					default="Governer Speed" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="governerSpeed" /></td>


			<td><g:message code="liftInfo.trippingSpeed.label"
					default="Tripping Speed" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="trippingSpeed" /></td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.machineMake.label"
					default="Machine Make" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="machineMake" />
			</td>


			<td><g:message code="liftInfo.pulleyDiameter.label"
					default="Pulley Diameter" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="pulleyDiameter" /></td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.numberOfGrooves.label"
					default="Number Of Grooves" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="numberOfGrooves" /></td>


			<td><g:message code="liftInfo.ropeSize.label"
					default="Rope Size" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="ropeSize" />
			</td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.numberOfRopes.label"
					default="Number Of Ropes" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="numberOfRopes" /></td>


			<td><g:message code="liftInfo.driveMake.label"
					default="Drive Make" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="driveMake" />
			</td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.noOfFloors.label"
					default="No Of Floors" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}" field="noOfFloors" />
			</td>


			<td><g:message code="liftInfo.numberOfLifts.label"
					default="Number Of Lifts" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="numberOfLifts" /></td>
		</tr>

		<tr>
			<td><g:message code="liftInfo.organization.label"
					default="Organization" /></td>

			<td><g:link controller="organization" action="show"
					id="${liftInfoInstance?.organization?.id}">
					${liftInfoInstance?.organization?.name}
				</g:link></td>


			<td><g:message code="liftInfo.servicePeriod.label"
					default="Service Period" /></td>

			<td><g:fieldValue bean="${liftInfoInstance}"
					field="servicePeriod" /></td>
		</tr>
	</table>
</div>