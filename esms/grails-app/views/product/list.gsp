<%@ page import="com.esms.model.product.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<body>
	<div class="page-header">
		<h3>
			<g:message code="default.list.label" args="[entityName]" />
		</h3>
	</div>

	<filterpane:filterPane domain="com.esms.model.product.Product"
		filterProperties="${['productNumber', 'productName','productType','isVirtual']}"
		titleKey="default.filterPane.header" dialog="y" visible="n"
		showSortPanel="n" showTitle="n" fullAssociationPathFieldNames="false" />

	<div class="table-responsive">
		<table
			class="table table-striped table-hover table-condensed table-bordered">
			<thead>
				<tr>
					<g:sortableColumn property="productName"
						title="${message(code: 'product.productName.label', default: 'Product Name')}" />
					<g:sortableColumn property="productType"
						title="${message(code: 'product.productType.label', default: 'Product Type')}" />
					<g:sortableColumn property="introductionDate"
						title="${message(code: 'product.introductionDate.label', default: 'Introduction Date')}" />
					<g:sortableColumn property="inventory.quantityOnHand"
						title="${message(code: 'product.inventory.quantityOnHand.label', default: 'Quantity On Hand')}" />
					<g:sortableColumn property="inventory.incoming"
						title="${message(code: 'product.inventory.incoming.label', default: 'Incoming')}" />
					<g:sortableColumn property="inventory.outgoing"
						title="${message(code: 'product.inventory.outgoing.label', default: 'Outgoing')}" />
					<th></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${productInstanceList}" var="productInstance">
					<tr>
						<td>
							${fieldValue(bean: productInstance, field: "productName")}
						</td>
						<td>
							${fieldValue(bean: productInstance, field: "productType")}
						</td>
						<td><g:formatDate date="${productInstance.introductionDate}" /></td>
						<td>
							${fieldValue(bean: productInstance, field: "inventory.quantityOnHand")}
						</td>
						<td>
							${fieldValue(bean: productInstance, field: "inventory.incoming")}
						</td>
						<td>
							${fieldValue(bean: productInstance, field: "inventory.outgoing")}
						</td>
						<td class="link"><g:link action="show"
								id="${productInstance.id}" class="btn-xs">Show &raquo;</g:link>
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>

		<bootstrap:paginate params="${filterParams}" 
			total="${productInstanceTotal?productInstanceTotal:productInstanceList.size()}" />
	</div>
</body>
</html>
