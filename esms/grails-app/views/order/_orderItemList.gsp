<div class="pull-right">
	<a data-toggle="modal" href="#" data-target="#orderItemModal"
		role="button" class="btn"> <i class="icon-plus"></i> New Item
	</a>
</div>

<!-- Quotes -->
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<g:sortableColumn property="lineNumber"
				title="${message(code: 'orderItem.lineNumber.label', default: 'Line Number')}" />
			<g:sortableColumn property="quantity"
				title="${message(code: 'orderItem.quantity.label', default: 'Quantity')}" />
			<g:sortableColumn property="unitPrice"
				title="${message(code: 'orderItem.unitPrice.label', default: 'Unit Price')}" />
			<g:sortableColumn property="tax"
				title="${message(code: 'orderItem.tax.label', default: 'Tax')}" />
			<g:sortableColumn property="discount"
				title="${message(code: 'orderItem.discount.label', default: 'Discount')}" />
			<g:sortableColumn property="lineTotalAmount"
				title="${message(code: 'orderItem.lineTotalAmount.label', default: 'Line Total Amount')}" />
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${orderInstance?.orderItems}" var="orderItemInstance">
			<tr>
				<td>
					${fieldValue(bean: orderItemInstance, field: "lineNumber")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "quantity")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "unitPrice")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "tax")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "discount")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "lineTotalAmount")}
				</td>
				<td class="link"><g:link action="show"
						id="${orderItemInstance.id}" class="btn btn-small">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${orderInstance?.orderItems?orderInstance?.orderItems.size():0}" />
</div>

<!-- Modal -->
<div id="orderItemModal" class="modal hide fade" tabindex="-1"
	role="dialog"
	data-remote="<g:createLink controller="order" action="createOrderItem" params="[orderId:orderInstance?.id]"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Order Item</h3>
	</div>
	<g:form controller="order" action="createOrderItem" method="POST">
		<g:hiddenField name="order.id" value="${orderInstance?.id}" />
		<div class="modal-body"></div>
		<div class="modal-footer">
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">
					<i class="icon-ok icon-white"></i>
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>