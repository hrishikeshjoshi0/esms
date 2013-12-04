
<%@ page import="com.esms.model.quote.QuoteItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'quoteItem.label', default: 'QuoteItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h3>
						<g:message code="default.list.label" args="[entityName]" />
					</h3>
				</div>
				
				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
						
							<g:sortableColumn property="lineNumber" title="${message(code: 'quoteItem.lineNumber.label', default: 'Line Number')}" />
						
							<g:sortableColumn property="quantity" title="${message(code: 'quoteItem.quantity.label', default: 'Quantity')}" />
						
							<g:sortableColumn property="unitPrice" title="${message(code: 'quoteItem.unitPrice.label', default: 'Unit Price')}" />
						
							<g:sortableColumn property="tax" title="${message(code: 'quoteItem.tax.label', default: 'Tax')}" />
						
							<g:sortableColumn property="lineTotalAmount" title="${message(code: 'quoteItem.lineTotalAmount.label', default: 'Line Total Amount')}" />
						
							<g:sortableColumn property="discount" title="${message(code: 'quoteItem.discount.label', default: 'Discount')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${quoteItemInstanceList}" var="quoteItemInstance">
						<tr>
						
							<td>${fieldValue(bean: quoteItemInstance, field: "lineNumber")}</td>
						
							<td>${fieldValue(bean: quoteItemInstance, field: "quantity")}</td>
						
							<td>${fieldValue(bean: quoteItemInstance, field: "unitPrice")}</td>
						
							<td>${fieldValue(bean: quoteItemInstance, field: "tax")}</td>
						
							<td>${fieldValue(bean: quoteItemInstance, field: "lineTotalAmount")}</td>
						
							<td>${fieldValue(bean: quoteItemInstance, field: "discount")}</td>
						
							<td class="link">
								<g:link action="show" id="${quoteItemInstance.id}" class="btn btn-default btn-sm">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${quoteItemInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
