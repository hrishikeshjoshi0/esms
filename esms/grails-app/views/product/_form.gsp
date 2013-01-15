<%@ page import="com.esms.model.product.Product"%>



<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'productName', 'error')} required">
	<label for="productName" class="control-label"><g:message
			code="product.productName.label" default="Product Name" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="productName" required=""
			value="${productInstance?.productName}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'productName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'comments', 'error')} ">
	<label for="comments" class="control-label"><g:message
			code="product.comments.label" default="Comments" /></label>
	<div class="controls">
		<g:textArea name="comments" cols="40" rows="5" maxlength="1000"
			value="${productInstance?.comments}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'comments', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'introductionDate', 'error')} required">
	<label for="introductionDate" class="control-label"><g:message
			code="product.introductionDate.label" default="Introduction Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bs:datePicker name="introductionDate" precision="day"
			value="${productInstance?.introductionDate}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'introductionDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'isVirtual', 'error')} ">
	<label for="isVirtual" class="control-label"><g:message
			code="product.isVirtual.label" default="Is Virtual" /></label>
	<div class="controls">
		<g:renderInput name="isVirtual" value="${productInstance?.isVirtual}"  />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'isVirtual', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'manufacturer', 'error')} ">
	<label for="manufacturer" class="control-label"><g:message
			code="product.manufacturer.label" default="Manufacturer" /></label>
	<div class="controls">
		<g:textField name="manufacturer"
			value="${productInstance?.manufacturer}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'manufacturer', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'productType', 'error')} ">
	<label for="productType" class="control-label"><g:message
			code="product.productType.label" default="Product Type" /></label>
	<div class="controls">
		<g:textField name="productType"
			value="${productInstance?.productType}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'productType', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'requiresInventory', 'error')} ">
	<label for="requiresInventory" class="control-label"><g:message
			code="product.requiresInventory.label" default="Requires Inventory" /></label>
	<div class="controls">
		<bs:checkBox name="requiresInventory"
			value="${productInstance?.requiresInventory}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'requiresInventory', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'salesDiscontinuationDate', 'error')} required">
	<label for="salesDiscontinuationDate" class="control-label"><g:message
			code="product.salesDiscontinuationDate.label"
			default="Sales Discontinuation Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bs:datePicker name="salesDiscontinuationDate" precision="day"
			value="${productInstance?.salesDiscontinuationDate}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'salesDiscontinuationDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'supportDiscontinuationDate', 'error')} required">
	<label for="supportDiscontinuationDate" class="control-label"><g:message
			code="product.supportDiscontinuationDate.label"
			default="Support Discontinuation Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bs:datePicker name="supportDiscontinuationDate" precision="day"
			value="${productInstance?.supportDiscontinuationDate}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'supportDiscontinuationDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'taxable', 'error')} ">
	<label for="taxable" class="control-label"><g:message
			code="product.taxable.label" default="Taxable" /></label>
	<div class="controls">
		<bs:checkBox name="taxable" value="${productInstance?.taxable}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'taxable', 'error')}
		</span>
	</div>
</div>

