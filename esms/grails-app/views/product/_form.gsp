<%@ page import="com.esms.model.product.Product" %>
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'productNumber', 'error')} required">
				<label for="productNumber" class="control-label"><g:message code="product.productNumber.label" default="Product Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="productNumber" required="" value="${productInstance?.productNumber}" readOnly="readOnly"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'productNumber', 'error')}</span>
				</div>
			</div>


			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'productName', 'error')} required">
				<label for="productName" class="control-label"><g:message code="product.productName.label" default="Product Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="productName" required="" value="${productInstance?.productName}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'productName', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'productType', 'error')} ">
				<label for="productType" class="control-label"><g:message code="product.productType.label" default="Product Type" /></label>
				<div class="controls">
					<g:select name="productType"
						from="${productInstance.constraints.productType.inList}"
						value="${productInstance?.productType}"
						valueMessagePrefix="product.productType" noSelection="['': '']" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'productType', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'introductionDate', 'error')} ">
				<label for="introductionDate" class="control-label"><g:message code="product.introductionDate.label" default="Introduction Date" /></label>
				<div class="controls">
					<g:datePicker name="introductionDate"  value="${productInstance?.introductionDate}" precision="day"/>
					<%--<bootstrap:jqDatePicker name="introductionDate"  value="${productInstance?.introductionDate}"/>--%>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'introductionDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'manufacturer', 'error')} ">
				<label for="manufacturer" class="control-label"><g:message code="product.manufacturer.label" default="Manufacturer" /></label>
				<div class="controls">
					<g:textField name="manufacturer" value="${productInstance?.manufacturer}"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'manufacturer', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'serviceContract', 'error')} ">
				<label for="serviceContract" class="control-label"><g:message code="product.serviceContract.label" default="Is Service Contract?" /></label>
				<div class="controls">
					<g:checkBox name="serviceContract" value="${productInstance?.serviceContract}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'serviceContract', 'error')}</span>
				</div>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'requiresInventory', 'error')} ">
				<label for="requiresInventory" class="control-label"><g:message code="product.requiresInventory.label" default="Requires Inventory" /></label>
				<div class="controls">
					<g:checkBox name="requiresInventory" value="${productInstance?.requiresInventory}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'requiresInventory', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'taxable', 'error')} ">
				<label for="taxable" class="control-label"><g:message code="product.taxable.label" default="Taxable" /></label>
				<div class="controls">
					<g:checkBox name="taxable" value="${productInstance?.taxable}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'taxable', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'isVirtual', 'error')} ">
				<label for="isVirtual" class="control-label"><g:message code="product.isVirtual.label" default="Is Virtual" /></label>
				<div class="controls">
					<g:checkBox name="isVirtual" value="${productInstance?.isVirtual}" />
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'isVirtual', 'error')}</span>
				</div>
			</div>
			
			<div class="page-header">
				<h1>
					<label for="comments" class="control-label"><g:message code="product.comments.label" default="Comments" /></label>
				</h1>
			</div>
			
			<div class="control-group fieldcontain ${hasErrors(bean: productInstance, field: 'comments', 'error')} ">
				<div class="controls">
					<g:textArea name="comments" cols="40" rows="5" maxlength="1000" value="${productInstance?.comments}" style="width:80%;"/>
					<span class="help-inline">${hasErrors(bean: productInstance, field: 'comments', 'error')}</span>
				</div>
			</div>