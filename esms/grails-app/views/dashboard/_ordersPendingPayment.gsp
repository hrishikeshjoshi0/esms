<%@ page import="com.esms.model.order.*"%>

<div class="page-header">
	<h1>Open Orders</h1>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<g:sortableColumn property="orderNumber"
				title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />

			<g:sortableColumn property="organization.name"
				title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />

			<g:sortableColumn property="grandTotal"
				title="${message(code: 'order.grandTotal.label', default: 'Grand Total')}" />

			<g:sortableColumn property="type"
				title="${message(code: 'order.type.label', default: 'Order Type')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:if
			test="${ordersPendingPayments != null && ordersPendingPayments.size() != 0}">
			<g:each in="${ordersPendingPayments}" var="orderInstance">
				<tr>
					<td>
						${fieldValue(bean: orderInstance, field: "orderNumber")}
					</td>

					<td><g:link controller="organization" action="show"
							id="${orderInstance?.organization?.id}">
							${fieldValue(bean: orderInstance, field: "organization.name")}
						</g:link></td>

					<td>
						${fieldValue(bean : orderInstance, field : "openGrandTotal") }
					</td>
					<td>
						${fieldValue(bean: orderInstance, field: "type")}
					</td>
					<td class="link"><g:link controller="order" action="show"
							id="${orderInstance.id}">Show &raquo;</g:link></td>
				</tr>
			</g:each>
		</g:if>
		<g:else>
			<tr>
				<th colspan="5">
					<h4 style="color: red;">No Records Found !</h4>
				</th>
			</tr>
		</g:else>
	</tbody>
</table>