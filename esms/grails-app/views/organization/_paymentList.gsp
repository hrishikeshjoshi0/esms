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
				
			<th>
			</th>	
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.payments}" var="paymentInstance">
			<tr>
				<td class="link">
					<g:link action="show" controller="payment"
						id="${paymentInstance?.id}">
							${paymentInstance?.paymentNumber}
					</g:link>
				</td>
				
				<td>
					${paymentInstance?.paymentMethod}
				</td>
				
				<td>
					<g:if test="${paymentInstance?.paymentMethod == 'CHEQUE'}">
						${paymentInstance?.chequeNumber}
					</g:if>
					<g:else>
						N/A
					</g:else>
				</td>
				
				<td>
					<g:if test="${paymentInstance?.paymentMethod == 'CHEQUE'}">
						${paymentInstance?.bank}
					</g:if>
					<g:else>
						N/A
					</g:else>	
				</td>
				
				<td>
					${fieldValue(bean: paymentInstance, field: "totalAmount")}
				</td>
				
				<td>
					<g:if test="${paymentInstance?.paymentItems?.size() != 0}">
						${paymentInstance?.paymentItems?.first().invoice?.referenceOrderNumber}
					</g:if>
				</td>
				
				<td class="link"><g:link controller="payment" action="show" 
								id="${paymentInstance.id}" class="">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${organizationInstance?.payments?.size()}" />
</div>