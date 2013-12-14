<%@page import="com.esms.model.product.Product"%>

<div class="table-responsive">
	<table class="table table-striped table-condensed table-bordered">
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
	
				<th>
					Percentage
				</th>
				
				<th>
					Invoiced Amount
				</th>
			</tr>
		</thead>
		<tbody id="invoiceLines">
			<g:each in="${invoiceInstance?.invoiceLines.sort{a,b -> a.lineNumber <=> b.lineNumber}}" var="invoiceLineInstance" status="index">
				<tr>
					<td>
						<g:textField readonly="readonly" name="invoice[${index}].lineNumber" 
							value="${invoiceLineInstance.lineNumber}" size="3" class="col-md-12 input-sm"/>
					</td>
	
					<td><g:hiddenField name="invoice[${index}].productNumber"
							value="${invoiceLineInstance.productNumber}" /> 
						${Product.findByProductNumber(invoiceLineInstance.productNumber)?.productName}
					</td>
	
					<td>
						<g:field id="quantity${index}" data-index="${index}" name="invoice[${index}].quantity" value="${invoiceLineInstance.quantity}" size="3" class="col-md-12 input-sm calc"
								type="number" step="any" required="true"/>
					</td>
	
					<td>
						<g:field id="unitPrice${index}" data-index="${index}" name="invoice[${index}].unitPrice" value="${invoiceLineInstance.unitPrice}" size="3" class="col-md-12 input-sm calc"
								type="number" step="any" required="true"/>
					</td>
	
					<td>
						<g:field id="tax${index}" data-index="${index}" name="invoice[${index}].tax" value="${invoiceLineInstance.tax}" size="3" class="col-md-12 calc"
								type="number" step="any" required="true"/>
					</td>
	
					<td>
						<g:field id="discount${index}" data-index="${index}" name="invoice[${index}].discount" value="${invoiceLineInstance.discount}" size="3" class="col-md-12 input-sm calc"
								type="number" step="any" required="true"/>
					</td>
					
					<td>
						<g:field id="lineTotalAmount${index}" data-index="${index}" name="invoice[${index}].lineTotalAmount" value="${invoiceLineInstance.lineTotalAmount}" size="3" class="col-md-12 input-sm calc"
							readonly="readonly"	type="number" step="any" required="true"/>
					</td>
					
					<td>
						<g:field id="percentageInvoiced${index}" data-index="${index}" name="invoice[${index}].percentageInvoiced" value="${invoiceLineInstance.percentageInvoiced}" size="3" class="col-md-12 calc"
							type="number" min="0" max="${invoiceLineInstance.percentageInvoiced}" step="any" required="true"/>
					</td>
					
					<td>
						<g:field id="amountInvoiced${index}" data-index="${index}" name="invoice[${index}].amountInvoiced" value="${invoiceLineInstance.amountInvoiced}" size="3" class="col-md-12 input-sm calc amountInvoiced"
							type="number" step="any" required="true"/>
					</td>
	
				</tr>
			</g:each>
		</tbody>
	</table>
</div>