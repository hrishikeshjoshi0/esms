
<%@ page import="com.esms.model.order.OrderInventoryAssignment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment')}" />
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
						
							<g:sortableColumn property="status" title="${message(code: 'orderInventoryAssignment.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="quantity" title="${message(code: 'orderInventoryAssignment.quantity.label', default: 'Quantity')}" />
						
							<g:sortableColumn property="isPosted" title="${message(code: 'orderInventoryAssignment.isPosted.label', default: 'Is Posted')}" />
						
							<th class="header"><g:message code="orderInventoryAssignment.order.label" default="Order" /></th>
						
							<th class="header"><g:message code="orderInventoryAssignment.productInventory.label" default="Product Inventory" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${orderInventoryAssignmentInstanceList}" var="orderInventoryAssignmentInstance">
						<tr>
						
							<td>${fieldValue(bean: orderInventoryAssignmentInstance, field: "status")}</td>
						
							<td>${fieldValue(bean: orderInventoryAssignmentInstance, field: "quantity")}</td>
						
							<td><g:formatBoolean boolean="${orderInventoryAssignmentInstance.isPosted}" /></td>
						
							<td>${fieldValue(bean: orderInventoryAssignmentInstance, field: "order")}</td>
						
							<td>${fieldValue(bean: orderInventoryAssignmentInstance, field: "productInventory")}</td>
						
							<td class="link">
								<g:link action="show" id="${orderInventoryAssignmentInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${orderInventoryAssignmentInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
