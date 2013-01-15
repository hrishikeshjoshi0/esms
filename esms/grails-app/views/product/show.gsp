

<%@ page import="com.esms.model.product.Product" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'product.label', default: 'Product')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>

			<dl class="dl-horizontal">
				
							<dt><g:message code="product.productName.label" default="Product Name" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="productName"/></dd>
						
				
							<dt><g:message code="product.comments.label" default="Comments" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="comments"/></dd>
						
				
							<dt><g:message code="product.brandName.label" default="Brand Name" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="brandName"/></dd>
						
				
							<dt><g:message code="product.chargeShipping.label" default="Charge Shipping" /></dt>
						
							<dd><g:formatBoolean boolean="${productInstance?.chargeShipping}" /></dd>
						
				
							<dt><g:message code="product.depth.label" default="Depth" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="depth"/></dd>
						
				
							<dt><g:message code="product.fixedAmount.label" default="Fixed Amount" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="fixedAmount"/></dd>
						
				
							<dt><g:message code="product.height.label" default="Height" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="height"/></dd>
						
				
							<dt><g:message code="product.internalName.label" default="Internal Name" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="internalName"/></dd>
						
				
							<dt><g:message code="product.introductionDate.label" default="Introduction Date" /></dt>
						
							<dd><g:formatDate date="${productInstance?.introductionDate}" /></dd>
						
				
							<dt><g:message code="product.isVirtual.label" default="Is Virtual" /></dt>
						
							<dd><g:formatBoolean boolean="${productInstance?.isVirtual}" /></dd>
						
				
							<dt><g:message code="product.manufacturer.label" default="Manufacturer" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="manufacturer"/></dd>
						
				
							<dt><g:message code="product.piecesIncluded.label" default="Pieces Included" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="piecesIncluded"/></dd>
						
				
							<dt><g:message code="product.productType.label" default="Product Type" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="productType"/></dd>
						
				
							<dt><g:message code="product.quantityIncluded.label" default="Quantity Included" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="quantityIncluded"/></dd>
						
				
							<dt><g:message code="product.requireAmount.label" default="Require Amount" /></dt>
						
							<dd><g:formatBoolean boolean="${productInstance?.requireAmount}" /></dd>
						
				
							<dt><g:message code="product.requiresInventory.label" default="Requires Inventory" /></dt>
						
							<dd><g:formatBoolean boolean="${productInstance?.requiresInventory}" /></dd>
						
				
							<dt><g:message code="product.salesDiscontinuationDate.label" default="Sales Discontinuation Date" /></dt>
						
							<dd><g:formatDate date="${productInstance?.salesDiscontinuationDate}" /></dd>
						
				
							<dt><g:message code="product.supportDiscontinuationDate.label" default="Support Discontinuation Date" /></dt>
						
							<dd><g:formatDate date="${productInstance?.supportDiscontinuationDate}" /></dd>
						
				
							<dt><g:message code="product.taxable.label" default="Taxable" /></dt>
						
							<dd><g:formatBoolean boolean="${productInstance?.taxable}" /></dd>
						
				
							<dt><g:message code="product.weight.label" default="Weight" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="weight"/></dd>
						
				
							<dt><g:message code="product.width.label" default="Width" /></dt>
						
							<dd><g:fieldValue bean="${productInstance}" field="width"/></dd>
						
				
			</dl>

			<g:form>
				<g:hiddenField name="id" value="${productInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${productInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
