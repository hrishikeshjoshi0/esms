
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
						
							<g:sortableColumn property="productType" title="${message(code: 'product.productType.label', default: 'Product Type')}" />
						
							<g:sortableColumn property="manufacturer" title="${message(code: 'product.manufacturer.label', default: 'Manufacturer')}" />
						
							<g:sortableColumn property="introductionDate" title="${message(code: 'product.introductionDate.label', default: 'Introduction Date')}" />
						
							<g:sortableColumn property="supportDiscontinuationDate" title="${message(code: 'product.supportDiscontinuationDate.label', default: 'Support Discontinuation Date')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${productInstanceList}" var="productInstance">
						<tr>
						
							<td>${fieldValue(bean: productInstance, field: "productName")}</td>
						
							<td>${fieldValue(bean: productInstance, field: "comments")}</td>
						
							<td>${fieldValue(bean: productInstance, field: "productType")}</td>
						
							<td>${fieldValue(bean: productInstance, field: "manufacturer")}</td>
						
							<td><g:formatDate date="${productInstance.introductionDate}" /></td>
						
							<td><g:formatDate date="${productInstance.supportDiscontinuationDate}" /></td>
						
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
