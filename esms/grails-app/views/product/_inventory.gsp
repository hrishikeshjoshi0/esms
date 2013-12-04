<g:set var="productInventoryInstance"
	value="${productInstance.inventory}" />
<div class="pull-right">
	<g:link class="btn btn-default btn-sm" action="edit" controller="productInventory" 
			id="${productInventoryInstance?.id}">
		
		<g:message code="default.button.edit.label" default="Edit" />
	</g:link>
</div>

<!-- Contacts -->
<dl class="dl-horizontal">

	<dt>
		<g:message code="productInventory.quantityOnHand.label"
			default="Quantity On Hand" />
	</dt>

	<dd>
		<g:fieldValue bean="${productInventoryInstance}"
			field="quantityOnHand" />
	</dd>


	<dt>
		<g:message code="productInventory.unitCost.label" default="Unit Cost" />
	</dt>

	<dd>
		<g:fieldValue bean="${productInventoryInstance}" field="unitCost" />
	</dd>


	<dt>
		<g:message code="productInventory.incoming.label" default="Incoming" />
	</dt>

	<dd>
		<g:fieldValue bean="${productInventoryInstance}" field="incoming" />
	</dd>


	<dt>
		<g:message code="productInventory.outgoing.label" default="Outgoing" />
	</dt>

	<dd>
		<g:fieldValue bean="${productInventoryInstance}" field="outgoing" />
	</dd>
</dl>