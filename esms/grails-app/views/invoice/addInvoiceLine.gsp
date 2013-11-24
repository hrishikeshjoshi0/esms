<%@page import="com.esms.model.product.Product"%>

<g:each in="${invoiceLines}" var="invoiceLineInstance"
	status="index">
	<tr>
		<td><g:textField readonly="readonly"
				name="invoice[${index}].lineNumber"
				value="${invoiceLineInstance.lineNumber}" size="3"
				class="input-mini " /></td>

		<td><g:textField name="invoice[${index}].productNumber"
				value="${invoiceLineInstance.productNumber}" size="3"
				class="input-mini" /> <br /> <g:set var="product"
				value="${Product.findByProductNumber(invoiceLineInstance.productNumber)}" />
			${product.productName}</td>

		<td><g:field id="quantity${index}" data-index="${index}"
				name="invoice[${index}].quantity"
				value="${invoiceLineInstance.quantity}" size="3"
				class="input-mini calc" type="number" step="any" required="true" />
		</td>

		<td><g:field id="unitPrice${index}" data-index="${index}"
				name="invoice[${index}].unitPrice"
				value="${invoiceLineInstance.unitPrice}" size="3"
				class="input-mini calc" type="number" step="any" required="true" />
		</td>

		<td><g:field id="tax${index}" data-index="${index}"
				name="invoice[${index}].tax" value="${invoiceLineInstance.tax}"
				size="3" class="input-mini calc" type="number" step="any"
				required="true" /></td>

		<td><g:field id="discount${index}" data-index="${index}"
				name="invoice[${index}].discount"
				value="${invoiceLineInstance.discount}" size="3"
				class="input-mini calc" type="number" step="any" required="true" />
		</td>

		<td><g:field id="lineTotalAmount${index}" data-index="${index}"
				name="invoice[${index}].lineTotalAmount"
				value="${invoiceLineInstance.lineTotalAmount}" size="3"
				class="input-mini calc" readonly="readonly" type="number" step="any"
				required="true" /></td>

		<td><g:field id="percentageInvoiced${index}"
				data-index="${index}" name="invoice[${index}].percentageInvoiced"
				value="${invoiceLineInstance.percentageInvoiced}" size="3"
				class="input-mini calc" type="number" min="0"
				max="${invoiceLineInstance.percentageInvoiced}" step="any"
				required="true" /></td>

		<td><g:field id="amountInvoiced${index}" data-index="${index}"
				name="invoice[${index}].amountInvoiced"
				value="${invoiceLineInstance.amountInvoiced}" size="3"
				class="input-mini calc" type="number" step="any" required="true" />
		</td>

	</tr>
</g:each>