<!-- Orders -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn params="${filterParams}" property="orderNumber"
				title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />

			<g:sortableColumn params="${filterParams}"
				property="organization.name"
				title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />

			<g:sortableColumn params="${filterParams}" property="status"
				title="${message(code: 'order.status.label', default: 'Status')}" />

			<g:sortableColumn params="${filterParams}" property="type"
				title="${message(code: 'order.type.label', default: 'Type')}" />

			<g:sortableColumn params="${filterParams}" property="issueDate"
				title="${message(code: 'order.issueDate.label', default: 'Issue Date')}" />

			<th>Total Amount</th>

			<th>Invoiced Amount</th>

			<th>Received Amount</th>

			<th>Pending Invoice Amount</th>

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.orders}" var="orderInstance">
			<tr>
				<td>
					${fieldValue(bean: orderInstance, field: "orderNumber")}
				</td>

				<td><g:link controller="organization" action="show"
						id="${orderInstance?.organization?.id}">
						${fieldValue(bean: orderInstance, field: "organization.name")}
					</g:link></td>

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
					${orderInstance?.invoicedGrandTotal}
				</td>

				<td>
					${orderInstance?.getReceivedAmount()}
				</td>

				<td>
					${fieldValue(bean : orderInstance, field : "pendingInvoiceGrandTotal") }
				</td>

				<td class="link">
					<g:link controller="order" action="show" id="${orderInstance.id}"
						class="lnk">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pgn">
	<bootstrap:paginate params="${filterParams}"
		total="${orderInstanceTotal?orderInstanceTotal:organizationInstance?.orders?.size()}" />
</div>