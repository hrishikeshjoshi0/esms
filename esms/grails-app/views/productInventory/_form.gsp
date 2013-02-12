<%@ page import="com.esms.model.inventory.ProductInventory"%>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'product', 'error')} required">
	<label for="product" class="control-label"><g:message
			code="productInventory.product.label" default="Product" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select id="product" name="product.id" optionValue="productName"
			from="${com.esms.model.product.Product.list()}" optionKey="id"
			required="" value="${productInventoryInstance?.product?.id}"
			class="many-to-one" />
		<span class="help-inline">
			${hasErrors(bean: productInventoryInstance, field: 'product', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'quantityOnHand', 'error')} ">
	<label for="quantityOnHand" class="control-label"><g:message
			code="productInventory.quantityOnHand.label"
			default="Quantity On Hand" /></label>
	<div class="controls">
		<g:field type="number" name="quantityOnHand" step="any"
			value="${productInventoryInstance.quantityOnHand}" />
		<span class="help-inline">
			${hasErrors(bean: productInventoryInstance, field: 'quantityOnHand', 'error')}
		</span>
	</div>
</div>

<%--<div
	class="control-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'unitCost', 'error')} ">
	<label for="unitCost" class="control-label"><g:message
			code="productInventory.unitCost.label" default="Unit Cost" /></label>
	<div class="controls">
		<g:field type="number" name="unitCost" step="any"
			value="${productInventoryInstance.unitCost}" />
		<span class="help-inline">
			${hasErrors(bean: productInventoryInstance, field: 'unitCost', 'error')}
		</span>
	</div>
</div>

--%><div
	class="control-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'incoming', 'error')} ">
	<label for="incoming" class="control-label"><g:message
			code="productInventory.incoming.label" default="Incoming" /></label>
	<div class="controls">
		<g:field type="number" name="incoming" step="any"
			value="${productInventoryInstance.incoming}" />
		<span class="help-inline">
			${hasErrors(bean: productInventoryInstance, field: 'incoming', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'outgoing', 'error')} ">
	<label for="outgoing" class="control-label"><g:message
			code="productInventory.outgoing.label" default="Outgoing" /></label>
	<div class="controls">
		<g:field type="number" name="outgoing" step="any"
			value="${productInventoryInstance.outgoing}" />
		<span class="help-inline">
			${hasErrors(bean: productInventoryInstance, field: 'outgoing', 'error')}
		</span>
	</div>
</div>