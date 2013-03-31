<%@page import="com.esms.model.order.Order"%>
<%@ page import="com.esms.model.payment.PaymentItem"%>

<div
	class="control-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'lineNumber', 'error')} required">
	<label for="lineNumber" class="control-label"><g:message
			code="paymentItem.lineNumber.label" default="Line Number" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="lineNumber" required="" readOnly="readOnly"
			value="${paymentItemInstance.lineNumber}" />
		<span class="help-inline"> ${hasErrors(bean: paymentItemInstance, field: 'lineNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'order', 'error')} required">
	<label for="lineNumber" class="control-label"><g:message
			code="paymentItem.order.label" default="Order" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select name="order.id" from="${Order.findAllStatusNotEqual('PAID')}" optionKey="id" class="large"
			optionValue="${{it.orderNumber + ' - ' + it.organization?.externalId + ' : ' + it.organization?.name}}" />
		<span class="help-inline"> ${hasErrors(bean: paymentItemInstance, field: 'order', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'amount', 'error')} required">
	<label for="amount" class="control-label"><g:message
			code="paymentItem.amount.label" default="Amount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="amount" step="any" required=""
			value="${paymentItemInstance.amount}" />
		<span class="help-inline"> ${hasErrors(bean: paymentItemInstance, field: 'amount', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'description', 'error')} required">
	<label for="description" class="control-label"><g:message
			code="paymentItem.description.label" default="Description" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="description" required=""
			value="${paymentItemInstance?.description}" />
		<span class="help-inline"> ${hasErrors(bean: paymentItemInstance, field: 'description', 'error')}
		</span>
	</div>
</div>