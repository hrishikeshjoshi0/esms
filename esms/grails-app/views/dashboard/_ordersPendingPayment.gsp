<%@ page import="com.esms.model.order.*"%>

<div class="page-header">
	<h1>Open Orders</h1>
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
				${message(code: 'order.grandTotal.label', default: 'Grand Total')}
			</th>
			
			<th>
				${message(code: 'order.openGrandTotal.label', default: 'Pending Amount')}
			</th>
			
			<th>
				${message(code: 'order.receviedGrandTotal.label', default: 'Received Amount')}
			</th>	

			<th>
				${message(code: 'order.type.label', default: 'Order Type')}
			</th>	

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
						${fieldValue(bean : orderInstance, field : "grandTotal") }
					</td>
					
					<td>
						${fieldValue(bean : orderInstance, field : "openGrandTotal") }
					</td>
					
					<td>
						${fieldValue(bean : orderInstance, field : "receviedGrandTotal") }
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
				<th colspan="7">
					<h4 style="color: red;">No Records Found !</h4>
				</th>
			</tr>
		</g:else>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="7" class="link">
				<g:link controller="order" action="ordersPendingPayment">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
