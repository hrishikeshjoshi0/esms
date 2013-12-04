<%@ page import="com.esms.model.sales.Contract"%>



<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'contractNumber', 'error')} required">
	<label for="contractNumber" class="col-lg-2 control-label"><g:message
			code="contract.contractNumber.label" default="Contract Number" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:textField name="contractNumber" required=""
			value="${contractInstance?.contractNumber}" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'contractNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'organization.id', 'error')} required">
	<label for="organization.id" class="col-lg-2 control-label"><g:message
			code="quote.organization.id.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:select name="organization.id" value="${contractInstance?.organization?.id}" from="${Organization.list()}"
			optionKey="id" optionValue="name"/>
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'status', 'error')} ">
	<label for="status" class="col-lg-2 control-label"><g:message
			code="contract.status.label" default="Status" /></label>
	<div class="col-lg-10">
		<g:select name="status"
			from="${contractInstance.constraints.status.inList}"
			value="${contractInstance?.status}"
			valueMessagePrefix="contract.status" noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'fromDate', 'error')} required">
	<label for="fromDate" class="col-lg-2 control-label"><g:message
			code="contract.fromDate.label" default="From Date" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:datePicker name="fromDate" value="${contractInstance?.fromDate}" precision="day"/>
		<%--<bootstrap:jqDatePicker name="fromDate"
			value="${contractInstance?.fromDate}" />
		--%>
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'fromDate', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'toDate', 'error')} required">
	<label for="toDate" class="col-lg-2 control-label"><g:message
			code="contract.toDate.label" default="To Date" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:datePicker name="toDate" value="${contractInstance?.toDate}" precision="day"/>
		<%--<bootstrap:jqDatePicker name="toDate"
			value="${contractInstance?.toDate}" />
		--%>
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'toDate', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'invoicingIsFixedPrice', 'error')} ">
	<label for="invoicingIsFixedPrice" class="col-lg-2 control-label"><g:message
			code="contract.invoicingIsFixedPrice.label"
			default="Invoicing Is Fixed Price" /></label>
	<div class="col-lg-10">
		<g:checkBox name="invoicingIsFixedPrice"
			value="${contractInstance?.invoicingIsFixedPrice}" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'invoicingIsFixedPrice', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'invoicingIsTimesheets', 'error')} ">
	<label for="invoicingIsTimesheets" class="col-lg-2 control-label"><g:message
			code="contract.invoicingIsTimesheets.label"
			default="Invoicing Is Timesheets" /></label>
	<div class="col-lg-10">
		<g:checkBox name="invoicingIsTimesheets"
			value="${contractInstance?.invoicingIsTimesheets}" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'invoicingIsTimesheets', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'invoicingIsExpenses', 'error')} ">
	<label for="invoicingIsExpenses" class="col-lg-2 control-label"><g:message
			code="contract.invoicingIsExpenses.label"
			default="Invoicing Is Expenses" /></label>
	<div class="col-lg-10">
		<g:checkBox name="invoicingIsExpenses"
			value="${contractInstance?.invoicingIsExpenses}" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'invoicingIsExpenses', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo" class="col-lg-2 control-label"><g:message
			code="contract.assignedTo.label" default="Assigned To" /></label>
	<div class="col-lg-10">
		<g:textField name="assignedTo" value="${contractInstance?.assignedTo}" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'assignedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'status', 'error')} ">
	<label for="status" class="col-lg-2 control-label"><g:message
			code="contract.status.label" default="Status" /></label>
	<div class="col-lg-10">
		<g:select name="status"
			from="${contractInstance.constraints.status.inList}"
			value="${contractInstance?.status}"
			valueMessagePrefix="contract.status" noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'relatedTo', 'error')} ">
	<label for="relatedTo" class="col-lg-2 control-label"><g:message
			code="contract.relatedTo.label" default="Related To" /></label>
	<div class="col-lg-10">
		<g:select name="relatedTo"
			from="${contractInstance.constraints.relatedTo.inList}"
			value="${contractInstance?.relatedTo}"
			valueMessagePrefix="contract.relatedTo" noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'relatedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'relatedToValue', 'error')} ">
	<label for="relatedToValue" class="col-lg-2 control-label"><g:message
			code="contract.relatedToValue.label" default="Related To Value" /></label>
	<div class="col-lg-10">
		<g:textField name="relatedToValue" value="${contractInstance?.relatedToValue}" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'relatedToValue', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'description', 'error')} ">
	<label for="description" class="col-lg-2 control-label"><g:message
			code="contract.description.label" default="Description" /></label>
	<div class="col-lg-10">
		<g:textArea name="description" rows="5" cols="10"
			value="${contractInstance?.description}" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'description', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: contractInstance, field: 'termsAndConditions', 'error')} ">
	<label for="termsAndConditions" class="col-lg-2 control-label"><g:message
			code="contract.termsAndConditions.label"
			default="Terms And Conditions" /></label>
	<div class="col-lg-10">
		<g:textArea name="termsAndConditions" rows="5" cols="10"
			value="${contractInstance?.termsAndConditions}" />
		<span class="help-inline"> ${hasErrors(bean: contractInstance, field: 'termsAndConditions', 'error')}
		</span>
	</div>
</div>

