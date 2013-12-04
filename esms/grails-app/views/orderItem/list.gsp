
<%@ page import="com.esms.model.order.OrderItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'orderItem.label', default: 'OrderItem')}" />
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
						
							<g:sortableColumn property="lineNumber" title="${message(code: 'orderItem.lineNumber.label', default: 'Line Number')}" />
						
							<g:sortableColumn property="quantity" title="${message(code: 'orderItem.quantity.label', default: 'Quantity')}" />
						
							<g:sortableColumn property="unitPrice" title="${message(code: 'orderItem.unitPrice.label', default: 'Unit Price')}" />
						
							<g:sortableColumn property="tax" title="${message(code: 'orderItem.tax.label', default: 'Tax')}" />
						
							<g:sortableColumn property="lineTotalAmount" title="${message(code: 'orderItem.lineTotalAmount.label', default: 'Line Total Amount')}" />
						
							<g:sortableColumn property="discount" title="${message(code: 'orderItem.discount.label', default: 'Discount')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${orderItemInstanceList}" var="orderItemInstance">
						<tr>
						
							<td>${fieldValue(bean: orderItemInstance, field: "lineNumber")}</td>
						
							<td>${fieldValue(bean: orderItemInstance, field: "quantity")}</td>
						
							<td>${fieldValue(bean: orderItemInstance, field: "unitPrice")}</td>
						
							<td>${fieldValue(bean: orderItemInstance, field: "tax")}</td>
						
							<td>${fieldValue(bean: orderItemInstance, field: "lineTotalAmount")}</td>
						
							<td>${fieldValue(bean: orderItemInstance, field: "discount")}</td>
						
							<td class="link">
								<g:link action="show" id="${orderItemInstance.id}" class="btn btn-default btn-sm">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${orderItemInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
