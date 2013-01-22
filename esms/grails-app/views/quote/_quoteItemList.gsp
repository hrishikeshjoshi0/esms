<div class="pull-right">
	<a data-toggle="modal" href="#" data-target="#quoteItemModal" role="button"
		class="btn"> <i class="icon-plus"></i> New Item
	</a>
</div>

<!-- Quotes -->
<table class="table table-striped table-hover">
	<thead>
		<tr>

			<g:sortableColumn property="lineNumber"
				title="${message(code: 'quoteItem.lineNumber.label', default: 'Line Number')}" />

			<g:sortableColumn property="productNumber"
				title="${message(code: 'quoteItem.productNumber.label', default: 'Product Number')}" />
				
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
		</tr>
	</thead>
	<tbody>
		<g:each in="${quoteInstance.quoteItems}" var="quoteItemInstance">
			<tr>

				<td>
					${fieldValue(bean: quoteItemInstance, field: "lineNumber")}
				</td>
				
				<td>
					${fieldValue(bean: quoteItemInstance, field: "productNumber")}
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

				<td class="link"><g:link action="show" controller="quoteItem"
						id="${quoteItemInstance.id}" class="btn btn-small">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${quoteInstance.quoteItems?quoteInstance.quoteItems:0}" />
</div>

<!-- Modal -->
<div id="quoteItemModal" class="modal hide fade" tabindex="-1" role="dialog"
	data-remote="<g:createLink controller="quote" action="createQuoteItem" params="[quoteId:quoteInstance?.id]"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Quote Item</h3>
	</div>
	<g:form controller="quote" action="createQuoteItem" method="POST">
		<g:hiddenField name="quote.id"
			value="${quoteInstance?.id}" />
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