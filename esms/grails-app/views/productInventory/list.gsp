
<%@ page import="com.esms.model.inventory.ProductInventory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'productInventory.label', default: 'ProductInventory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h3>
						<g:message code="default.list.label" args="[entityName]" />
					</h3>
				</div>
				
				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
						
							<g:sortableColumn property="quantityOnHand" title="${message(code: 'productInventory.quantityOnHand.label', default: 'Quantity On Hand')}" />
						
							<g:sortableColumn property="unitCost" title="${message(code: 'productInventory.unitCost.label', default: 'Unit Cost')}" />
						
							<g:sortableColumn property="incoming" title="${message(code: 'productInventory.incoming.label', default: 'Incoming')}" />
						
							<g:sortableColumn property="outgoing" title="${message(code: 'productInventory.outgoing.label', default: 'Outgoing')}" />
						
							<th class="header"><g:message code="productInventory.product.label" default="Product" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${productInventoryInstanceList}" var="productInventoryInstance">
						<tr>
						
							<td>${fieldValue(bean: productInventoryInstance, field: "quantityOnHand")}</td>
						
							<td>${fieldValue(bean: productInventoryInstance, field: "unitCost")}</td>
						
							<td>${fieldValue(bean: productInventoryInstance, field: "incoming")}</td>
						
							<td>${fieldValue(bean: productInventoryInstance, field: "outgoing")}</td>
						
							<td>${fieldValue(bean: productInventoryInstance, field: "product.productName")}</td>
						
							<td class="link">
								<g:link action="show" id="${productInventoryInstance.id}" class="btn btn-default btn-xs">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${productInventoryInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
