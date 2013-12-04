
<%@ page import="com.esms.model.payment.PaymentItem" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'paymentItem.label', default: 'PaymentItem')}" />
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
						
							<g:sortableColumn property="lineNumber" title="${message(code: 'paymentItem.lineNumber.label', default: 'Line Number')}" />
						
							<g:sortableColumn property="orderNumber" title="${message(code: 'paymentItem.orderNumber.label', default: 'Order Number')}" />
						
							<g:sortableColumn property="amount" title="${message(code: 'paymentItem.amount.label', default: 'Amount')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'paymentItem.description.label', default: 'Description')}" />
						
							<th class="header"><g:message code="paymentItem.payment.label" default="Payment" /></th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${paymentItemInstanceList}" var="paymentItemInstance">
						<tr>
						
							<td>${fieldValue(bean: paymentItemInstance, field: "lineNumber")}</td>
						
							<td>${fieldValue(bean: paymentItemInstance, field: "orderNumber")}</td>
						
							<td>${fieldValue(bean: paymentItemInstance, field: "amount")}</td>
						
							<td>${fieldValue(bean: paymentItemInstance, field: "description")}</td>
						
							<td>${fieldValue(bean: paymentItemInstance, field: "payment")}</td>
						
							<td class="link">
								<g:link action="show" id="${paymentItemInstance.id}" class="btn btn-default btn-xs">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${paymentItemInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
