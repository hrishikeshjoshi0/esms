<%@ page import="com.esms.model.quote.QuoteItem"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'quoteItem.label', default: 'QuoteItem')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Quote Line #
					<g:fieldValue bean="${quoteItemInstance}" field="lineNumber" />
					|
					<g:link controller="quote" action="show"
						id="${quoteItemInstance?.quote?.id}">
						${quoteItemInstance?.quote?.quoteNumber}
					</g:link>
				</h3>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${quoteItemInstance?.id}" />
				<div class="form-group">
					<g:link class="btn btn-default btn-xs" action="edit" id="${quoteItemInstance?.id}">
						
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-sm btn-danger" type="submit" name="_action_delete">
						
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="quoteItem.lineNumber.label" default="Line Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteItemInstance}" field="lineNumber" />
				</dd>


				<dt>
					<g:message code="quoteItem.quantity.label" default="Quantity" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteItemInstance}" field="quantity" />
				</dd>


				<dt>
					<g:message code="quoteItem.unitPrice.label" default="Unit Price" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteItemInstance}" field="unitPrice" />
				</dd>


				<dt>
					<g:message code="quoteItem.tax.label" default="Tax" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteItemInstance}" field="tax" />
				</dd>


				<dt>
					<g:message code="quoteItem.lineTotalAmount.label"
						default="Line Total Amount" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteItemInstance}" field="lineTotalAmount" />
				</dd>


				<dt>
					<g:message code="quoteItem.discount.label" default="Discount" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteItemInstance}" field="discount" />
				</dd>


				<dt>
					<g:message code="quoteItem.productNumber.label"
						default="Product Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteItemInstance}" field="productNumber" />
				</dd>


				<dt>
					<g:message code="quoteItem.quote.label" default="Quote" />
				</dt>

				<dd>
					<g:link controller="quote" action="show"
						id="${quoteItemInstance?.quote?.id}">
						${quoteItemInstance?.quote?.quoteNumber}
					</g:link>
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>
