

<%@ page import="com.esms.model.quote.QuoteItem" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'quoteItem.label', default: 'QuoteItem')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>

			<dl class="dl-horizontal">
				
							<dt><g:message code="quoteItem.lineNumber.label" default="Line Number" /></dt>
						
							<dd><g:fieldValue bean="${quoteItemInstance}" field="lineNumber"/></dd>
						
				
							<dt><g:message code="quoteItem.quantity.label" default="Quantity" /></dt>
						
							<dd><g:fieldValue bean="${quoteItemInstance}" field="quantity"/></dd>
						
				
							<dt><g:message code="quoteItem.unitPrice.label" default="Unit Price" /></dt>
						
							<dd><g:fieldValue bean="${quoteItemInstance}" field="unitPrice"/></dd>
						
				
							<dt><g:message code="quoteItem.tax.label" default="Tax" /></dt>
						
							<dd><g:fieldValue bean="${quoteItemInstance}" field="tax"/></dd>
						
				
							<dt><g:message code="quoteItem.lineTotalAmount.label" default="Line Total Amount" /></dt>
						
							<dd><g:fieldValue bean="${quoteItemInstance}" field="lineTotalAmount"/></dd>
						
				
							<dt><g:message code="quoteItem.discount.label" default="Discount" /></dt>
						
							<dd><g:fieldValue bean="${quoteItemInstance}" field="discount"/></dd>
						
				
							<dt><g:message code="quoteItem.productNumber.label" default="Product Number" /></dt>
						
							<dd><g:fieldValue bean="${quoteItemInstance}" field="productNumber"/></dd>
						
				
							<dt><g:message code="quoteItem.quote.label" default="Quote" /></dt>
						
							<dd><g:link controller="quote" action="show" id="${quoteItemInstance?.quote?.id}">${quoteItemInstance?.quote?.encodeAsHTML()}</g:link></dd>
						
				
			</dl>

			<g:form>
				<g:hiddenField name="id" value="${quoteItemInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${quoteItemInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>