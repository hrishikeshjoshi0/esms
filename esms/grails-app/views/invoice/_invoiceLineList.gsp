<table class="table table-striped table-hover">
	<thead>
		<tr>

			<g:sortableColumn property="lineNumber" 
				title="${message(code: 'invoiceLine.lineNumber.label', default: 'Line Number')}" />

			<g:sortableColumn property="productNumber"
				title="${message(code: 'invoiceLine.productNumber.label', default: 'Product Number')}" />

			<g:sortableColumn property="quantity"
				title="${message(code: 'invoiceLine.quantity.label', default: 'Quantity')}" />

			<g:sortableColumn property="unitPrice"
				title="${message(code: 'invoiceLine.unitPrice.label', default: 'Unit Price')}" />

			<g:sortableColumn property="tax"
				title="${message(code: 'invoiceLine.tax.label', default: 'Tax')}" />

			<g:sortableColumn property="discount"
				title="${message(code: 'invoiceLine.discount.label', default: 'Discount')}" />
				
			<g:sortableColumn property="lineTotalAmount"
				title="${message(code: 'invoiceLine.lineTotalAmount.label', default: 'Line Total Amount')}" />
				
			<g:sortableColumn property="percentageInvoiced"
				title="${message(code: 'invoiceLine.percentageInvoiced.label', default: 'Invoiced Line Total Amount (%)')}" />
			
			<g:sortableColumn property="amountInvoiced"
				title="${message(code: 'invoiceLine.amountInvoiced.label', default: 'Line Total Amount Invoiced')}" />
						

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${invoiceInstance?.invoiceLines}" var="invoiceLineInstance" status="index">
			<tr>
				<td>
					${invoiceLineInstance.lineNumber}
				</td>
				
				<td>
					${invoiceLineInstance.productNumber}
				</td>

				<td>
					${invoiceLineInstance.quantity}
				</td>

				<td>
					${invoiceLineInstance.unitPrice}
				</td>

				<td>
					${invoiceLineInstance.tax}
				</td>

				<td>
					${invoiceLineInstance.discount}
				</td>
				
				<td>
					${invoiceLineInstance.lineTotalAmount}
				</td>
				
				<td>
					${invoiceLineInstance.percentageInvoiced}
				</td>
				
				<td>
					${invoiceLineInstance.amountInvoiced}
				</td>
			</tr>
		</g:each>
	</tbody>
</table>