<%@ page import="com.esms.model.order.*"%>

<div class="page-header">
	<h1>Recent Orders</h1>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'order.orderNumber.label', default: 'Order Number')}
			</th>	

			<th>
				${message(code: 'quote.organization.name.label', default: 'Organization')}
			</th>	

			<th>
				${message(code: 'order.status.label', default: 'Status')}
			</th>	
				
			<th>
				${message(code: 'order.grandTotal.label', default: 'Grand Total')}
			</th>

			<th>
				${message(code: 'order.type.label', default: 'Order Type')}
			</th>
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
				<td>
					${fieldValue(bean: orderInstance, field: "type")}
				</td>
				<td class="link"><g:link controller="order" action="show" id="${orderInstance.id}">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="6" class="link">
				<g:link controller="order" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>