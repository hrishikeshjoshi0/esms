<!-- Orders -->
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<g:sortableColumn property="orderNumber"
				title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />

			<g:sortableColumn property="status"
				title="${message(code: 'order.status.label', default: 'Status')}" />

			<g:sortableColumn property="type"
				title="${message(code: 'order.type.label', default: 'Type')}" />

			<g:sortableColumn property="issueDate"
				title="${message(code: 'order.issueDate.label', default: 'Issue Date')}" />

			<g:sortableColumn property="grandTotal"
				title="${message(code: 'order.grandTotal.label', default: 'Grand Total')}" />

			<g:sortableColumn property="invoicedGrandTotal"
				title="${message(code: 'order.invoicedGrandTotal.label', default: 'Invoiced Grand Total')}" />

			<g:sortableColumn property="pendingInvoiceGrandTotal"
				title="${message(code: 'order.pendingInvoiceGrandTotal.label', default: 'Pending Invoice Amount')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.orders}" var="orderInstance">
			<tr>
				<td>
					${fieldValue(bean: orderInstance, field: "orderNumber")}
				</td>

				<td>
					${fieldValue(bean: orderInstance, field: "status")}
				</td>

				<td>
					${fieldValue(bean: orderInstance, field: "type")}
				</td>

				<td><g:formatDate date="${orderInstance.issueDate}" /></td>

				<td>
					${fieldValue(bean : orderInstance, field : "grandTotal") }
				</td>

				<td>
					${fieldValue(bean : orderInstance, field : "invoicedGrandTotal") }
				</td>

				<td>
					${fieldValue(bean : orderInstance, field : "pendingInvoiceGrandTotal") }
				</td>

				<td class="link"><g:link controller="order" action="show" id="${orderInstance.id}"
						class="btn btn-small">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate params="${filterParams}"
		total="${orderInstanceTotal?orderInstanceTotal:organizationInstance?.orders?.size()}" />
</div>