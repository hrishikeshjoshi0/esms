<%@ page import="com.esms.model.order.*"%>

<div class="heading clearfix">
	<h3 class="pull-left">Recent Orders</h3>
	<span class="pull-right label label-important"> ${recentOrders?.size()}
		Orders
	</span>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<g:sortableColumn property="orderNumber"
				title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />

			<g:sortableColumn property="organization.name"
				title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />

			<g:sortableColumn property="status"
				title="${message(code: 'order.status.label', default: 'Status')}" />

			<g:sortableColumn property="openGrandTotal"
				title="${message(code: 'order.openGrandTotal.label', default: 'Open Amount')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentOrders}" var="orderInstance">
			<tr>
				<td>
					${fieldValue(bean: orderInstance, field: "orderNumber")}
				</td>

				<td><g:link controller="organization" action="show"
						id="${orderInstance?.organization?.id}">
						${fieldValue(bean: orderInstance, field: "organization.name")}
					</g:link></td>
				<td>
					${fieldValue(bean: orderInstance, field: "status")}
				</td>
				<td>
					${fieldValue(bean : orderInstance, field : "openGrandTotal") }
				</td>
				<td class="link"><g:link controller="order" action="show" id="${orderInstance.id}">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>