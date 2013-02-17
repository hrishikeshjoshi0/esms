<%@ page import="com.esms.model.payment.Payment" %>



			<div class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentNumber', 'error')} required">
				<label for="paymentNumber" class="control-label"><g:message code="payment.paymentNumber.label" default="Payment Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="paymentNumber" required="" value="${paymentInstance?.paymentNumber}"/>
					<span class="help-inline">${hasErrors(bean: paymentInstance, field: 'paymentNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentType', 'error')} ">
				<label for="paymentType" class="control-label"><g:message code="payment.paymentType.label" default="Payment Type" /></label>
				<div class="controls">
					<g:select name="paymentType" from="${paymentInstance.constraints.paymentType.inList}" value="${paymentInstance?.paymentType}" valueMessagePrefix="payment.paymentType" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: paymentInstance, field: 'paymentType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'checkNumber', 'error')} required">
				<label for="checkNumber" class="control-label"><g:message code="payment.checkNumber.label" default="Check Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="checkNumber" required="" value="${paymentInstance?.checkNumber}"/>
					<span class="help-inline">${hasErrors(bean: paymentInstance, field: 'checkNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'status', 'error')} required">
				<label for="status" class="control-label"><g:message code="payment.status.label" default="Status" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="status" required="" value="${paymentInstance?.status}"/>
					<span class="help-inline">${hasErrors(bean: paymentInstance, field: 'status', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'description', 'error')} required">
				<label for="description" class="control-label"><g:message code="payment.description.label" default="Description" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="description" required="" value="${paymentInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: paymentInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'totalAmount', 'error')} required">
				<label for="totalAmount" class="control-label"><g:message code="payment.totalAmount.label" default="Total Amount" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="totalAmount" step="any" required="" value="${paymentInstance.totalAmount}"/>
					<span class="help-inline">${hasErrors(bean: paymentInstance, field: 'totalAmount', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'balanceAmount', 'error')} required">
				<label for="balanceAmount" class="control-label"><g:message code="payment.balanceAmount.label" default="Balance Amount" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="balanceAmount" step="any" required="" value="${paymentInstance.balanceAmount}"/>
					<span class="help-inline">${hasErrors(bean: paymentInstance, field: 'balanceAmount', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'paidAmount', 'error')} required">
				<label for="paidAmount" class="control-label"><g:message code="payment.paidAmount.label" default="Paid Amount" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="paidAmount" step="any" required="" value="${paymentInstance.paidAmount}"/>
					<span class="help-inline">${hasErrors(bean: paymentInstance, field: 'paidAmount', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentItems', 'error')} ">
				<label for="paymentItems" class="control-label"><g:message code="payment.paymentItems.label" default="Payment Items" /></label>
				<div class="controls">
					
<ul class="one-to-many">
<g:each in="${paymentInstance?.paymentItems?}" var="p">
    <li><g:link controller="paymentItem" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="paymentItem" action="create" params="['payment.id': paymentInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'paymentItem.label', default: 'PaymentItem')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: paymentInstance, field: 'paymentItems', 'error')}</span>
				</div>
			</div>

