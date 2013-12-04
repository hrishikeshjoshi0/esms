

<%@ page import="com.esms.model.product.ProductPrice" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'productPrice.label', default: 'ProductPrice')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:message code="default.show.label" args="[entityName]" />
				</h3>
			</div>

			<dl class="dl-horizontal">
				
							<dt><g:message code="productPrice.fromDate.label" default="From Date" /></dt>
						
							<dd><g:formatDate date="${productPriceInstance?.fromDate}" /></dd>
						
				
							<dt><g:message code="productPrice.price.label" default="Price" /></dt>
						
							<dd><g:fieldValue bean="${productPriceInstance}" field="price"/></dd>
						
				
							<dt><g:message code="productPrice.product.label" default="Product" /></dt>
						
							<dd><g:link controller="product" action="show" id="${productPriceInstance?.product?.id}">${productPriceInstance?.product?.encodeAsHTML()}</g:link></dd>
						
				
							<dt><g:message code="productPrice.toDate.label" default="To Date" /></dt>
						
							<dd><g:formatDate date="${productPriceInstance?.toDate}" /></dd>
						
				
			</dl>

			<g:form>
				<g:hiddenField name="id" value="${productPriceInstance?.id}" />
				<div class="form-group">
					<g:link class="btn btn-default btn-xs" action="edit" id="${productPriceInstance?.id}">
						
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-sm btn-danger" type="submit" name="_action_delete">
						
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
