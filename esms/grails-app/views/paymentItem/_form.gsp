<%@ page import="com.esms.model.payment.PaymentItem" %>



			<div class="control-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'lineNumber', 'error')} required">
				<label for="lineNumber" class="control-label"><g:message code="paymentItem.lineNumber.label" default="Line Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="lineNumber" required="" value="${paymentItemInstance.lineNumber}"/>
					<span class="help-inline">${hasErrors(bean: paymentItemInstance, field: 'lineNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'orderNumber', 'error')} required">
				<label for="orderNumber" class="control-label"><g:message code="paymentItem.orderNumber.label" default="Order Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="orderNumber" required="" value="${paymentItemInstance?.orderNumber}"/>
					<span class="help-inline">${hasErrors(bean: paymentItemInstance, field: 'orderNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'amount', 'error')} required">
				<label for="amount" class="control-label"><g:message code="paymentItem.amount.label" default="Amount" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="amount" step="any" required="" value="${paymentItemInstance.amount}"/>
					<span class="help-inline">${hasErrors(bean: paymentItemInstance, field: 'amount', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="paymentItem.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${paymentItemInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: paymentItemInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'payment', 'error')} required">
				<label for="payment" class="control-label"><g:message code="paymentItem.payment.label" default="Payment" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="payment" name="payment.id" from="${com.esms.model.payment.Payment.list()}" optionKey="id" required="" value="${paymentItemInstance?.payment?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: paymentItemInstance, field: 'payment', 'error')}</span>
				</div>
			</div>

