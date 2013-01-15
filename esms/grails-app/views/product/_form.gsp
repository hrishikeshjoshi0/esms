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
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'internalName', 'error')} ">
	<label for="internalName" class="control-label"><g:message
			code="product.internalName.label" default="Internal Name" /></label>
	<div class="controls">
		<g:textField name="internalName"
			value="${productInstance?.internalName}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'internalName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'brandName', 'error')} ">
	<label for="brandName" class="control-label"><g:message
			code="product.brandName.label" default="Brand Name" /></label>
	<div class="controls">
		<g:textField name="brandName" value="${productInstance?.brandName}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'brandName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'internalName', 'error')} ">
	<label for="internalName" class="control-label"><g:message
			code="product.internalName.label" default="Internal Name" /></label>
	<div class="controls">
		<g:textField name="internalName"
			value="${productInstance?.internalName}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'internalName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'introductionDate', 'error')} required">
	<label for="salesDiscontinuationDate" class="control-label"><g:message
			code="product.salesDiscontinuationDate.label"
			default="Sales Discontinuation Date" /><span
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
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'fixedAmount', 'error')} required">
	<label for="fixedAmount" class="control-label"><g:message
			code="product.fixedAmount.label" default="Fixed Amount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="fixedAmount" step="any" required=""
			value="${productInstance.fixedAmount}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'fixedAmount', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'isVirtual', 'error')} ">
	<label for="isVirtual" class="control-label"><g:message
			code="product.isVirtual.label" default="Is Virtual" /></label>
	<div class="controls">
		<bs:checkBox name="isVirtual" value="${productInstance?.isVirtual}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'isVirtual', 'error')}
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

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'depth', 'error')} required">
	<label for="depth" class="control-label"><g:message
			code="product.depth.label" default="Depth" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="depth" step="any" required=""
			value="${productInstance.depth}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'depth', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'height', 'error')} required">
	<label for="height" class="control-label"><g:message
			code="product.height.label" default="Height" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="height" step="any" required=""
			value="${productInstance.height}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'height', 'error')}
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
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'piecesIncluded', 'error')} required">
	<label for="piecesIncluded" class="control-label"><g:message
			code="product.piecesIncluded.label" default="Pieces Included" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="piecesIncluded" step="any" required=""
			value="${productInstance.piecesIncluded}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'piecesIncluded', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'weight', 'error')} required">
	<label for="weight" class="control-label"><g:message
			code="product.weight.label" default="Weight" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="weight" step="any" required=""
			value="${productInstance.weight}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'weight', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'width', 'error')} required">
	<label for="width" class="control-label"><g:message
			code="product.width.label" default="Width" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="width" step="any" required=""
			value="${productInstance.width}" />
		<span class="help-inline">
			${hasErrors(bean: productInstance, field: 'width', 'error')}
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