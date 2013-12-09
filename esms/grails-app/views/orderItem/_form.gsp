<%@ page import="com.esms.model.order.Order"%>
<%@ page import="com.esms.model.product.Product"%>

<script type="text/javascript">
	$('document').ready(function(){
		$('.calc').change(function(){
			calculateLineTotalAmount();
		});

		$(".create").attr("disabled", "disabled");
	});

    function calculateLineTotalAmount() {
    	var lineTotal = (parseFloat($("#unitPrice").val()) * parseFloat($("#quantity").val())) + parseFloat($("#tax").val()) - parseFloat($("#discount").val());
		$("#lineTotalAmount").val(lineTotal);
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

<table>
	<tr>
		<td>
			<div
				class="form-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'lineNumber', 'error')} required">
				<label for="lineNumber" class="col-md-3 control-label"><g:message
						code="orderItem.lineNumber.label" default="Line Number" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:field type="number" name="lineNumber" required="" readonly="readonly" class="form-control"
						value="${orderItemInstance.lineNumber}" />
					<span class="help-inline">
						${hasErrors(bean: orderItemInstance, field: 'lineNumber', 'error')}
					</span>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div
				class="form-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'productNumber', 'error')} ">
					<label for="productNumber" class="col-md-3 control-label"><g:message
						code="orderItem.productNumber.label" default="Product" /><span
					class="required-indicator">*</span></label>
				<g:select name="productNumber" from="${Product.list()}"
					optionKey="productNumber" optionValue="productName" class="form-control"
					noSelection="${['null':'Select Product..']}"
					value="${orderItemInstance?.productNumber}" onChange="fetchUnitPriceForProduct(this.value);"/>
				<span class="help-inline">
					${hasErrors(bean: orderItemInstance, field: 'productNumber', 'error')}
				</span>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div
				class="form-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'quantity', 'error')} required">
				<label for="quantity" class="col-md-3 control-label"><g:message
						code="orderItem.quantity.label" default="Quantity" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:field type="number" name="quantity" step="any" required="" class="calc form-control"
						value="${orderItemInstance.quantity}" />
					<span class="help-inline">
						${hasErrors(bean: orderItemInstance, field: 'quantity', 'error')}
					</span>
				</div>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div
				class="form-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'unitPrice', 'error')} required">
				<label for="unitPrice" class="col-md-3 control-label"><g:message
						code="orderItem.unitPrice.label" default="Unit Price" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:field type="number" name="unitPrice" step="any" required="" class="calc form-control"
						value="${orderItemInstance.unitPrice}" />
					<span class="help-inline">
						${hasErrors(bean: orderItemInstance, field: 'unitPrice', 'error')}
					</span>
				</div>
			</div>
		</td>
		<td>
			<div
				class="form-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'tax', 'error')} required">
				<label for="tax" class="col-md-3 control-label"><g:message
						code="orderItem.tax.label" default="Tax" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:field type="number" name="tax" step="any" required="" class="calc form-control"
						value="${orderItemInstance.tax}" />
					<span class="help-inline">
						${hasErrors(bean: orderItemInstance, field: 'tax', 'error')}
					</span>
				</div>
			</div>
		</td>
		<td>
			<div
				class="form-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'discount', 'error')} required">
				<label for="discount" class="col-md-3 control-label"><g:message
						code="orderItem.discount.label" default="Discount" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:field type="number" name="discount" step="any" required="" class="calc form-control"
						value="${orderItemInstance.discount}" />
					<span class="help-inline">
						${hasErrors(bean: orderItemInstance, field: 'discount', 'error')}
					</span>
				</div>
			</div>
		</td>
		<td>
			<div
				class="form-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'lineTotalAmount', 'error')} required">
				<label for="lineTotalAmount" class="col-md-3 control-label"><g:message
						code="orderItem.lineTotalAmount.label" default="Line Total Amount" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:field type="number" name="lineTotalAmount" step="any" required="" readOnly="readOnly" class="form-control"
						value="${orderItemInstance.lineTotalAmount}" />
					<span class="help-inline">
						${hasErrors(bean: orderItemInstance, field: 'lineTotalAmount', 'error')}
					</span>
				</div>
			</div>
		</td>
	</tr>
</table>