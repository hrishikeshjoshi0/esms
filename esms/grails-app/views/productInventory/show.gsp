

<%@ page import="com.esms.model.inventory.ProductInventory"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'productInventory.label', default: 'ProductInventory')}" />
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
				<g:hiddenField name="id" value="${productInventoryInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit"
						id="${productInventoryInstance?.id}">
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
					<g:message code="productInventory.product.label" default="Product" />
				</dt>
				<dd>
					<g:link controller="product" action="show"
						id="${productInventoryInstance?.product?.id}">
						${productInventoryInstance?.product?.encodeAsHTML()}
					</g:link>
				</dd>
				
				<dt>
					<g:message code="productInventory.quantityOnHand.label"
						default="Quantity On Hand" />
				</dt>

				<dd>
					<g:fieldValue bean="${productInventoryInstance}"
						field="quantityOnHand" />
				</dd>


				<%--<dt>
					<g:message code="productInventory.unitCost.label"
						default="Unit Cost" />
				</dt>

				<dd>
					<g:fieldValue bean="${productInventoryInstance}" field="unitCost" />
				</dd>
				--%>
				
				<dt>
					<g:message code="productInventory.incoming.label"
						default="Incoming" />
				</dt>

				<dd>
					<g:fieldValue bean="${productInventoryInstance}" field="incoming" />
				</dd>


				<dt>
					<g:message code="productInventory.outgoing.label"
						default="Outgoing" />
				</dt>

				<dd>
					<g:fieldValue bean="${productInventoryInstance}" field="outgoing" />
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>
