

<%@ page import="com.esms.model.inventory.InventoryItem"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'inventoryItem.label', default: 'InventoryItem')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${inventoryItemInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${inventoryItemInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="inventoryItem.inventoryItemType.label"
						default="Inventory Item Type" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}"
						field="inventoryItemType" />
				</dd>


				<dt>
					<g:message code="inventoryItem.productNumber.label"
						default="Product Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}" field="productNumber" />
				</dd>


				<dt>
					<g:message code="inventoryItem.status.label" default="Status" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}" field="status" />
				</dd>


				<dt>
					<g:message code="inventoryItem.dateReceived.label"
						default="Date Received" />
				</dt>

				<dd>
					<g:formatDate date="${inventoryItemInstance?.dateReceived}" />
				</dd>


				<dt>
					<g:message code="inventoryItem.dateManufactured.label"
						default="Date Manufactured" />
				</dt>

				<dd>
					<g:formatDate date="${inventoryItemInstance?.dateManufactured}" />
				</dd>


				<dt>
					<g:message code="inventoryItem.expireDate.label"
						default="Expire Date" />
				</dt>

				<dd>
					<g:formatDate date="${inventoryItemInstance?.expireDate}" />
				</dd>


				<dt>
					<g:message code="inventoryItem.lotId.label" default="Lot Id" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}" field="lotId" />
				</dd>


				<dt>
					<g:message code="inventoryItem.uomId.label" default="Uom Id" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}" field="uomId" />
				</dd>


				<dt>
					<g:message code="inventoryItem.comments.label" default="Comments" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}" field="comments" />
				</dd>


				<dt>
					<g:message code="inventoryItem.quantityOnHandTotal.label"
						default="Quantity On Hand Total" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}"
						field="quantityOnHandTotal" />
				</dd>


				<dt>
					<g:message code="inventoryItem.availableToPromiseTotal.label"
						default="Available To Promise Total" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}"
						field="availableToPromiseTotal" />
				</dd>


				<dt>
					<g:message code="inventoryItem.quantityOnHand.label"
						default="Quantity On Hand" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}"
						field="quantityOnHand" />
				</dd>


				<dt>
					<g:message code="inventoryItem.availableToPromise.label"
						default="Available To Promise" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}"
						field="availableToPromise" />
				</dd>


				<dt>
					<g:message code="inventoryItem.serialNumber.label"
						default="Serial Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}" field="serialNumber" />
				</dd>


				<dt>
					<g:message code="inventoryItem.unitCost.label" default="Unit Cost" />
				</dt>

				<dd>
					<g:fieldValue bean="${inventoryItemInstance}" field="unitCost" />
				</dd>


			</dl>
		</div>
	</div>
</body>
</html>
