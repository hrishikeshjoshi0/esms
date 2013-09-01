<%@ page import="com.esms.model.payment.Payment"%>

<script>
	$(document).ready(function(){
		$('.chequeFields').hide();
		var val = $('#paymentMethod').val();
		onPaymentMethodChange(val);		
	});

	function onPaymentMethodChange(val) {
		//['CALL','MEETING','MAINTENANCE VISIT','BREAKDOWN CALL']
		if(val == 'CASH') {
			$('.chequeFields').hide();
		} else if(val == 'CHEQUE') {
			$('.chequeFields').show();
		}
	}
</script>	

<g:hiddenField name="organization.id" value="${params.'organization.id'}"/>
<g:hiddenField name="order.id" value="${params.orderId}"/>
<div
	class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentNumber', 'error')} required">
	<label for="paymentNumber" class="control-label"><g:message
			code="payment.paymentNumber.label" default="Payment Number" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="paymentNumber" required="" readOnly="readOnly"
			value="${paymentInstance?.paymentNumber}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'paymentNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentMethod', 'error')} required">
	<label for="paymentMethod" class="control-label"><g:message
			code="payment.paymentMethod.label" default="Payment Method" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select name="paymentMethod" onchange="onPaymentMethodChange(this.value);"
			from="${paymentInstance.constraints.paymentMethod.inList}"
			value="${paymentInstance?.paymentMethod}"
			valueMessagePrefix="payment.paymentMethod" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'paymentMethod', 'error')}
		</span>
	</div>
</div>

<div
	class="chequeFields control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'chequeNumber', 'error')} ">
	<label for="chequeNumber" class="control-label"><g:message
			code="payment.chequeNumber.label" default="Cheque Number" /></label>
	<div class="controls">
		<g:textField name="chequeNumber" 
			value="${paymentInstance?.chequeNumber}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'chequeNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="chequeFields control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'bank', 'error')} ">
	<label for="bank" class="control-label"><g:message
			code="payment.bank.label" default="Bank" /></label>
	<div class="controls">
		<g:textField name="bank" value="${paymentInstance?.bank}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'bank', 'error')}
		</span>
	</div>
</div>

<div
	class="chequeFields control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'branch', 'error')} ">
	<label for="branch" class="control-label"><g:message
			code="payment.branch.label" default="Branch" /></label>
	<div class="controls">
		<g:textField name="branch" value="${paymentInstance?.branch}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'branch', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'totalAmount', 'error')} required">
	<label for="totalAmount" class="control-label"><g:message
			code="payment.totalAmount.label" default="Total Amount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="totalAmount" required=""
			value="${paymentInstance.totalAmount}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'totalAmount', 'error')}
		</span>
	</div>
</div>

<div
	class="chequeFields control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'clearanceDate', 'error')} ">
	<label for="branch" class="control-label"><g:message
			code="payment.clearanceDate.label" default="Clearance Date" /></label>
	<div class="controls">
		<g:datePicker precision="day" name="clearanceDate" value="${paymentInstance?.clearanceDate}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'clearanceDate', 'error')}
		</span>
	</div>
</div>


<%--<div
	class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'balanceAmount', 'error')} required">
	<label for="balanceAmount" class="control-label"><g:message
			code="payment.balanceAmount.label" default="Balance Amount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="balanceAmount" required="" readOnly="readOnly"
			value="${paymentInstance.balanceAmount}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'balanceAmount', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'matchedAmount', 'error')} required">
	<label for="matchedAmount" class="control-label"><g:message
			code="payment.matchedAmount.label" default="Matched Amount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="matchedAmount" required="" readOnly="readOnly"
			value="${paymentInstance.matchedAmount}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'matchedAmount', 'error')}
		</span>
	</div>
</div>
--%>