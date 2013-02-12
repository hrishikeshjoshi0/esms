<%@ page import="com.esms.model.order.OrderInventoryAssignment"%>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInventoryAssignmentInstance, field: 'productInventory', 'error')} required">
	<label for="productInventory" class="control-label"><g:message
			code="orderInventoryAssignment.productInventory.label"
			default="Product Inventory" /><span class="required-indicator">*</span></label>
	<div class="controls">
		<g:select id="productInventory" name="productInventory.id" optionValue="${{it.product?.productName}}"
			from="${com.esms.model.inventory.ProductInventory.list()}"
			optionKey="id" required=""
			value="${orderInventoryAssignmentInstance?.productInventory?.id}"
			class="many-to-one" />
		<span class="help-inline">
			${hasErrors(bean: orderInventoryAssignmentInstance, field: 'productInventory', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInventoryAssignmentInstance, field: 'order', 'error')} required">
	<label for="order" class="control-label"><g:message
			code="orderInventoryAssignment.order.label" default="Order" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select id="order" name="order.id" optionValue="orderNumber"
			from="${com.esms.model.order.Order.list()}" optionKey="id"
			required="" value="${orderInventoryAssignmentInstance?.order?.id}"
			class="many-to-one" />
		<span class="help-inline">
			${hasErrors(bean: orderInventoryAssignmentInstance, field: 'order', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInventoryAssignmentInstance, field: 'status', 'error')} required">
	<label for="status" class="control-label"><g:message
			code="orderInventoryAssignment.status.label" default="Status" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="status" required=""
			value="${orderInventoryAssignmentInstance?.status}" />
		<span class="help-inline">
			${hasErrors(bean: orderInventoryAssignmentInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInventoryAssignmentInstance, field: 'quantity', 'error')} required">
	<label for="quantity" class="control-label"><g:message
			code="orderInventoryAssignment.quantity.label" default="Quantity" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="quantity" step="any" required=""
			value="${orderInventoryAssignmentInstance.quantity}" />
		<span class="help-inline">
			${hasErrors(bean: orderInventoryAssignmentInstance, field: 'quantity', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInventoryAssignmentInstance, field: 'isPosted', 'error')} ">
	<label for="isPosted" class="control-label"><g:message
			code="orderInventoryAssignment.isPosted.label" default="Is Posted" /></label>
	<div class="controls">
		<g:checkBox name="isPosted"
			value="${orderInventoryAssignmentInstance?.isPosted}" />
		<span class="help-inline">
			${hasErrors(bean: orderInventoryAssignmentInstance, field: 'isPosted', 'error')}
		</span>
	</div>
</div>