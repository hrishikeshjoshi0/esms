<!-- Invoices -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="invoiceNumber"
				title="${message(code: 'invoice.invoiceNumber.label', default: 'Invoice Number')}" />

			<g:sortableColumn property="status"
				title="${message(code: 'invoice.status.label', default: 'Status')}" />

			<g:sortableColumn property="type"
				title="${message(code: 'invoice.type.label', default: 'Type')}" />

			<g:sortableColumn property="issueDate"
				title="${message(code: 'invoice.issueDate.label', default: 'Issue Date')}" />

			<g:sortableColumn property="grandTotal"
				title="${message(code: 'invoice.grandTotal.label', default: 'Grand Total')}" />

			<g:sortableColumn property="receviedGrandTotal"
				title="${message(code: 'invoice.receviedGrandTotal.label', default: 'Received Amount')}" />

			<g:sortableColumn property="openGrandTotal"
				title="${message(code: 'invoice.openGrandTotal.label', default: 'Open Amount')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${invoices?.sort{a,b -> a.invoiceNumber <=> b.invoiceNumber}}" var="invoiceInstance">
			<tr>
				<td>
					${fieldValue(bean: invoiceInstance, field: "invoiceNumber")}
				</td>

				<td>
					${fieldValue(bean: invoiceInstance, field: "status")}
				</td>

				<td>
					${fieldValue(bean: invoiceInstance, field: "type")}
				</td>

				<td><g:formatDate date="${invoiceInstance.issueDate}" /></td>

				<td>
					${fieldValue(bean : invoiceInstance, field : "grandTotal") }
				</td>

				<td>
					${fieldValue(bean : invoiceInstance, field : "receviedGrandTotal") }
				</td>

				<td>
					${fieldValue(bean : invoiceInstance, field : "openGrandTotal") }
				</td>

				<td class="link"><g:link controller="invoice" action="show" id="${invoiceInstance.id}"
						class="lnk">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>