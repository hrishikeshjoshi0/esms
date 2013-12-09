<%@page import="com.esms.model.order.Order"%>
<div class="pull-right">
	<a
		href="<g:createLink controller="order" action="create" params="[type:'REPAIR']"/>"
		role="button" class="btn btn-default btn-sm">  New Order
	</a>
</div>

<g:set var="serviceOrders"
	value="${Order.findAllWhere(organization:organizationInstance,type:'REPAIR') }" />
<!-- Orders -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="orderNumber"
				title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />

			<g:sortableColumn property="organization.name"
				title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />

			<g:sortableColumn property="status"
				title="${message(code: 'order.status.label', default: 'Status')}" />

			<g:sortableColumn property="type"
				title="${message(code: 'order.type.label', default: 'Type')}" />

			<g:sortableColumn property="issueDate"
				title="${message(code: 'order.issueDate.label', default: 'Issue Date')}" />

			<g:sortableColumn property="grandTotal"
				title="${message(code: 'order.grandTotal.label', default: 'Grand Total')}" />

			<g:sortableColumn property="openGrandTotal"
				title="${message(code: 'order.openGrandTotal.label', default: 'Open Amount')}" />

			<g:sortableColumn property="receviedGrandTotal"
				title="${message(code: 'order.receviedGrandTotal.label', default: 'Received Amount')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${serviceOrders}" var="orderInstance">
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
					${fieldValue(bean: orderInstance, field: "type")}
				</td>

				<td><g:formatDate date="${orderInstance.issueDate}" /></td>

				<td>
					${fieldValue(bean : orderInstance, field : "grandTotal") }
				</td>

				<td>
					${fieldValue(bean : orderInstance, field : "openGrandTotal") }
				</td>

				<td>
					${fieldValue(bean : orderInstance, field : "receviedGrandTotal") }
				</td>

				<td class="link"><g:link action="show" controller="order"  id="${orderInstance.id}"
						class="lnk">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pgn">
	<bootstrap:paginate total="${serviceOrders?serviceOrders.size():0}" />
</div>
