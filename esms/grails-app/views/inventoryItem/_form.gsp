<%@ page import="com.esms.model.inventory.InventoryItem"%>

<script type="text/javascript">
	function fetchUnitPriceForProduct(id) {
		var url = "${createLink(controller:'product', action:'getPrice')}" + "/" + id;
		$.ajax({
		    url:url,
		    dataType: 'xml',	
		    success: function(data) {
		    	$(data).find("unitPrice").each(function() {  
		    		//find each instance of loc in xml file and wrap it in a link  
		    		$("#unitCost").val($(this).text());
		    	});  
		    },
		    error: function(request, status, error) {
		      alert(error)
		    },
		    complete: function() {
		    }
		});
	}
</script>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'inventoryItemType', 'error')} ">
	<label for="inventoryItemType" class="control-label"><g:message
			code="inventoryItem.inventoryItemType.label"
			default="Inventory Item Type" /></label>
	<div class="controls">
		<g:textField name="inventoryItemType"
			value="${inventoryItemInstance?.inventoryItemType}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'inventoryItemType', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'productNumber', 'error')} required">
	<label for="productNumber" class="control-label"><g:message
			code="inventoryItem.productNumber.label" default="Product Number" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<richui:autoComplete name="productNumber" onItemSelect="fetchUnitPriceForProduct(id);"
			action="${createLinkTo('dir': 'product/searchAJAX')}"
			forceSelection="true" typeAhead="true" shadow="true" minQueryLength ="2"/>
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'productNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'status', 'error')} ">
	<label for="status" class="control-label"><g:message
			code="inventoryItem.status.label" default="Status" /></label>
	<div class="controls">
		<g:select name="status"
			from="${inventoryItemInstance.constraints.status.inList}"
			value="${inventoryItemInstance?.status}"
			valueMessagePrefix="inventoryItem.status" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'dateReceived', 'error')} required">
	<label for="dateReceived" class="control-label"><g:message
			code="inventoryItem.dateReceived.label" default="Date Received" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="dateReceived"
			value="${inventoryItemInstance?.dateReceived}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'dateReceived', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'dateManufactured', 'error')} ">
	<label for="dateManufactured" class="control-label"><g:message
			code="inventoryItem.dateManufactured.label"
			default="Date Manufactured" /></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="dateManufactured"
			value="${inventoryItemInstance?.dateManufactured}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'dateManufactured', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'expireDate', 'error')} ">
	<label for="expireDate" class="control-label"><g:message
			code="inventoryItem.expireDate.label" default="Expire Date" /></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="expireDate"
			value="${inventoryItemInstance?.expireDate}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'expireDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'lotId', 'error')} ">
	<label for="lotId" class="control-label"><g:message
			code="inventoryItem.lotId.label" default="Lot Id" /></label>
	<div class="controls">
		<g:textField name="lotId" value="${inventoryItemInstance?.lotId}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'lotId', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'uomId', 'error')} ">
	<label for="uomId" class="control-label"><g:message
			code="inventoryItem.uomId.label" default="Uom Id" /></label>
	<div class="controls">
		<g:textField name="uomId" value="${inventoryItemInstance?.uomId}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'uomId', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'comments', 'error')} ">
	<label for="comments" class="control-label"><g:message
			code="inventoryItem.comments.label" default="Comments" /></label>
	<div class="controls">
		<g:textField name="comments"
			value="${inventoryItemInstance?.comments}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'comments', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'quantityOnHandTotal', 'error')} ">
	<label for="quantityOnHandTotal" class="control-label"><g:message
			code="inventoryItem.quantityOnHandTotal.label"
			default="Quantity On Hand Total" /></label>
	<div class="controls">
		<g:field type="number" name="quantityOnHandTotal" step="any"
			value="${inventoryItemInstance.quantityOnHandTotal}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'quantityOnHandTotal', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'availableToPromiseTotal', 'error')} ">
	<label for="availableToPromiseTotal" class="control-label"><g:message
			code="inventoryItem.availableToPromiseTotal.label"
			default="Available To Promise Total" /></label>
	<div class="controls">
		<g:field type="number" name="availableToPromiseTotal" step="any"
			value="${inventoryItemInstance.availableToPromiseTotal}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'availableToPromiseTotal', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'quantityOnHand', 'error')} ">
	<label for="quantityOnHand" class="control-label"><g:message
			code="inventoryItem.quantityOnHand.label" default="Quantity On Hand" /></label>
	<div class="controls">
		<g:field type="number" name="quantityOnHand" step="any"
			value="${inventoryItemInstance.quantityOnHand}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'quantityOnHand', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'availableToPromise', 'error')} ">
	<label for="availableToPromise" class="control-label"><g:message
			code="inventoryItem.availableToPromise.label"
			default="Available To Promise" /></label>
	<div class="controls">
		<g:field type="number" name="availableToPromise" step="any"
			value="${inventoryItemInstance.availableToPromise}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'availableToPromise', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'serialNumber', 'error')} ">
	<label for="serialNumber" class="control-label"><g:message
			code="inventoryItem.serialNumber.label" default="Serial Number" /></label>
	<div class="controls">
		<g:textField name="serialNumber"
			value="${inventoryItemInstance?.serialNumber}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'serialNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: inventoryItemInstance, field: 'unitCost', 'error')} ">
	<label for="unitCost" class="control-label"><g:message
			code="inventoryItem.unitCost.label" default="Unit Cost" /></label>
	<div class="controls">
		<g:field type="number" name="unitCost" step="any"
			value="${inventoryItemInstance.unitCost}" />
		<span class="help-inline">
			${hasErrors(bean: inventoryItemInstance, field: 'unitCost', 'error')}
		</span>
	</div>
</div>

