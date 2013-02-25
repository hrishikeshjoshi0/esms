<%@ page import="com.esms.model.maintenance.LiftInfo"%>


<div
	class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'liftMake', 'error')} ">
	<label for="liftMake" class="control-label"><g:message
			code="liftInfo.liftMake.label" default="Lift Make" /></label>
	<div class="controls">
		<g:textField name="liftMake" value="${liftInfoInstance?.liftMake}" />
		<span class="help-inline">
			${hasErrors(bean: liftInfoInstance, field: 'liftMake', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'liftControlSystem', 'error')} ">
	<label for="liftControlSystem" class="control-label"><g:message
			code="liftInfo.liftControlSystem.label" default="Lift Control System" /></label>
	<div class="controls">
		<g:textField name="liftControlSystem"
			value="${liftInfoInstance?.liftControlSystem}" />
		<span class="help-inline">
			${hasErrors(bean: liftInfoInstance, field: 'liftControlSystem', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'lastServiceProvider', 'error')} ">
	<label for="lastServiceProvider" class="control-label"><g:message
			code="liftInfo.lastServiceProvider.label"
			default="Last Service Provider" /></label>
	<div class="controls">
		<g:textField name="lastServiceProvider"
			value="${liftInfoInstance?.lastServiceProvider}" />
		<span class="help-inline">
			${hasErrors(bean: liftInfoInstance, field: 'lastServiceProvider', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'lastContractEndDate', 'error')} ">
	<label for="lastContractEndDate" class="control-label"><g:message
			code="liftInfo.lastContractEndDate.label"
			default="Last Contract End Date" /></label>
	<div class="controls">
		<g:datePicker name="lastContractEndDate"
			value="${liftInfoInstance?.lastContractEndDate}" precision="day"/>
		<span class="help-inline">
			${hasErrors(bean: liftInfoInstance, field: 'lastContractEndDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'typeOfEnquiry', 'error')} ">
	<label for="typeOfEnquiry" class="control-label"><g:message
			code="liftInfo.typeOfEnquiry.label" default="Type Of Enquiry" /></label>
	<div class="controls">
		<g:select name="typeOfEnquiry"
			from="${liftInfoInstance.constraints.typeOfEnquiry.inList}"
			value="${liftInfoInstance?.typeOfEnquiry}"
			valueMessagePrefix="liftInfo.typeOfEnquiry" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: liftInfoInstance, field: 'typeOfEnquiry', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'noOfFloors', 'error')} required">
	<label for="noOfFloors" class="control-label"><g:message
			code="liftInfo.noOfFloors.label" default="No Of Floors" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="noOfFloors" required=""
			value="${liftInfoInstance.noOfFloors}" />
		<span class="help-inline">
			${hasErrors(bean: liftInfoInstance, field: 'noOfFloors', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'numberOfLifts', 'error')} required">
	<label for="numberOfLifts" class="control-label"><g:message
			code="liftInfo.numberOfLifts.label" default="Number Of Lifts" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="numberOfLifts" required=""
			value="${liftInfoInstance.numberOfLifts}" />
		<span class="help-inline">
			${hasErrors(bean: liftInfoInstance, field: 'numberOfLifts', 'error')}
		</span>
	</div>
</div>

<%--<div
	class="control-group fieldcontain ${hasErrors(bean: liftInfoInstance, field: 'organization', 'error')} required">
	<label for="organization" class="control-label"><g:message
			code="liftInfo.organization.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select id="organization" name="organization.id"
			from="${com.esms.model.party.Organization.list()}" optionKey="id"
			required="" value="${liftInfoInstance?.organization?.id}"
			class="many-to-one" />
		<span class="help-inline">
			${hasErrors(bean: liftInfoInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>
--%>