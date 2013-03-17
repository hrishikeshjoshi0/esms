<%@ page import="com.esms.model.maintenance.LiftInfo" %>



			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'liftMake', 'error')} ">
				<label for="liftMake" class="control-label"><g:message code="liftInfo.liftMake.label" default="Lift Make" /></label>
				<div class="controls">
					<g:textField name="liftMake" value="${liftInfoInstance?.liftMake}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'liftMake', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'liftControlSystem', 'error')} ">
				<label for="liftControlSystem" class="control-label"><g:message code="liftInfo.liftControlSystem.label" default="Lift Control System" /></label>
				<div class="controls">
					<g:textField name="liftControlSystem" value="${liftInfoInstance?.liftControlSystem}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'liftControlSystem', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'lastServiceProvider', 'error')} ">
				<label for="lastServiceProvider" class="control-label"><g:message code="liftInfo.lastServiceProvider.label" default="Last Service Provider" /></label>
				<div class="controls">
					<g:textField name="lastServiceProvider" value="${liftInfoInstance?.lastServiceProvider}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'lastServiceProvider', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'lastContractEndDate', 'error')} ">
				<label for="lastContractEndDate" class="control-label"><g:message code="liftInfo.lastContractEndDate.label" default="Last Contract End Date" /></label>
				<div class="controls">
					<bootstrap:jqDatePicker name="lastContractEndDate"  value="${liftInfoInstance?.lastContractEndDate}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'lastContractEndDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'typeOfEnquiry', 'error')} ">
				<label for="typeOfEnquiry" class="control-label"><g:message code="liftInfo.typeOfEnquiry.label" default="Type Of Enquiry" /></label>
				<div class="controls">
					<g:select name="typeOfEnquiry" from="${liftInfoInstance.constraints.typeOfEnquiry.inList}" value="${liftInfoInstance?.typeOfEnquiry}" valueMessagePrefix="liftInfo.typeOfEnquiry" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'typeOfEnquiry', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'buildingType', 'error')} ">
				<label for="buildingType" class="control-label"><g:message code="liftInfo.buildingType.label" default="Building Type" /></label>
				<div class="controls">
					<g:select name="buildingType" from="${liftInfoInstance.constraints.buildingType.inList}" value="${liftInfoInstance?.buildingType}" valueMessagePrefix="liftInfo.buildingType" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'buildingType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'gateType', 'error')} ">
				<label for="gateType" class="control-label"><g:message code="liftInfo.gateType.label" default="Gate Type" /></label>
				<div class="controls">
					<g:select name="gateType" from="${liftInfoInstance.constraints.gateType.inList}" value="${liftInfoInstance?.gateType}" valueMessagePrefix="liftInfo.gateType" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'gateType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'retiringCamType', 'error')} ">
				<label for="retiringCamType" class="control-label"><g:message code="liftInfo.retiringCamType.label" default="Retiring Cam Type" /></label>
				<div class="controls">
					<g:select name="retiringCamType" from="${liftInfoInstance.constraints.retiringCamType.inList}" value="${liftInfoInstance?.retiringCamType}" valueMessagePrefix="liftInfo.retiringCamType" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'retiringCamType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'lockType', 'error')} ">
				<label for="lockType" class="control-label"><g:message code="liftInfo.lockType.label" default="Lock Type" /></label>
				<div class="controls">
					<g:select name="lockType" from="${liftInfoInstance.constraints.lockType.inList}" value="${liftInfoInstance?.lockType}" valueMessagePrefix="liftInfo.lockType" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'lockType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'drive', 'error')} ">
				<label for="drive" class="control-label"><g:message code="liftInfo.drive.label" default="Drive" /></label>
				<div class="controls">
					<g:textField name="drive" value="${liftInfoInstance?.drive}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'drive', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'driveCapacity', 'error')} ">
				<label for="driveCapacity" class="control-label"><g:message code="liftInfo.driveCapacity.label" default="Drive Capacity" /></label>
				<div class="controls">
					<g:textField name="driveCapacity" value="${liftInfoInstance?.driveCapacity}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'driveCapacity', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'driveMake', 'error')} ">
				<label for="driveMake" class="control-label"><g:message code="liftInfo.driveMake.label" default="Drive Make" /></label>
				<div class="controls">
					<g:textField name="driveMake" value="${liftInfoInstance?.driveMake}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'driveMake', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'noOfFloors', 'error')} required">
				<label for="noOfFloors" class="control-label"><g:message code="liftInfo.noOfFloors.label" default="No Of Floors" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="noOfFloors" required="" value="${liftInfoInstance.noOfFloors}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'noOfFloors', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'numberOfLifts', 'error')} required">
				<label for="numberOfLifts" class="control-label"><g:message code="liftInfo.numberOfLifts.label" default="Number Of Lifts" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="numberOfLifts" required="" value="${liftInfoInstance.numberOfLifts}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'numberOfLifts', 'error')}</span>
				</div>
			</div>

			<%--<div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'organization', 'error')} required">
				<label for="organization" class="control-label"><g:message code="liftInfo.organization.label" default="Organization" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="organization" name="organization.id" from="${com.esms.model.party.Organization.list()}" optionKey="id" required="" value="${liftInfoInstance?.organization?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'organization', 'error')}</span>
				</div>
			</div>

			--%><div class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'servicePeriod', 'error')} ">
				<label for="servicePeriod" class="control-label"><g:message code="liftInfo.servicePeriod.label" default="Service Period" /></label>
				<div class="controls">
					<g:textField name="servicePeriod" value="${liftInfoInstance?.servicePeriod}"/>
					<span class="help-inline">${hasErrors(bean: liftInfoInstance, field: 'servicePeriod', 'error')}</span>
				</div>
			</div>

