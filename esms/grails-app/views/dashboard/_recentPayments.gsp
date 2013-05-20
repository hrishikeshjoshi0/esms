<%@ page import="com.esms.model.payment.Payment" %>

<div class="heading clearfix">
	<h3 class="pull-left">Recent Payments</h3>
	<span class="pull-right label label-important"> ${recentPayments?.size()}
		Payments
	</span>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<g:sortableColumn property="paymentNumber"
				title="${message(code: 'payment.paymentNumber.label', default: 'Payment Number')}" />

			<g:sortableColumn property="lineNumber"
				title="${message(code: 'paymentItem.lineNumber.label', default: 'Line Number')}" />

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
		<g:each in="${recentPayments}" var="paymentInstance">
			<g:each in="${paymentInstance?.paymentItems}"
				var="paymentItemInstance">
				<tr>
					<td>
						${fieldValue(bean: paymentInstance, field: "paymentNumber")}
					</td>

					<td>
						${fieldValue(bean: paymentItemInstance, field: "lineNumber")}
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

					<td class="link"><g:link action="show"
							id="${paymentInstance.id}" class="">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
		</g:each>
	</tbody>
</table>