<%@ page import="com.esms.model.quote.Quote"%>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'organization', 'error')} required">
	<label for="organization" class="control-label"><g:message
			code="quote.organization.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:hiddenField name="organization.id"
			value="${quoteInstance?.organization?.id}" />
		<richui:autoComplete name="organizationId"
			onItemSelect="document.getElementById('organization.id').value=id;"
			action="${createLinkTo('dir': 'organization/searchAJAX')}"
			forceSelection="true" typeAhead="true" shadow="true"
			minQueryLength="2" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteNumber', 'error')} required">
	<label for="quoteNumber" class="control-label"><g:message
			code="quote.quoteNumber.label" default="Quote Number" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="quoteNumber" required="" readonly="readonly"
			value="${quoteInstance?.quoteNumber}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quoteNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteName', 'error')} required">
	<label for="quoteName" class="control-label"><g:message
			code="quote.quoteName.label" default="Quote Name" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="quoteName" required="" class="input-xxlarge"
			value="${quoteInstance?.quoteName}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quoteName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'status', 'error')} ">
	<label for="status" class="control-label"><g:message
			code="quote.status.label" default="Status" /></label>
	<div class="controls">
		<g:select name="status" readOnly="readOnly"
			from="${quoteInstance.constraints.status.inList}"
			value="${quoteInstance?.status}" valueMessagePrefix="quote.status"
			noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'type', 'error')} required">
	<label for="type" class="control-label"><g:message
			code="quote.type.label" default="Type" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select name="type" from="${quoteInstance.constraints.type.inList}"
			value="${quoteInstance?.type}" valueMessagePrefix="quote.type"
			noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'type', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'salesChannel', 'error')} required">
	<label for="salesChannel" class="control-label"><g:message
			code="quote.salesChannel.label" default="Sales Channel" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="salesChannel" required=""
			value="${quoteInstance?.salesChannel}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'salesChannel', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'description', 'error')} ">
	<label for="description" class="control-label"><g:message
			code="quote.description.label" default="Description" /></label>
	<div class="controls">
		<g:textField name="description" value="${quoteInstance?.description}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'description', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'issueDate', 'error')} required">
	<label for="issueDate" class="control-label"><g:message
			code="quote.issueDate.label" default="Issue Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="issueDate"
			value="${quoteInstance?.issueDate}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'issueDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'expiryDate', 'error')} ">
	<label for="expiryDate" class="control-label"><g:message
			code="quote.expiryDate.label" default="Expiry Date" /></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="expiryDate"
			value="${quoteInstance?.expiryDate}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'expiryDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contactName', 'error')} ">
	<label for="contactName" class="control-label"><g:message
			code="quote.contactName.label" default="Contact Name" /></label>
	<div class="controls">
		<g:textField name="contactName" value="${quoteInstance?.contactName}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contactName', 'error')}
		</span>
	</div>
</div>

<g:if test="${params.contractQuote}">
	<div
		class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contractFromDate', 'error')} required">
		<label for="contractFromDate" class="control-label"><g:message
				code="contract.contractFromDate.label" default="Contract From Date" /><span
			class="required-indicator">*</span></label>
		<div class="controls">
			<bootstrap:jqDatePicker name="contractFromDate"
				value="${quoteInstance?.contractFromDate}" />
			<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contractFromDate', 'error')}
			</span>
		</div>
	</div>

	<div
		class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contractToDate', 'error')} required">
		<label for="contractToDate" class="control-label"><g:message
				code="contract.contractToDate.label" default="Contract To Date" /><span
			class="required-indicator">*</span></label>
		<div class="controls">
			<bootstrap:jqDatePicker name="contractToDate"
				value="${quoteInstance?.contractToDate}" />
			<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contractToDate', 'error')}
			</span>
		</div>
	</div>

	<div
		class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'invoicingIsFixedPrice', 'error')} ">
		<label for="invoicingIsFixedPrice" class="control-label"><g:message
				code="contract.invoicingIsFixedPrice.label"
				default="Invoicing Is Fixed Price" /></label>
		<div class="controls">
			<g:checkBox name="invoicingIsFixedPrice"
				value="${quoteInstance?.invoicingIsFixedPrice}" />
			<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'invoicingIsFixedPrice', 'error')}
			</span>
		</div>
	</div>

	<div
		class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'invoicingIsTimesheets', 'error')} ">
		<label for="invoicingIsTimesheets" class="control-label"><g:message
				code="contract.invoicingIsTimesheets.label"
				default="Invoicing Is Timesheets" /></label>
		<div class="controls">
			<g:checkBox name="invoicingIsTimesheets"
				value="${quoteInstance?.invoicingIsTimesheets}" />
			<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'invoicingIsTimesheets', 'error')}
			</span>
		</div>
	</div>

	<div
		class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'invoicingIsExpenses', 'error')} ">
		<label for="invoicingIsExpenses" class="control-label"><g:message
				code="contract.invoicingIsExpenses.label"
				default="Invoicing Is Expenses" /></label>
		<div class="controls">
			<g:checkBox name="invoicingIsExpenses"
				value="${quoteInstance?.invoicingIsExpenses}" />
			<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'invoicingIsExpenses', 'error')}
			</span>
		</div>
	</div>
</g:if>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo" class="control-label"><g:message
			code="contract.assignedTo.label" default="Assigned To" /></label>
	<div class="controls">
		<g:textField name="assignedTo" value="${quoteInstance?.assignedTo}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'assignedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'relatedTo', 'error')} ">
	<label for="relatedTo" class="control-label"><g:message
			code="contract.relatedTo.label" default="Related To" /></label>
	<div class="controls">
		<g:select name="relatedTo"
			from="${quoteInstance.constraints.relatedTo.inList}"
			value="${quoteInstance?.relatedTo}"
			valueMessagePrefix="contract.relatedTo" noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'relatedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'relatedToValue', 'error')} ">
	<label for="relatedToValue" class="control-label"><g:message
			code="contract.relatedToValue.label" default="Related To Value" /></label>
	<div class="controls">
		<g:textField name="relatedToValue" value="${quoteInstance?.relatedToValue}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'relatedToValue', 'error')}
		</span>
	</div>
</div>