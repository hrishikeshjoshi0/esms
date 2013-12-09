<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="status"
				title="${message(code: 'product.status.label', default: 'Status')}" />
			<g:sortableColumn property="quantity"
				title="${message(code: 'product.quantity.label', default: 'Quantity')}" />
			<g:sortableColumn property="order"
				title="${message(code: 'product.order.label', default: 'Order')}" />
		</tr>
	</thead>
	<tbody>
		<g:each in="${productInstance?.inventory?.inventoryJournalEntries}" var="p">
			<tr>
				<td>
					${fieldValue(bean: p, field: "status")}
				</td>
				<td>
					${fieldValue(bean: p, field: "quantity")}
				</td>
				<td>
					${fieldValue(bean: p, field: "order.orderNumber")}
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pgn">
	<bootstrap:paginate total="${productInstance?.inventory?.inventoryJournalEntries?.size()?productInstance?.inventory?.inventoryJournalEntries?.size():0}" />
</div>