<%@ page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.invoice.Invoice"%>
<%@ page import="com.esms.model.product.*"%>
<head>
	<script type="text/javascript">
		$('document').ready(function(){
			$('#formTemplate').on('change', '.calc', function(){
				updateInvoiceTotals($(this));
			});
				
			$('.calc').change(function(){
				updateInvoiceTotals($(this));
			});

			/*$('#formTemplate').on('change', '.amountInvoiced', function(){
				updateInvoiceTotals($(this));
			});*/
	
			$('#adjustment').change(function(){
				var grandTotal = parseFloat($('#totalAmount').val()) - parseFloat($('#adjustment').val());
				$("#grandTotal").val(grandTotal);
			});

			$('#adjustment').on("change", function() {
				var grandTotal = parseFloat($('#totalAmount').val()) - parseFloat($('#adjustment').val());
				$("#grandTotal").val(grandTotal);
			});

			var orderId = $("#orderId").val();
			fillInvoiceForm(orderId);
			
			$("#orderId").change(function() {
				fillInvoiceForm($(this).val());
			});	
		});

		function addLineItem(id) {
			var url = "${createLink(controller:'invoice', action:'addInvoiceLine')}" + "/" + id;
			$.ajax({
			    url:url,
			    cache:false,
			    dataType: 'html',	
			    success: function(data) {
			    	$('#invoiceLines').html(data);
			    },
			    error: function(request, status, error) {
			    	$.growl.error({ title: "Error!", message: "There was some technical error." });
			    },
			    complete: function() {
			    }
			});	
		}
	
		function updateInvoiceTotals(elem) {
			var idx = $(elem).data("index");
			var unitPrice = $('#' + 'unitPrice' + idx).val();
			var quantity = $('#' + 'quantity' + idx).val();
			var tax = $('#' + 'tax' + idx).val();
			var discount = $('#' + 'discount' + idx).val();
			var percentageInvoiced = $('#' + 'percentageInvoiced' + idx).val();

			//if the field is total, change other records.
			if($(elem).hasClass( "amountInvoiced" )) {
				var lineAmountInvoiced = $(elem).val(); 
				var lineTotal = (parseFloat(unitPrice) * parseFloat(quantity) + parseFloat(tax) - parseFloat(discount));

				var percentageInvoiced = 	(parseFloat(lineAmountInvoiced)/parseFloat(lineTotal))*100.00;
				$("#" + "percentageInvoiced" + idx).val(percentageInvoiced);
				
				var invoiceLinesTotal= $("#invoiceLinesTotal").val()
				var totalAmt = 0.0;
				var adjustment = 0.0;
				var grandTotalAmt = 0.0;

				for(var i=0; i < invoiceLinesTotal; i++) {
					totalAmt += parseFloat($("#" + "amountInvoiced" + i).val());
				}

				$('#totalAmount').val(totalAmt);
				var grandTotal = parseFloat($('#totalAmount').val()) - parseFloat($('#adjustment').val());
				$("#grandTotal").val(grandTotal);
				
			} else {
				var lineTotal = (parseFloat(unitPrice) * parseFloat(quantity) + parseFloat(tax) - parseFloat(discount));
				var lineAmountInvoiced = (parseFloat(lineTotal) * parseFloat(percentageInvoiced)/100);

				//
				$("#" + "lineTotalAmount" + idx).val(lineTotal);
				$("#" + "amountInvoiced" + idx).val(lineAmountInvoiced);
				
				var invoiceLinesTotal= $("#invoiceLinesTotal").val()
				var totalAmt = 0.0;
				var adjustment = 0.0;
				var grandTotalAmt = 0.0;

				for(var i=0; i < invoiceLinesTotal; i++) {
					totalAmt += parseFloat($("#" + "amountInvoiced" + i).val());
				}
				//alert(totalAmt);

				$('#totalAmount').val(totalAmt);
				//$('#totalTax').val(tax);
				//$('#totalDiscount').val(discount);
				var grandTotal = parseFloat($('#totalAmount').val()) - parseFloat($('#adjustment').val());
				$("#grandTotal").val(grandTotal);
			}
		}

		function fetchOrderInfo(id) {
			var url = "${createLink(controller:'order', action:'show')}" + "/" + id;
			$.ajax({
			    url:url,
			    dataType: 'json',	
			    success: function(data) {
			    	$("#totalAmount").val(data.openGrandTotal);
			    	$("#adjustment").val(data.adjustment);
			    	$("#grandTotal").val(data.grandTotal);
			    	$("#type").val(data.type);
			    	$("#contactName").val(data.contactName);
			    	$("#relatedTo").val(data.relatedTo);
			    	$("#relatedToValue").val(data.relatedToValue);
			    	
					//Add Line Items
					addLineItem(id); 
			    },
			    error: function(request, status, error) {
			    	$.growl.error({ title: "Error!", message: "There was some technical error." });
			    },
			    complete: function() {
			    }
			});
		}

		function fillInvoiceForm(id) {
			var url = "${createLink(controller:'invoice', action:'fillInvoiceForm')}" + "/" + id;

			$('#formTemplate').html('');
			$('#formTemplate').showSpinner();
			
			$.ajax({
			    url:url,
			    dataType: 'html',	
			    success: function(data) {
			    	$('#formTemplate').html(data); 
			    },
			    error: function(request, status, error) {
			    	$.growl.error({ title: "Error!", message: "There was some technical error." });
			    },
			    complete: function() {
			    }
			});
		}
	</script>
</head>

<div class="row">
	<div class="col-md-6">
		<g:if test="${order}">
			<div
				class="form-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'organization', 'error')} required">
				<label for="organization" class="col-md-3 control-label"><g:message
						code="invoice.organization.label" default="Organization" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:textField name="organizationName" value="${invoiceInstance?.organization?.name}" readonly="readonly"/>
					<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'externalId', 'error')}
					</span>
				</div>
			</div>
		</g:if>
		<g:else>
			<div
				class="form-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'organization', 'error')} required">
				<label for="organization" class="col-md-3 control-label"><g:message
						code="invoice.order.label" default="Order" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:select id="orderId" name="orderId" from="${openOrders}"
						optionKey="id" class="form-control filter-dropdown"
						optionValue="${{it.organization?.name + ':' + it.orderNumber + ' - ' + it.type + ' : ' +  
							'(Open Amount :' + it.pendingInvoiceGrandTotal + ')' }}" />
					<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'order', 'error')}
					</span>
				</div>
			</div>
		</g:else>
	</div>

	<div class="col-md-6">
		<g:if test="${order}">
			<div
				class="form-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'referenceOrderNumber', 'error')} required">
				<label class="col-md-3 control-label"><g:message
						code="invoice.referenceOrderNumber.label" default="Order Number" /></label>
				<div class="col-md-9">
					<g:hiddenField id="orderId" name="orderId" value="${order?.id}" />
					<g:textField name="orderNumber" value="${order?.orderNumber}" readonly="readonly"/>
					<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'order', 'error')}
					</span>
				</div>
			</div>
		</g:if>
	</div>
</div>

<div id="formTemplate">
	<g:if test="${order}">
		<g:render template="formTemplate" />
	</g:if>
</div>