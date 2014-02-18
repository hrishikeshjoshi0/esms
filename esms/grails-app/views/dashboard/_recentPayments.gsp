<%@ page import="com.esms.model.payment.Payment" %>

<div class="page-header">
	<h3>Recent Payments</h3>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'payment.paymentNumber.label', default: 'Payment Number')}
			</th>
				
			<th>
				Organization
			</th>

			<th>
				${message(code: 'paymentItem.invoiceNumber.label', default: 'Invoice Number')}
			</th>
			
			<th>
				${message(code: 'paymentItem.amount.label', default: 'Amount')} 
			</th>	

			<th>
				${message(code: 'payment.paymentMethod.label', default: 'Payment Type')}
			</th>	

			<th>
				${message(code: 'payment.chequeNumber.label', default: 'Cheque Number')}
			</th>
				
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentPayments.sort{a,b -> a.paymentNumber <=> b.paymentNumber}}" var="paymentInstance">
			<g:each in="${paymentInstance?.paymentItems}"
				var="paymentItemInstance">
				<tr>
					<td>
						<g:link controller="payment" action="show" class="lnk "
							id="${paymentInstance.id}">
							${fieldValue(bean: paymentInstance, field: "paymentNumber")}
						</g:link>
					</td>
					
					<td>
						${paymentItemInstance?.invoice?.organization?.name}
					</td>

					<td>
						${paymentItemInstance?.invoice?.invoiceNumber}
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
				</tr>
			</g:each>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="6" class="link">
				<g:link controller="payment" action="list" class="lnk ">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>