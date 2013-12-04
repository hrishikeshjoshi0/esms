<%@ page import="com.esms.model.order.PurchaseOrder"%>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'purchaseOrderNumber', 'error')} required">
	<label for="purchaseOrderNumber" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.purchaseOrderNumber.label"
			default="Purchase Order Number" /><span class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:textField name="purchaseOrderNumber" required=""
			value="${purchaseOrderInstance?.purchaseOrderNumber}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'purchaseOrderNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'status', 'error')} ">
	<label for="status" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.status.label" default="Status" /></label>
	<div class="col-lg-10">
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
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'type', 'error')} ">
	<label for="type" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.type.label" default="Type" /></label>
	<div class="col-lg-10">
		<g:select name="type"
			from="${purchaseOrderInstance.constraints.type.inList}"
			value="${purchaseOrderInstance?.type}"
			valueMessagePrefix="purchaseOrder.type" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'type', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'description', 'error')} ">
	<label for="description" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.description.label" default="Description" /></label>
	<div class="col-lg-10">
		<g:textField name="description"
			value="${purchaseOrderInstance?.description}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'description', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'issueDate', 'error')} required">
	<label for="issueDate" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.issueDate.label" default="Issue Date" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<bootstrap:jqDatePicker name="issueDate"
			value="${purchaseOrderInstance?.issueDate}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'issueDate', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'expiryDate', 'error')} ">
	<label for="expiryDate" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.expiryDate.label" default="Expiry Date" /></label>
	<div class="col-lg-10">
		<bootstrap:jqDatePicker name="expiryDate"
			value="${purchaseOrderInstance?.expiryDate}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'expiryDate', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'totalAmount', 'error')} required">
	<label for="totalAmount" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.totalAmount.label" default="Total Amount" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:field type="number" name="totalAmount" step="any" required=""
			value="${purchaseOrderInstance.totalAmount}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'totalAmount', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'totalTax', 'error')} required">
	<label for="totalTax" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.totalTax.label" default="Total Tax" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:field type="number" name="totalTax" step="any" required=""
			value="${purchaseOrderInstance.totalTax}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'totalTax', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'totalDiscount', 'error')} required">
	<label for="totalDiscount" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.totalDiscount.label" default="Total Discount" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:field type="number" name="totalDiscount" step="any" required=""
			value="${purchaseOrderInstance.totalDiscount}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'totalDiscount', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'grandTotal', 'error')} required">
	<label for="grandTotal" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.grandTotal.label" default="Grand Total" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:field type="number" name="grandTotal" step="any" required=""
			value="${purchaseOrderInstance.grandTotal}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'grandTotal', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'termsAndConditions', 'error')} ">
	<label for="termsAndConditions" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.termsAndConditions.label"
			default="Terms And Conditions" /></label>
	<div class="col-lg-10">
		<g:textField name="termsAndConditions"
			value="${purchaseOrderInstance?.termsAndConditions}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'termsAndConditions', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'vendorName', 'error')} ">
	<label for="vendorName" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.vendorName.label" default="Vendor Name" /></label>
	<div class="col-lg-10">
		<g:textField name="vendorName"
			value="${purchaseOrderInstance?.vendorName}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'vendorName', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'contactName', 'error')} ">
	<label for="contactName" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.contactName.label" default="Contact Name" /></label>
	<div class="col-lg-10">
		<g:textField name="contactName"
			value="${purchaseOrderInstance?.contactName}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'contactName', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'inventoryJournalEntries', 'error')} ">
	<label for="inventoryJournalEntries" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.inventoryJournalEntries.label"
			default="Inventory Journal Entries" /></label>
	<div class="col-lg-10">

		<ul class="one-to-many">
			<g:each in="${purchaseOrderInstance?.inventoryJournalEntries?}"
				var="i">
				<li><g:link controller="inventoryJournal" action="show"
						id="${i.id}">
						${i?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="inventoryJournal"
					action="create"
					params="['purchaseOrder.id': purchaseOrderInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'inventoryJournal.label', default: 'InventoryJournal')])}
				</g:link></li>
		</ul>

		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'inventoryJournalEntries', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'openGrandTotal', 'error')} required">
	<label for="openGrandTotal" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.openGrandTotal.label" default="Open Grand Total" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:field type="number" name="openGrandTotal" step="any" required=""
			value="${purchaseOrderInstance.openGrandTotal}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'openGrandTotal', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'organization', 'error')} required">
	<label for="organization" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.organization.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:select id="organization" name="organization.id"
			from="${com.esms.model.party.Organization.list()}" optionKey="id"
			required="" value="${purchaseOrderInstance?.organization?.id}"
			class="many-to-one" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'paidGrandTotal', 'error')} required">
	<label for="paidGrandTotal" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.paidGrandTotal.label" default="Paid Grand Total" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:field type="number" name="paidGrandTotal" step="any" required=""
			value="${purchaseOrderInstance.paidGrandTotal}" />
		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'paidGrandTotal', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'purchaseOrderItems', 'error')} ">
	<label for="purchaseOrderItems" class="col-lg-2 control-label"><g:message
			code="purchaseOrder.purchaseOrderItems.label"
			default="Purchase Order Items" /></label>
	<div class="col-lg-10">

		<ul class="one-to-many">
			<g:each in="${purchaseOrderInstance?.purchaseOrderItems?}" var="p">
				<li><g:link controller="purchaseOrderItem" action="show"
						id="${p.id}">
						${p?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="purchaseOrderItem"
					action="create"
					params="['purchaseOrder.id': purchaseOrderInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'purchaseOrderItem.label', default: 'PurchaseOrderItem')])}
				</g:link></li>
		</ul>

		<span class="help-inline">
			${hasErrors(bean: purchaseOrderInstance, field: 'purchaseOrderItems', 'error')}
		</span>
	</div>
</div>

