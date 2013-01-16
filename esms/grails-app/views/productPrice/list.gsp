
<%@ page import="com.esms.model.product.ProductPrice" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'productPrice.label', default: 'ProductPrice')}" />
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
						
							<g:sortableColumn property="fromDate" title="${message(code: 'productPrice.fromDate.label', default: 'From Date')}" />
						
							<g:sortableColumn property="price" title="${message(code: 'productPrice.price.label', default: 'Price')}" />
						
							<th class="header"><g:message code="productPrice.product.label" default="Product" /></th>
						
							<g:sortableColumn property="toDate" title="${message(code: 'productPrice.toDate.label', default: 'To Date')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${productPriceInstanceList}" var="productPriceInstance">
						<tr>
						
							<td><g:formatDate date="${productPriceInstance.fromDate}" /></td>
						
							<td>${fieldValue(bean: productPriceInstance, field: "price")}</td>
						
							<td>${fieldValue(bean: productPriceInstance, field: "product")}</td>
						
							<td><g:formatDate date="${productPriceInstance.toDate}" /></td>
						
							<td class="link">
								<g:link action="show" id="${productPriceInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${productPriceInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
