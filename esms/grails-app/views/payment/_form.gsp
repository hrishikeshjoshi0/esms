<%@ page import="com.esms.model.payment.Payment"%>

<script>
	$(document).ready(function(){
		$('.chequeFields').hide();
		var val = $('#paymentMethod').val();
		onPaymentMethodChange(val);	

		fetchInvoiceInfo($("#invoiceId").val())
		
		$("#invoiceId").change(function() {
			fetchInvoiceInfo($(this).val())			
		});	
	});

	function fetchInvoiceInfo(id) {
		if(id == null) {
			$.growl.error({ title: "Error!", message: "There are no unpaid invoices." });
			return;
		}
		var url = "${createLink(controller:'invoice', action:'show')}" + "/" + id;
		$.ajax({
		    url:url,
		    dataType: 'json',	
		    success: function(data) {
		    	$("#totalAmount").val(data.openGrandTotal); 
		    },
		    error: function(request, status, error) {
		    	$.growl.error({ title: "Error!", message: "There was some technical error." });
		    },
		    complete: function() {
		    }
		});
	}
	
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

<!-- Row 1 -->
<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentNumber', 'error')} required">
			<label for="paymentNumber" class="col-md-3 control-label"><g:message
					code="payment.paymentNumber.label" default="Payment Number" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:textField name="paymentNumber" required="" readOnly="readOnly" class="form-control"
					value="${paymentInstance?.paymentNumber}" />
				<span class="help-inline">
					${hasErrors(bean: paymentInstance, field: 'paymentNumber', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: paymentItemInstance, field: 'order', 'error')} required">
			<label for="invoiceId" class="col-md-3 control-label">
				Invoice
			</label>
			<div class="col-md-9">
				<g:if test="${invoice}">
					<g:hiddenField id="invoiceIdHdn" name="invoiceId" value="${invoice.id}"/>
					<g:textField name="invoiceNumber" required="" readOnly="readOnly" class="form-control"
							value="${invoice.invoiceNumber + ' - ' + ' : ' + invoice.organization?.name + '(Open Amount :' + invoice.openGrandTotal + ')' }" />
				</g:if>
				<g:else>
					<g:select id="invoiceId" name="invoiceId" from="${pendingInvoices}" optionKey="id" class="form-control"
						optionValue="${{it.invoiceNumber + ' - ' + ' : ' + it.organization?.name + '(Open Amount :' + it.openGrandTotal + ')' }}"/>
					<span class="help-inline"> ${hasErrors(bean: paymentItemInstance, field: 'order', 'error')}
					</span>
				</g:else>
			</div>
		</div>
	</div>
</div>

<!-- 2nd Row -->
<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'paymentMethod', 'error')} required">
			<label for="paymentMethod" class="col-md-3 control-label"><g:message
					code="payment.paymentMethod.label" default="Payment Method" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:select name="paymentMethod" onchange="onPaymentMethodChange(this.value);" class="form-control"
					from="${paymentInstance.constraints.paymentMethod.inList}"
					value="${paymentInstance?.paymentMethod}"
					valueMessagePrefix="payment.paymentMethod" noSelection="['': '']" />
				<span class="help-inline">
					${hasErrors(bean: paymentInstance, field: 'paymentMethod', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'totalAmount', 'error')} required">
			<label for="totalAmount" class="col-md-3 control-label"><g:message
					code="payment.totalAmount.label" default="Total Amount" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:textField name="totalAmount" required="" class="form-control"
					value="${paymentInstance.totalAmount}" />
				<span class="help-inline">
					${hasErrors(bean: paymentInstance, field: 'totalAmount', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>	
		

<div class="row">
	<div class="col-md-6">
		<div
			class="chequeFields form-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'chequeNumber', 'error')} ">
			<label for="chequeNumber" class="col-md-3 control-label"><g:message
					code="payment.chequeNumber.label" default="Cheque Number" /></label>
			<div class="col-md-9">
				<g:textField name="chequeNumber" class="form-control"
					value="${paymentInstance?.chequeNumber}" />
				<span class="help-inline">
					${hasErrors(bean: paymentInstance, field: 'chequeNumber', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="col-md-6">
		<div
			class="chequeFields form-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'chequeIssueDate', 'error')} ">
			<label for="branch" class="col-md-3 control-label"><g:message
					code="payment.chequeIssueDate.label" default="Cheque Issue Date" /></label>
			<div class="col-md-9">
				<richui:dateChooser class="form-control" name="chequeIssueDate" value="${paymentInstance?.chequeIssueDate}" />
				<span class="help-inline">
					${hasErrors(bean: paymentInstance, field: 'chequeIssueDate', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div
			class="chequeFields form-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'bank', 'error')} ">
			<label for="bank" class="col-md-3 control-label"><g:message
					code="payment.bank.label" default="Bank" /></label>
			<div class="col-md-9">
				<g:textField class="form-control" name="bank" value="${paymentInstance?.bank}" />
				<span class="help-inline">
					${hasErrors(bean: paymentInstance, field: 'bank', 'error')}
				</span>
			</div>
		</div>
	</div>
	
	<div class="col-md-6">
		<div
			class="chequeFields form-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'branch', 'error')} ">
			<label for="branch" class="col-md-3 control-label"><g:message
					code="payment.branch.label" default="Branch" /></label>
			<div class="col-md-9">
				<g:textField class="form-control" name="branch" value="${paymentInstance?.branch}" />
				<span class="help-inline">
					${hasErrors(bean: paymentInstance, field: 'branch', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>

<%--<div
	class="chequeFields control-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'clearanceDate', 'error')} ">
	<label for="branch" class="col-md-3 control-label"><g:message
			code="payment.clearanceDate.label" default="Clearance Date" /></label>
	<div class="col-md-9">
		<bootstrap:jqDatePicker name="clearanceDate" value="${paymentInstance?.clearanceDate}"  />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'clearanceDate', 'error')}
		</span>
	</div>
</div>
--%>

<%--<div
	class="form-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'balanceAmount', 'error')} required">
	<label for="balanceAmount" class="col-md-3 control-label"><g:message
			code="payment.balanceAmount.label" default="Balance Amount" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:textField name="balanceAmount" required="" readOnly="readOnly"
			value="${paymentInstance.balanceAmount}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'balanceAmount', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: paymentInstance, field: 'matchedAmount', 'error')} required">
	<label for="matchedAmount" class="col-md-3 control-label"><g:message
			code="payment.matchedAmount.label" default="Matched Amount" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:textField name="matchedAmount" required="" readOnly="readOnly"
			value="${paymentInstance.matchedAmount}" />
		<span class="help-inline">
			${hasErrors(bean: paymentInstance, field: 'matchedAmount', 'error')}
		</span>
	</div>
</div>
--%>
