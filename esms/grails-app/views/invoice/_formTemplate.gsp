<%@ page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.invoice.Invoice"%>
<%@ page import="com.esms.model.product.*"%>

<g:hiddenField id="invoiceLinesTotal" name="invoiceLinesTotal" value="${invoiceInstance?.invoiceLines?invoiceInstance?.invoiceLines.size():0}"/>
<g:hiddenField id="referenceOrderNumber" name="referenceOrderNumber" value="${invoiceInstance?.referenceOrderNumber}"/>
<g:hiddenField id="organizationId" name="organization.id" value="${invoiceInstance?.organization?.id}"/>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'invoiceNumber', 'error')} required">
			<label for="invoiceNumber" class="control-label"><g:message
					code="invoice.invoiceNumber.label" default="Invoice Number" /><span
				class="required-indicator">*</span></label>
			<div class="controls">
				<g:textField name="invoiceNumber" required="" readonly="readonly"
					value="${invoiceInstance?.invoiceNumber}" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'invoiceNumber', 'error')}
				</span>
			</div>
		</div>
	</div>

	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'type', 'error')} ">
			<label for="type" class="control-label"><g:message
					code="invoice.type.label" default="Type" /></label>
			<div class="controls">
				<g:select name="type"
					from="${invoiceInstance.constraints.type.inList}"
					value="${invoiceInstance?.type}" valueMessagePrefix="invoice.type"
					noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'type', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<g:if test="${invoiceInstance?.type == 'SERVICE'}">
	<div class="row-fluid">
		<div class="span6">
			<div
				class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'contractFromDate', 'error')} ">
				<label for="contractFromDate" class="control-label"><g:message
						code="invoice.contractFromDate.label" default="Contract From Date" /></label>
				<div class="controls">
					<richui:dateChooser name="contractFromDate"
						value="${invoiceInstance?.contractFromDate}" />
					<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'contractFromDate', 'error')}
					</span>
				</div>
			</div>
		</div>
		
		<div class="span6">
			<div
				class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'contractToDate', 'error')} ">
				<label for="contractToDate" class="control-label"><g:message
						code="invoice.contractToDate.label" default="Contract To Date" /></label>
				<div class="controls">
					<richui:dateChooser name="contractToDate"
						value="${invoiceInstance?.contractToDate}" />
					<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'contractToDate', 'error')}
					</span>
				</div>
			</div>
		</div>
	</div>
</g:if>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'issueDate', 'error')} required">
			<label for="issueDate" class="control-label"><g:message
					code="invoice.issueDate.label" default="Issue Date" /><span
				class="required-indicator">*</span></label>
			<div class="controls">
				<richui:dateChooser name="issueDate"
					value="${invoiceInstance?.issueDate}" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'issueDate', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="span6">
		<g:if test="${invoiceInstance?.type == 'SERVICE'}">
			<div
				class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'expiryDate', 'error')} required">
				<label for="expiryDate" class="control-label"><g:message
						code="invoice.expiryDate.label" default="Expiry Date" /><span
					class="required-indicator">*</span></label>
				<div class="controls">
					<richui:dateChooser name="expiryDate"
						value="${invoiceInstance?.expiryDate}" />
					<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'expiryDate', 'error')}
					</span>
				</div>
			</div>
		</g:if>
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'contactName', 'error')} ">
			<label for="contactName" class="control-label"><g:message
					code="invoice.contactName.label" default="Contact Name" /></label>
			<div class="controls">
				<g:textField name="contactName"
					value="${invoiceInstance?.contactName}" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'contactName', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="span6">
	</div>
</div>		

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'relatedTo', 'error')} ">
			<label for="relatedTo" class="control-label"><g:message
					code="invoice.relatedTo.label" default="Related To" /></label>
			<div class="controls">
				<g:select name="relatedTo"
					from="${invoiceInstance.constraints.relatedTo.inList}"
					value="${invoiceInstance?.relatedTo}"
					valueMessagePrefix="invoice.relatedTo" noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'relatedTo', 'error')}
				</span>
			</div>
		</div>
	</div>	
	
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'relatedToValue', 'error')} ">
			<label for="relatedToValue" class="control-label"><g:message
					code="invoice.relatedToValue.label" default="Related To Value" /></label>
			<div class="controls">
				<g:textField name="relatedToValue"
					value="${invoiceInstance?.relatedToValue}" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'relatedToValue', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'assignedTo', 'error')} ">
			<label for="assignedTo" class="control-label"><g:message
					code="invoice.assignedTo.label" default="Assigned To" /></label>
			<div class="controls">
				<g:textField name="assignedTo" value="${invoiceInstance?.assignedTo}" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'assignedTo', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'status', 'error')} ">
			<label for="status" class="control-label"><g:message
					code="invoice.status.label" default="Status" /></label>
			<div class="controls">
				<g:select name="status"
					from="${invoiceInstance.constraints.status.inList}"
					value="${invoiceInstance?.status}"
					valueMessagePrefix="invoice.status" noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'status', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>	

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'termsAndConditions', 'error')} ">
			<label for="termsAndConditions" class="control-label"><g:message
					code="invoice.termsAndConditions.label"
					default="Terms And Conditions" /></label>
			<div class="controls">
				<g:textField name="termsAndConditions"
					value="${invoiceInstance?.termsAndConditions}" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'termsAndConditions', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="span6">
		
	</div>
</div>

<div class="row-fluid">
	<div class="span12">
		<div class="page-header">
			<h1>
				Invoice Lines
			</h1>
		</div>
		<g:render template="invoiceLines" />
	</div>
</div>		

<!-- Totals -->
<div class="row-fluid">
	<div class="span12">
		<div class="page-header">
			<h1>
				Invoice Total
			</h1>
		</div>
	</div>
</div>	

<div class="row-fluid">
	<div class="span6">
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'totalAmount', 'error')} required">
			<label for="totalAmount" class="control-label"><g:message
					code="invoiceInstance.totalAmount.label" default="Total Amount" /><span
				class="required-indicator">*</span></label>
			<div class="controls">
				<g:field readonly="readonly" type="number" name="totalAmount" step="any" required=""
					class="input-medium"
					value="${invoiceInstance?.totalAmount}" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'totalAmount', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'adjustment', 'error')} required">
			<label for="adjustment" class="control-label"><g:message
					code="invoice.adjustment.label" default="Adjustment" /><span
				class="required-indicator">*</span></label>
			<div class="controls">
				<g:field id="adjustment" type="number" name="adjustment" step="any" required="" class="calc"
					class="input-medium" value="${invoiceInstance?.adjustment}" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'adjustment', 'error')}
				</span>
			</div>
		</div>
		
		<div
			class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'grandTotal', 'error')} required">
			<label for="grandTotal" class="control-label"><g:message
					code="invoice.grandTotal.label" default="Grand Total" /><span
				class="required-indicator">*</span></label>
			<div class="controls">
				<g:field readonly="readonly" type="number" name="grandTotal" step="any" required=""
					class="input-medium" value="${invoiceInstance?.grandTotal}" />
				<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'grandTotal', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="span6">
		
	</div>
</div>