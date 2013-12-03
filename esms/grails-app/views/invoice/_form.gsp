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
			    dataType: 'html',	
			    success: function(data) {
			    	$('#invoiceLines').html(data);
			    },
			    error: function(request, status, error) {
			      alert(error)
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
			      alert(error)
			    },
			    complete: function() {
			    }
			});
		}

		function fillInvoiceForm(id) {
			var url = "${createLink(controller:'invoice', action:'fillInvoiceForm')}" + "/" + id;
			$('#formTemplate').html("<center>Loading...</center>");
			$.ajax({
			    url:url,
			    dataType: 'html',	
			    success: function(data) {
			    	$('#formTemplate').html(data); 
			    },
			    error: function(request, status, error) {
			      alert(error)
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
					class="control-group fieldcontain ${hasErrors(bean: invoiceInstance, field: 'organization', 'error')} required">
					<label for="organization" class="control-label"><g:message
							code="invoice.organization.label" default="Organization" /><span
					class="required-indicator">*</span></label>
				<div class="controls">
					${invoiceInstance?.organization?.name}
				</div>
			</g:if>
			<g:else>
				<div
					class="control-group fieldcontain required">
					<label for="organization" class="control-label"><g:message
							code="invoice.order.label" default="Order" /><span
					class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="orderId" name="orderId" from="${openOrders}" optionKey="id" class="large"
						optionValue="${{it.orderNumber + ' - ' + it.type + ' : ' + it.organization?.name + 
							'(Open Amount :' + it.openGrandTotal + ')' }}"	/>
					<span class="help-inline"> ${hasErrors(bean: invoiceInstance, field: 'order', 'error')}
					</span>
				</div>				
			</g:else>
		</div>
	</div>
	<div class="col-md-6">
		<g:if test="${order}">
				<div
					class="control-group fieldcontain">
					<label class="control-label"><g:message
							code="invoice.referenceOrderNumber.label" default="Order Number" /></label>
				<g:hiddenField id="orderId" name="orderId" value="${order?.id}"/>
				<div class="controls">
					${order?.orderNumber}
				</div>	
		</g:if>
	</div>
</div>

<div id="formTemplate">
	<g:if test="${order}">
		<g:render template="formTemplate" />
	</g:if>
</div>