
<%@ page import="com.esms.model.order.PurchaseOrder" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'purchaseOrder.label', default: 'PurchaseOrder')}" />
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
						
							<g:sortableColumn property="purchaseOrderNumber" title="${message(code: 'purchaseOrder.purchaseOrderNumber.label', default: 'Purchase Order Number')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'purchaseOrder.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="type" title="${message(code: 'purchaseOrder.type.label', default: 'Type')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'purchaseOrder.description.label', default: 'Description')}" />
						
							<g:sortableColumn property="issueDate" title="${message(code: 'purchaseOrder.issueDate.label', default: 'Issue Date')}" />
						
							<g:sortableColumn property="expiryDate" title="${message(code: 'purchaseOrder.expiryDate.label', default: 'Expiry Date')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${purchaseOrderInstanceList}" var="purchaseOrderInstance">
						<tr>
						
							<td>${fieldValue(bean: purchaseOrderInstance, field: "purchaseOrderNumber")}</td>
						
							<td>${fieldValue(bean: purchaseOrderInstance, field: "status")}</td>
						
							<td>${fieldValue(bean: purchaseOrderInstance, field: "type")}</td>
						
							<td>${fieldValue(bean: purchaseOrderInstance, field: "description")}</td>
						
							<td><g:formatDate date="${purchaseOrderInstance.issueDate}" /></td>
						
							<td><g:formatDate date="${purchaseOrderInstance.expiryDate}" /></td>
						
							<td class="link">
								<g:link action="show" id="${purchaseOrderInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${purchaseOrderInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
