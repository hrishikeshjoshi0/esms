<%@ page import="com.esms.model.inventory.ProductInventory"%>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'product', 'error')} required">
	<label for="product" class="col-md-3 control-label"><g:message
			code="productInventory.product.label" default="Product" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
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
	class="form-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'quantityOnHand', 'error')} ">
	<label for="quantityOnHand" class="col-md-3 control-label"><g:message
			code="productInventory.quantityOnHand.label"
			default="Quantity On Hand" /></label>
	<div class="col-md-9">
		<g:field type="number" name="quantityOnHand" step="any"
			value="${productInventoryInstance.quantityOnHand}" />
		<span class="help-inline">
			${hasErrors(bean: productInventoryInstance, field: 'quantityOnHand', 'error')}
		</span>
	</div>
</div>

<%--<div
	class="form-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'unitCost', 'error')} ">
	<label for="unitCost" class="col-md-3 control-label"><g:message
			code="productInventory.unitCost.label" default="Unit Cost" /></label>
	<div class="col-md-9">
		<g:field type="number" name="unitCost" step="any"
			value="${productInventoryInstance.unitCost}" />
		<span class="help-inline">
			${hasErrors(bean: productInventoryInstance, field: 'unitCost', 'error')}
		</span>
	</div>
</div>

--%><div
	class="form-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'incoming', 'error')} ">
	<label for="incoming" class="col-md-3 control-label"><g:message
			code="productInventory.incoming.label" default="Incoming" /></label>
	<div class="col-md-9">
		<g:field type="number" name="incoming" step="any"
			value="${productInventoryInstance.incoming}" />
		<span class="help-inline">
			${hasErrors(bean: productInventoryInstance, field: 'incoming', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInventoryInstance, field: 'outgoing', 'error')} ">
	<label for="outgoing" class="col-md-3 control-label"><g:message
			code="productInventory.outgoing.label" default="Outgoing" /></label>
	<div class="col-md-9">
		<g:field type="number" name="outgoing" step="any"
			value="${productInventoryInstance.outgoing}" />
		<span class="help-inline">
			${hasErrors(bean: productInventoryInstance, field: 'outgoing', 'error')}
		</span>
	</div>
</div>