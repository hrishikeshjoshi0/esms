<%@ page import="com.esms.model.payment.Payment" %>

<div class="dashboard-widget-header">
	<h1>Recent Payments</h1>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'payment.paymentNumber.label', default: 'Payment Number')}
			</th>	

			<th>
				${message(code: 'paymentItem.invoiceNumber.label', default: 'Invoice Number')}
			</th>
			
			<th>
				${message(code: 'paymentItem.orderNumber.label', default: 'Order Number')}
			</th>	

			<th>
				Customer
			</th>

			<th>
				${message(code: 'paymentItem.amount.label', default: 'Amount')}" 
			</th>	

			<th>
				${message(code: 'payment.paymentMethod.label', default: 'Payment Type')}
			</th>	

			<th>
				${message(code: 'payment.chequeNumber.label', default: 'Cheque Number')}
			</th>
				
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentPayments}" var="paymentInstance">
			<g:each in="${paymentInstance?.paymentItems}"
				var="paymentItemInstance">
				<tr>
					<td>
						${fieldValue(bean: paymentInstance, field: "paymentNumber")}
					</td>

					<td>
						${paymentItemInstance?.invoice?.invoiceNumber}
					</td>
					
					<td>
						${paymentItemInstance?.invoice?.referenceOrderNumber}
					</td>

					<td>
						${paymentItemInstance?.invoice?.organization?.name}
					</td>

					<td>
						${fieldValue(bean: paymentItemInstance, field: "amount")}
					</td>

					<td>
						${fieldValue(bean: paymentInstance, field: "paymentMethod")}
					</td>

					<td>
						${fieldValue(bean: paymentInstance, field: "chequeNumber")}
					</td>

					<td class="link"><g:link controller="payment" action="show" 
							id="${paymentInstance.id}" class="">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="8" class="link">
				<g:link controller="payment" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>