<%@ page import="com.esms.model.product.ProductPrice"%>

<div
	class="control-group fieldcontain ${hasErrors(bean: productPriceInstance, field: 'fromDate', 'error')} required">
	<label for="fromDate" class="control-label"><g:message
			code="productPrice.fromDate.label" default="From Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="fromDate"
			value="${productPriceInstance?.fromDate}" />
		<span class="help-inline"> ${hasErrors(bean: productPriceInstance, field: 'fromDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productPriceInstance, field: 'toDate', 'error')} required">
	<label for="toDate" class="control-label"><g:message
			code="productPrice.toDate.label" default="To Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="toDate"
			value="${productPriceInstance?.toDate}" />
		<span class="help-inline"> ${hasErrors(bean: productPriceInstance, field: 'toDate', 'error')}
		</span>
	</div>
</div>


<div
	class="control-group fieldcontain ${hasErrors(bean: productPriceInstance, field: 'price', 'error')} required">
	<label for="price" class="control-label"><g:message
			code="productPrice.price.label" default="Price" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="price" step="any" required=""
			value="${productPriceInstance.price}" />
		<span class="help-inline"> ${hasErrors(bean: productPriceInstance, field: 'price', 'error')}
		</span>
	</div>
</div>