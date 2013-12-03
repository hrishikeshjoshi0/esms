<!-- Quotes -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="payment"
				title="${message(code: 'paymentItem.payment.paymentNumber.label', default: 'Payment Number')}" />
			
			<g:sortableColumn property="paymentMethod"
				title="${message(code: 'paymentItem.payment.paymentMethod.label', default: 'Payment Method')}" />	
			
			<g:sortableColumn property="chequeNumber"
				title="${message(code: 'paymentItem.payment.chequeNumber.label', default: 'Cheque Number')}" />
			
			<g:sortableColumn property="bank"
				title="${message(code: 'paymentItem.payment.bank.label', default: 'Bank')}" />
				
			<g:sortableColumn property="amount"
				title="${message(code: 'paymentItem.amount.label', default: 'Amount')}" />
		</tr>
	</thead>
	<tbody>
		<g:each in="${invoiceInstance?.paymentItems}" var="paymentItemInstance">
			<tr>
				<td class="link">
					${paymentItemInstance.payment?.paymentNumber}
				</td>
				
				<td>
					${paymentItemInstance.payment?.paymentMethod}
				</td>
				
				<td>
					<g:if test="${paymentItemInstance.payment?.paymentMethod == 'CHEQUE'}">
						${paymentItemInstance.payment?.chequeNumber}
					</g:if>
					<g:else>
						N/A
					</g:else>
				</td>
				
				<td>
					<g:if test="${paymentItemInstance.payment?.paymentMethod == 'CHEQUE'}">
						${paymentItemInstance.payment?.bank}
					</g:if>
					<g:else>
						N/A
					</g:else>	
				</td>
				
				<td>
					${fieldValue(bean: paymentItemInstance, field: "amount")}
				</td>
				
				<td class="link">
					<g:link action="show" controller="payment" id="${paymentItemInstance.payment?.id}" class="btn btn-default btn-sm">
						Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${invoiceInstance?.paymentItems?.size()}" />
</div>