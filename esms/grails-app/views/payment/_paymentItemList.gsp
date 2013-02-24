<g:if test="${paymentInstance?.balanceAmount > 0 }">
<div class="pull-right">
	<a data-toggle="modal" href="#" data-target="#paymentItemModel" role="button"
		class="btn"> <i class="icon-plus"></i> New Line
	</a>
</div>
</g:if>

<table class="table table-striped table-hover">
	<thead>
		<tr>

			<g:sortableColumn property="lineNumber"
				title="${message(code: 'paymentItem.lineNumber.label', default: 'Line Number')}" />

			<g:sortableColumn property="orderNumber"
				title="${message(code: 'paymentItem.order.orderNumber.label', default: 'Order Number')}" />

			<g:sortableColumn property="amount"
				title="${message(code: 'paymentItem.amount.label', default: 'Amount')}" />

			<g:sortableColumn property="description"
				title="${message(code: 'paymentItem.description.label', default: 'Description')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${paymentInstance.paymentItems}" var="paymentItemInstance">
			<tr>

				<td>
					${fieldValue(bean: paymentItemInstance, field: "lineNumber")}
				</td>

				<td>
					${fieldValue(bean: paymentItemInstance, field: "order.orderNumber")}
				</td>

				<td>
					${fieldValue(bean: paymentItemInstance, field: "amount")}
				</td>

				<td>
					${fieldValue(bean: paymentItemInstance, field: "description")}
				</td>

			</tr>
		</g:each>
	</tbody>
</table>

<!-- Modal -->
<div id="paymentItemModel" class="modal hide fade" tabindex="-1" role="dialog"
	data-remote="<g:createLink controller="payment" action="createPaymentItem" params="[paymentId:paymentInstance?.id]"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Payment Item</h3>
	</div>
	<g:form controller="payment" action="createPaymentItem" method="POST">
		<g:hiddenField name="payment.id"
			value="${paymentInstance?.id}" />
		<div class="modal-body"></div>
		<div class="modal-footer">
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">
					<i class="icon-ok icon-white"></i>
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>