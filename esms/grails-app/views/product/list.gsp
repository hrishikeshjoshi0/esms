<%@ page import="com.esms.model.product.Product" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
<body>
	<bs3:pageHeader pageHeaderLabel="${message(code: 'default.list.label',args:[entityName])}" />

	<filterpane:filterPane 
		domain="com.esms.model.product.Product"
		filterProperties="${['productNumber', 'productName','productType','isVirtual']}"
		titleKey="default.filterPane.header" dialog="y" visible="n"
		showSortPanel="n" showTitle="n" fullAssociationPathFieldNames="false" />

	<bs3:table
		columns="${['productName', 'productType','introductionDate','quantityOnHand','incoming','outgoing','']}"
		params="${filterParams}"
		total="${productInstanceTotal?productInstanceTotal:productInstanceList.size()}">
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
						id="${productInstance.id}" class="btn-xs">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</bs3:table>
</body>
</html>
