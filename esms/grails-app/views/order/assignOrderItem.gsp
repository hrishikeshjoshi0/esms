<div
	class="control-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'purchaseOrderNumber', 'error')} required">
	<label for="purchaseOrderNumber" class="control-label"><g:message
			code="purchaseOrder.purchaseOrderNumber.label"
			default="Purchase Order Number" /><span class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="purchaseOrderNumber" required="" readOnly="readOnly"
			value="${purchaseOrderInstance?.purchaseOrderNumber}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'purchaseOrderNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'status', 'error')} ">
	<label for="status" class="control-label"><g:message
			code="purchaseOrder.status.label" default="Status" /></label>
	<div class="controls">
		<g:select name="status"
			from="${purchaseOrderInstance.constraints.status.inList}"
			value="${purchaseOrderInstance?.status}"
			valueMessagePrefix="purchaseOrder.status" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'vendorName', 'error')} ">
	<label for="vendorName" class="control-label"><g:message
			code="purchaseOrder.vendorName.label" default="Vendor Name" /></label>
	<div class="controls">
		<g:textField name="vendorName"
			value="${purchaseOrderInstance?.vendorName}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'vendorName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'contactName', 'error')} ">
	<label for="contactName" class="control-label"><g:message
			code="purchaseOrder.contactName.label" default="Contact Name" /></label>
	<div class="controls">
		<g:textField name="contactName"
			value="${purchaseOrderInstance?.contactName}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'contactName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'workCompleted', 'error')} ">
	<label for="workCompleted" class="control-label"><g:message
			code="purchaseOrder.workCompleted.label" default="Work Completed" /></label>
	<div class="controls">
		<g:field type="number" name="workCompleted" 
			value="${purchaseOrderInstance?.workCompleted}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'workCompleted', 'error')}
		</span>
	</div>
</div>
