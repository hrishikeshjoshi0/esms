<%@ page import="com.esms.model.product.Product" %>
<g:if test="${quoteInstance?.status != 'CONVERTED_TO_SERVICE_CONTRACT' && quoteInstance?.status != 'CONVERTED_TO_SALES_ORDER' }">
	<div class="pull-right">
		<modalbox:createLink controller="quote" action="createQuoteItem" params="['quote.id':quoteInstance?.id]" 
			title="Create Quote Item" width="900">New Quote Item</modalbox:createLink>
	</div>
</g:if>

<!-- Quotes -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>

			<g:sortableColumn property="lineNumber"
				title="${message(code: 'quoteItem.lineNumber.label', default: 'Line Number')}" />

			<g:sortableColumn property="productNumber"
				title="${message(code: 'quoteItem.productNumber.label', default: 'Product')}" />
				
			<g:sortableColumn property="quantity"
				title="${message(code: 'quoteItem.quantity.label', default: 'Quantity')}" />

			<g:sortableColumn property="unitPrice"
				title="${message(code: 'quoteItem.unitPrice.label', default: 'Unit Price')}" />

			<g:sortableColumn property="tax"
				title="${message(code: 'quoteItem.tax.label', default: 'Tax')}" />

			<g:sortableColumn property="discount"
				title="${message(code: 'quoteItem.discount.label', default: 'Discount')}" />
			
			<g:sortableColumn property="lineTotalAmount"
				title="${message(code: 'quoteItem.lineTotalAmount.label', default: 'Line Total Amount')}" />

			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${quoteInstance.quoteItems}" var="quoteItemInstance">
			<tr>

				<td>
					${fieldValue(bean: quoteItemInstance, field: "lineNumber")}
				</td>
				
				<td>
					${fieldValue(bean: quoteItemInstance, field: "productNumber")} <br/>
					${Product.findByProductNumber(quoteItemInstance.productNumber)?.productName}
				</td>

				<td>
					${fieldValue(bean: quoteItemInstance, field: "quantity")}
				</td>

				<td>
					${fieldValue(bean: quoteItemInstance, field: "unitPrice")}
				</td>

				<td>
					${fieldValue(bean: quoteItemInstance, field: "tax")}
				</td>
				
				<td>
					${fieldValue(bean: quoteItemInstance, field: "discount")}
				</td>

				<td>
					${fieldValue(bean: quoteItemInstance, field: "lineTotalAmount")}
				</td>

				<td class="link">
					<g:link action="deleteQuoteItem" id="${quoteItemInstance?.id}">
						<i class="glyphicon glyphicon-trash"></i>
					</g:link>
				</td>
				
				<td class="link"><g:link action="show" controller="quoteItem"
						id="${quoteItemInstance.id}" class="btn btn-default btn-sm">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${quoteInstance.quoteItems?quoteInstance.quoteItems:0}" />
</div>