<%@ page import="com.esms.model.payment.Payment" %>

<div class="page-header">
	<h1>Open Payments</h1>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<g:sortableColumn property="paymentNumber"
				title="${message(code: 'payment.paymentNumber.label', default: 'Payment Number')}" />

			<g:sortableColumn property="orderNumber"
				title="${message(code: 'paymentItem.orderNumber.label', default: 'Order Number')}" />

			<g:sortableColumn property="organization.name" title="Customer" />

			<g:sortableColumn property="amount"
				title="${message(code: 'paymentItem.amount.label', default: 'Amount')}" />

			<g:sortableColumn property="paymentMethod"
				title="${message(code: 'payment.paymentMethod.label', default: 'Payment Type')}" />

			<g:sortableColumn property="chequeNumber"
				title="${message(code: 'payment.chequeNumber.label', default: 'Cheque Number')}" />
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
							${fieldValue(bean: paymentInstance, field: "paymentNumber")}
						</td>
	
						<td>
							${paymentItemInstance?.order?.orderNumber}
						</td>
	
						<td>
							${paymentItemInstance?.order?.organization?.name}
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
		</g:if>
		<g:else>
			<tr>
				<th colspan="5">
					<h4 style="color: red;">No Records Found !</h4>
				</th>
			</tr>
		</g:else>
	</tbody>
</table>