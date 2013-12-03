<%@ page import="com.esms.model.product.Product"%>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'productNumber', 'error')} required">
	<label for="productNumber" class="col-md-2 control-label"><g:message
			code="product.productNumber.label" default="Product Number" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-6">
		<g:textField name="productNumber" required="" class="form-control"
			value="${productInstance?.productNumber}" readOnly="readOnly" />
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'productNumber', 'error')}
		</span>
	</div>
</div>


<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'productName', 'error')} required">
	<label for="productName" class="col-md-2 control-label"><g:message
			code="product.productName.label" default="Product Name" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-6">
		<g:textField name="productName" required="" class="form-control"
			value="${productInstance?.productName}" />
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'productName', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'productType', 'error')} ">
	<label for="productType" class="col-md-2 control-label"><g:message
			code="product.productType.label" default="Product Type" /></label>
	<div class="col-lg-6">
		<g:select name="productType" class="form-control"
			from="${productInstance.constraints.productType.inList}"
			value="${productInstance?.productType}"
			valueMessagePrefix="product.productType" noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'productType', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'introductionDate', 'error')} ">
	<label for="introductionDate" class="col-md-2 control-label"><g:message
			code="product.introductionDate.label" default="Introduction Date" /></label>
	<div class="col-lg-6">
		<richui:dateChooser name="introductionDate" class="form-control"
			value="${productInstance?.introductionDate}" />
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'introductionDate', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'manufacturer', 'error')} ">
	<label for="manufacturer" class="col-md-2 control-label"><g:message
			code="product.manufacturer.label" default="Manufacturer" /></label>
	<div class="col-lg-6">
		<g:textField name="manufacturer" class="form-control"
			value="${productInstance?.manufacturer}" />
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'manufacturer', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'serviceContract', 'error')} ">
	<label for="serviceContract" class="col-md-2 control-label"><g:message
			code="product.serviceContract.label" default="Is Service Contract?" /></label>
	<div class="col-lg-6">
		<g:checkBox name="serviceContract" 
			value="${productInstance?.serviceContract}" />
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'serviceContract', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'requiresInventory', 'error')} ">
	<label for="requiresInventory" class="col-md-2 control-label"><g:message
			code="product.requiresInventory.label" default="Requires Inventory" /></label>
	<div class="col-lg-6">
		<g:checkBox name="requiresInventory" 
			value="${productInstance?.requiresInventory}" />
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'requiresInventory', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'taxable', 'error')} ">
	<label for="taxable" class="col-md-2 control-label"><g:message
			code="product.taxable.label" default="Taxable" /></label>
	<div class="col-lg-6">
		<g:checkBox name="taxable" value="${productInstance?.taxable}"/>
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'taxable', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'isVirtual', 'error')} ">
	<label for="isVirtual" class="col-md-2 control-label"><g:message
			code="product.isVirtual.label" default="Is Virtual" /></label>
	<div class="col-lg-6">
		<g:checkBox name="isVirtual" value="${productInstance?.isVirtual}" />
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'isVirtual', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: productInstance, field: 'comments', 'error')} ">
	<label for="isVirtual" class="col-md-2 control-label"><g:message
			code="product.comments.label" default="Comments" /></label>
	<div class="col-lg-6">
		<g:textArea name="comments" cols="40" rows="5" maxlength="1000" class="form-control"
			value="${productInstance?.comments}" style="width:80%;" />
		<span class="help-inline"> ${hasErrors(bean: productInstance, field: 'comments', 'error')}
		</span>
	</div>
</div>