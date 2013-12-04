<div class="pull-right">
	<g:link role="button" class="btn btn-default btn-sm" controller="orderInventoryAssignment" action="create" params="['order.id':orderInstance.id]">
		 New Item
	</g:link>
</div>

<g:set var="orderInventoryAssignmentInstanceList" value="${orderInstance.orderInventoryAssignments}"/>

<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<th class="header"><g:message
					code="orderInventoryAssignment.productInventory.label"
					default="Product" /></th>

			<g:sortableColumn property="quantity"
				title="${message(code: 'orderInventoryAssignment.quantity.label', default: 'Quantity')}" />
				
			<g:sortableColumn property="status"
				title="${message(code: 'orderInventoryAssignment.status.label', default: 'Status')}" />

			<g:sortableColumn property="isPosted"
				title="${message(code: 'orderInventoryAssignment.isPosted.label', default: 'Is Posted')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${orderInventoryAssignmentInstanceList}"
			var="orderInventoryAssignmentInstance">
			<tr>
				<td>
					${fieldValue(bean: orderInventoryAssignmentInstance, field: "productInventory.product.productName")}
				</td>
				
				<td>
					${fieldValue(bean: orderInventoryAssignmentInstance, field: "quantity")}
				</td>

				<td>
					${fieldValue(bean: orderInventoryAssignmentInstance, field: "status")}
				</td>

				<td><g:formatBoolean
						boolean="${orderInventoryAssignmentInstance.isPosted}" /></td>

				<td class="link"><g:link action="show" controller="orderInventoryAssignment"
						id="${orderInventoryAssignmentInstance.id}" class="btn btn-default btn-sm">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${orderInventoryAssignmentInstanceList?orderInventoryAssignmentInstanceList.size():0}" />
</div>