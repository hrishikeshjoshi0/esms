
<%@ page import="com.esms.model.product.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<div class="page-header">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						
							<g:sortableColumn property="productName" title="${message(code: 'product.productName.label', default: 'Product Name')}" />
						
							<g:sortableColumn property="comments" title="${message(code: 'product.comments.label', default: 'Comments')}" />
						
							<g:sortableColumn property="brandName" title="${message(code: 'product.brandName.label', default: 'Brand Name')}" />
						
							<g:sortableColumn property="chargeShipping" title="${message(code: 'product.chargeShipping.label', default: 'Charge Shipping')}" />
						
							<g:sortableColumn property="depth" title="${message(code: 'product.depth.label', default: 'Depth')}" />
						
							<g:sortableColumn property="fixedAmount" title="${message(code: 'product.fixedAmount.label', default: 'Fixed Amount')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${productInstanceList}" var="productInstance">
						<tr>
						
							<td>${fieldValue(bean: productInstance, field: "productName")}</td>
						
							<td>${fieldValue(bean: productInstance, field: "comments")}</td>
						
							<td>${fieldValue(bean: productInstance, field: "brandName")}</td>
						
							<td><g:formatBoolean boolean="${productInstance.chargeShipping}" /></td>
						
							<td>${fieldValue(bean: productInstance, field: "depth")}</td>
						
							<td>${fieldValue(bean: productInstance, field: "fixedAmount")}</td>
						
							<td class="link">
								<g:link action="show" id="${productInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${productInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
