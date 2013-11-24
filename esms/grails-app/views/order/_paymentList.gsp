<!-- Quotes -->
<table class="table table-striped table-hover">
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
			
			<th>
				Reference Order Number
			</th>	
		</tr>
	</thead>
	<tbody>
		<g:each in="${orderInstance?.paymentItems}" var="paymentItemInstance">
			<tr>
				<td class="link">
					<g:link action="show" controller="payment"
						id="${paymentItemInstance.payment?.id}">
							${paymentItemInstance.payment?.paymentNumber}
					</g:link>
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
				
				<td>
					<g:if test="${paymentInstance?.paymentItems()?.size() != 0}">
						${paymentInstance?.paymentItems()?.first().invoice?.referenceOrderNumber}
					</g:if>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${orderInstance?.paymentItems?.size()}" />
</div>