<script type="text/javascript">
	function calc(i) {
    	//var lineTotal = (parseFloat($("#invoice[" + i + "].unitPrice").val()) * parseFloat($("#invoice[" + i + "].quantity").val())) + parseFloat($("#invoice[" + i + "].tax").val()) - parseFloat($("#invoice[" + i + "].discount").val());
		//$("#invoice[" + i + "].lineTotalAmount").val(lineTotal);

		//$('#totalAmount').val(lineTotal);
		//$('#quantity').val($("#invoice[" + i + "].quantity").val());
		//$('#totalTax').val($("#invoice[" + i + "].tax").val());
		//$('#totalDiscount').val($("#invoice[" + i + "].discount").val());
    }
    
	function fetchUnitPriceForProduct(id) {
		if(id == 'null') {
			$(".create").attr("disabled", "disabled");
		} else {
			var url = "${createLink(controller:'product', action:'getPrice')}" + "/" + id;
			$.ajax({
			    url:url,
			    dataType: 'xml',	
			    success: function(data) {
			    	$(data).find("unitPrice").each(function() {  
			    		//find each instance of loc in xml file and wrap it in a link  
			    		$("#unitPrice").val($(this).text());
	
			    		calculateLineTotalAmount();
			    	});  
			    },
			    error: function(request, status, error) {
			      alert(error)
			    },
			    complete: function() {
			    }
			});

			$(".create").removeAttr("disabled");
		}
	}
</script>
<table class="table table-striped table-hover">
	<thead>
		<tr>

			<g:sortableColumn property="lineNumber" 
				title="${message(code: 'invoiceLine.lineNumber.label', default: 'Line Number')}" />

			<g:sortableColumn property="productNumber"
				title="${message(code: 'invoiceLine.productNumber.label', default: 'Product Number')}" />

			<g:sortableColumn property="quantity"
				title="${message(code: 'invoiceLine.quantity.label', default: 'Quantity')}" />

			<g:sortableColumn property="unitPrice"
				title="${message(code: 'invoiceLine.unitPrice.label', default: 'Unit Price')}" />

			<g:sortableColumn property="tax"
				title="${message(code: 'invoiceLine.tax.label', default: 'Tax')}" />

			<g:sortableColumn property="discount"
				title="${message(code: 'invoiceLine.discount.label', default: 'Discount')}" />
				
			<g:sortableColumn property="lineTotalAmount"
				title="${message(code: 'invoiceLine.lineTotalAmount.label', default: 'Line Total Amount')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${invoiceInstance?.invoiceLines}" var="invoiceLineInstance" status="index">
			<tr>
				<td>
					<g:textField name="invoice[${index}].lineNumber" value="${invoiceLineInstance.lineNumber}" size="3" class="input-mini"/>
				</td>
				
				<td>
					<g:textField name="invoice[${index}].productNumber" value="${invoiceLineInstance.productNumber}" size="3" class="input-mini"/>
				</td>

				<td>
					<g:textField onchange="calc(${index});" name="invoice[${index}].quantity" value="${invoiceLineInstance.quantity}" size="3" class="input-mini"/>
				</td>

				<td>
					<g:textField onchange="calc(${index});" name="invoice[${index}].unitPrice" value="${invoiceLineInstance.unitPrice}" size="5" class="input-mini"/>
				</td>

				<td>
					<g:textField onchange="calc(${index});" name="invoice[${index}].tax" value="${invoiceLineInstance.tax}" size="5" class="input-mini"/>
				</td>

				<td>
					<g:textField onchange="calc(${index});" name="invoice[${index}].discount" value="${invoiceLineInstance.discount}" size="5" class="input-mini"/>
				</td>
				
				<td>
					<g:textField onchange="calc(${index});" name="invoice[${index}].lineTotalAmount" value="${invoiceLineInstance.lineTotalAmount}" size="5" class="input-mini"/>
				</td>

			</tr>
		</g:each>
	</tbody>
</table>