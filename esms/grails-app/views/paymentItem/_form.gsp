<%@page import="com.esms.model.order.Order"%>
<%@page import="com.esms.model.invoice.Invoice"%>
<%@ page import="com.esms.model.payment.PaymentItem"%>

<div
	class="form-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'lineNumber', 'error')} required">
	<label for="lineNumber" class="col-lg-2 control-label"><g:message
			code="paymentItem.lineNumber.label" default="Line Number" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:field type="number" name="lineNumber" required="" readOnly="readOnly"
			value="${paymentItemInstance.lineNumber}" />
		<span class="help-inline"> ${hasErrors(bean: paymentItemInstance, field: 'lineNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'order', 'error')} required">
	<label for="lineNumber" class="col-lg-2 control-label"><g:message
			code="paymentItem.order.label" default="Order" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:select name="invoice.id" from="${pendingInvoices}" optionKey="id" class="large"
			optionValue="${{it.invoiceNumber + ' - ' + ' : ' + it.organization?.name + '(Open Amount :' + it.openGrandTotal + ')' }}" 
			/>
		<span class="help-inline"> ${hasErrors(bean: paymentItemInstance, field: 'order', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'amount', 'error')} required">
	<label for="amount" class="col-lg-2 control-label"><g:message
			code="paymentItem.amount.label" default="Amount" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:field type="number" name="amount" step="any" required=""
			value="${paymentItemInstance.amount}" />
		<span class="help-inline"> ${hasErrors(bean: paymentItemInstance, field: 'amount', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'description', 'error')} required">
	<label for="description" class="col-lg-2 control-label"><g:message
			code="paymentItem.description.label" default="Description" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:textField name="description" required=""
			value="${paymentItemInstance?.description}" />
		<span class="help-inline"> ${hasErrors(bean: paymentItemInstance, field: 'description', 'error')}
		</span>
	</div>
</div>