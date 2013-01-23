<%@ page import="com.esms.model.order.OrderItem"%>

<script type="text/javascript">
	$('document').ready(function(){
		$('.calc').change(function(){
			calculateLineTotalAmount();
		});
	});

    function calculateLineTotalAmount() {
    	var lineTotal = (parseFloat($("#unitPrice").val()) * parseFloat($("#quantity").val())) + parseFloat($("#tax").val()) - parseFloat($("#discount").val());
		$("#lineTotalAmount").val(lineTotal);
    }
    
	function fetchUnitPriceForProduct(id) {
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
	}
</script>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'lineNumber', 'error')} required">
	<label for="lineNumber" class="control-label"><g:message
			code="orderItem.lineNumber.label" default="Line Number" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="lineNumber" required="" readonly="readonly"
			value="${orderItemInstance.lineNumber}" />
		<span class="help-inline">
			${hasErrors(bean: orderItemInstance, field: 'lineNumber', 'error')}
		</span>
	</div>
</div>
<div
	class="control-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'productNumber', 'error')} ">
		<label for="productNumber" class="control-label"><g:message
			code="orderItem.productNumber.label" default="Product Number" /><span
		class="required-indicator">*</span></label>
		<richui:autoComplete name="productNumber" onItemSelect="fetchUnitPriceForProduct(id);"
			action="${createLinkTo('dir': 'product/searchAJAX')}"
			forceSelection="true" typeAhead="true" shadow="true" minQueryLength ="2"/>
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'productNumber', 'error')}
		</span>
</div>


<div
	class="control-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'quantity', 'error')} required">
	<label for="quantity" class="control-label"><g:message
			code="orderItem.quantity.label" default="Quantity" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="quantity" step="any" required="" class="calc"
			value="${orderItemInstance.quantity}" />
		<span class="help-inline">
			${hasErrors(bean: orderItemInstance, field: 'quantity', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'unitPrice', 'error')} required">
	<label for="unitPrice" class="control-label"><g:message
			code="orderItem.unitPrice.label" default="Unit Price" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="unitPrice" step="any" required="" class="calc"
			value="${orderItemInstance.unitPrice}" />
		<span class="help-inline">
			${hasErrors(bean: orderItemInstance, field: 'unitPrice', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'tax', 'error')} required">
	<label for="tax" class="control-label"><g:message
			code="orderItem.tax.label" default="Tax" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="tax" step="any" required="" class="calc"
			value="${orderItemInstance.tax}" />
		<span class="help-inline">
			${hasErrors(bean: orderItemInstance, field: 'tax', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'discount', 'error')} required">
	<label for="discount" class="control-label"><g:message
			code="orderItem.discount.label" default="Discount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="discount" step="any" required="" class="calc"
			value="${orderItemInstance.discount}" />
		<span class="help-inline">
			${hasErrors(bean: orderItemInstance, field: 'discount', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'lineTotalAmount', 'error')} required">
	<label for="lineTotalAmount" class="control-label"><g:message
			code="orderItem.lineTotalAmount.label" default="Line Total Amount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="lineTotalAmount" step="any" required="" readOnly="readOnly"
			value="${orderItemInstance.lineTotalAmount}" />
		<span class="help-inline">
			${hasErrors(bean: orderItemInstance, field: 'lineTotalAmount', 'error')}
		</span>
	</div>
</div>

<%--<div
	class="control-group fieldcontain ${hasErrors(bean: orderItemInstance, field: 'quote', 'error')} required">
	<label for="quote" class="control-label"><g:message
			code="orderItem.quote.label" default="Quote" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select id="quote" name="quote.id"
			from="${com.esms.model.quote.Quote.list()}" optionKey="id"
			required="" value="${orderItemInstance?.quote?.id}"
			class="many-to-one" />
		<span class="help-inline">
			${hasErrors(bean: orderItemInstance, field: 'quote', 'error')}
		</span>
	</div>
</div>

--%>
