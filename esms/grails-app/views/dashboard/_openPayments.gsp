<%@ page import="com.esms.model.payment.Payment" %>

<div class="page-header">
	<h3>
		Uncleared Cheques 
	</h3>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				Building Name
			</th>
			
			<th>
				${message(code: 'payment.paymentNumber.label', default: 'Payment Number')}
			</th>	

			<th>
				${message(code: 'paymentItem.orderNumber.label', default: 'Order Number')}
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
				
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${openPayments != null && openPayments.size() != 0}">
			<g:each in="${openPayments}" var="paymentInstance">
				<g:each in="${paymentInstance?.paymentItems}"
					var="paymentItemInstance">
					<tr>
						<td>
							${paymentItemInstance?.invoice?.organization?.name}
						</td>
						
						<td>
							${fieldValue(bean: paymentInstance, field: "paymentNumber")}
						</td>
	
						<td>
							${paymentItemInstance?.invoice?.referenceOrderNumber}
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
								id="${paymentInstance.id}" class="lnk ">Show &raquo;</g:link>
						</td>
					</tr>
				</g:each>
			</g:each>
		</g:if>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="7" class="link">
				<g:link controller="payment" action="openPayments" class="lnk ">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
