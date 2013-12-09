<%@page import="com.esms.model.order.Order"%>
<div class="pull-right">
	<a href="<g:createLink controller="order" action="create" params="[type:'SERVICE']"/>"
		role="button" class="btn btn-default btn-sm">  New Order
	</a>
</div>

<g:set var="serviceOrders" value="${Order.findAllWhere(relatedTo:'CONTRACT',relatedToValue:contractInstance?.contractNumber,organization:contractInstance?.organization,type:'SALES') }"/>

<!-- Orders -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="orderNumber"
				title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />
			<g:sortableColumn property="status"
				title="${message(code: 'order.status.label', default: 'Status')}" />
			<g:sortableColumn property="issueDate"
				title="${message(code: 'order.issueDate.label', default: 'Issue Date')}" />
			<g:sortableColumn property="expiryDate"
				title="${message(code: 'order.expiryDate.label', default: 'Expiry Date')}" />
			<g:sortableColumn property="description"
				title="${message(code: 'order.description.label', default: 'Description')}" />
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${serviceOrders}" var="orderInstance">
			<tr>
				<td>
					${fieldValue(bean: orderInstance, field: "orderNumber")}
				</td>
				<td>
					${fieldValue(bean: orderInstance, field: "status")}
				</td>
				<td><g:formatDate date="${orderInstance.issueDate}" /></td>
				<td><g:formatDate date="${orderInstance.expiryDate}" /></td>
				<td>
					${fieldValue(bean: orderInstance, field: "description")}
				</td>
				<td class="link"><g:link controller="order" action="show" id="${orderInstance.id}"
						class="btn btn-default btn-sm">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pgn">
	<bootstrap:paginate total="${serviceOrders?serviceOrders.size():0}" />
</div>
