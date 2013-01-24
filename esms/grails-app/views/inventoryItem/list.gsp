
<%@ page import="com.esms.model.inventory.InventoryItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'inventoryItem.label', default: 'InventoryItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<div class="page-header">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						
							<g:sortableColumn property="inventoryItemType" title="${message(code: 'inventoryItem.inventoryItemType.label', default: 'Inventory Item Type')}" />
						
							<g:sortableColumn property="productNumber" title="${message(code: 'inventoryItem.productNumber.label', default: 'Product Number')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'inventoryItem.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="dateReceived" title="${message(code: 'inventoryItem.dateReceived.label', default: 'Date Received')}" />
						
							<g:sortableColumn property="dateManufactured" title="${message(code: 'inventoryItem.dateManufactured.label', default: 'Date Manufactured')}" />
						
							<g:sortableColumn property="expireDate" title="${message(code: 'inventoryItem.expireDate.label', default: 'Expire Date')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${inventoryItemInstanceList}" var="inventoryItemInstance">
						<tr>
						
							<td>${fieldValue(bean: inventoryItemInstance, field: "inventoryItemType")}</td>
						
							<td>${fieldValue(bean: inventoryItemInstance, field: "productNumber")}</td>
						
							<td>${fieldValue(bean: inventoryItemInstance, field: "status")}</td>
						
							<td><g:formatDate date="${inventoryItemInstance.dateReceived}" /></td>
						
							<td><g:formatDate date="${inventoryItemInstance.dateManufactured}" /></td>
						
							<td><g:formatDate date="${inventoryItemInstance.expireDate}" /></td>
						
							<td class="link">
								<g:link action="show" id="${inventoryItemInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${inventoryItemInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
