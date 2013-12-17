<%@ page import="com.esms.model.quote.QuoteItem"%>
<%@ page import="com.esms.model.product.Product"%>




<div
	class="form-group fieldcontain ${hasErrors(bean: quoteItemInstance, field: 'lineNumber', 'error')} required">
	<label for="lineNumber" class="col-md-3 control-label"><g:message
			code="quoteItem.lineNumber.label" default="Line Number" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="lineNumber" required=""
			readonly="readonly" value="${quoteItemInstance.lineNumber}" />
		<span class="help-inline"> ${hasErrors(bean: quoteItemInstance, field: 'lineNumber', 'error')}
		</span>
	</div>
</div>





<div
	class="form-group fieldcontain ${hasErrors(bean: quoteItemInstance, field: 'productNumber', 'error')} ">
	<label for="productNumber" class="col-md-3 control-label"><g:message
			code="quoteItem.productNumber.label" default="Product" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:if test="${quoteInstance?.type == 'CONTRACT' }">
			<g:select name="productNumber"
				onChange="fetchUnitPriceForProduct(this.value);"
				from="${Product.findAllByProductTypeAndServiceContract("SERVICE",true)}"
				required="" optionKey="productNumber" optionValue="productName"
				value="${quoteItemInstance?.productNumber}"
				noSelection="${['null':'Select Product..']}" />
		</g:if>
		<g:else>
			<g:select name="productNumber"
				onChange="fetchUnitPriceForProduct(this.value);"
				from="${Product.findAllByProductTypeNotEqualAndServiceContractNotEqual('SERVICE',true)}" required=""
				optionKey="productNumber" optionValue="productName"
				value="${quoteItemInstance?.productNumber}"
				noSelection="${['null':'Select Product..']}" />
		</g:else>

		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'productNumber', 'error')}
		</span>
	</div>
</div>





<div
	class="form-group fieldcontain ${hasErrors(bean: quoteItemInstance, field: 'quantity', 'error')} required">
	<label for="quantity" class="col-md-3 control-label"><g:message
			code="quoteItem.quantity.label" default="Quantity" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="quantity" step="any" required=""
			class="calc" value="${quoteItemInstance.quantity}" />
		<span class="help-inline"> ${hasErrors(bean: quoteItemInstance, field: 'quantity', 'error')}
		</span>
	</div>
</div>




<div
	class="form-group fieldcontain ${hasErrors(bean: quoteItemInstance, field: 'unitPrice', 'error')} required">
	<label for="unitPrice" class="col-md-3 control-label"><g:message
			code="quoteItem.unitPrice.label" default="Unit Price" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="unitPrice" step="any" required=""
			class="calc" value="${quoteItemInstance.unitPrice}" />
		<span class="help-inline"> ${hasErrors(bean: quoteItemInstance, field: 'unitPrice', 'error')}
		</span>
	</div>
</div>


<div
	class="form-group fieldcontain ${hasErrors(bean: quoteItemInstance, field: 'tax', 'error')} required">
	<label for="tax" class="col-md-3 control-label"><g:message
			code="quoteItem.tax.label" default="Tax" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="tax" step="any" required="" class="calc"
			value="${quoteItemInstance.tax}" />
		<span class="help-inline"> ${hasErrors(bean: quoteItemInstance, field: 'tax', 'error')}
		</span>
	</div>
</div>


<div
	class="form-group fieldcontain ${hasErrors(bean: quoteItemInstance, field: 'discount', 'error')} required">
	<label for="discount" class="col-md-3 control-label"><g:message
			code="quoteItem.discount.label" default="Discount" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="discount" step="any" required=""
			class="calc" value="${quoteItemInstance.discount}" />
		<span class="help-inline"> ${hasErrors(bean: quoteItemInstance, field: 'discount', 'error')}
		</span>
	</div>
</div>




<div
	class="form-group fieldcontain ${hasErrors(bean: quoteItemInstance, field: 'lineTotalAmount', 'error')} required">
	<label for="lineTotalAmount" class="col-md-3 control-label"><g:message
			code="quoteItem.lineTotalAmount.label" default="Line Total Amount" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="lineTotalAmount" step="any" required=""
			readOnly="readOnly" value="${quoteItemInstance.lineTotalAmount}" />
		<span class="help-inline"> ${hasErrors(bean: quoteItemInstance, field: 'lineTotalAmount', 'error')}
		</span>
	</div>
</div>

<%--<div
	class="form-group fieldcontain ${hasErrors(bean: quoteItemInstance, field: 'quote', 'error')} required">
	<label for="quote" class="col-md-3 control-label"><g:message
			code="quoteItem.quote.label" default="Quote" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:select id="quote" name="quote.id"
			from="${com.esms.model.quote.Quote.list()}" optionKey="id"
			required="" value="${quoteItemInstance?.quote?.id}"
			class="many-to-one" />
		<span class="help-inline">
			${hasErrors(bean: quoteItemInstance, field: 'quote', 'error')}
		</span>
	</div>
</div>

--%>
