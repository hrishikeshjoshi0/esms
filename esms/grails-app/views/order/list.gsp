
<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
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
							<g:sortableColumn property="orderNumber" title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />
							
							<g:sortableColumn property="organization.name" title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'order.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="type" title="${message(code: 'order.type.label', default: 'Type')}" />
						
							<g:sortableColumn property="issueDate" title="${message(code: 'order.issueDate.label', default: 'Issue Date')}" />
						
							<g:sortableColumn property="expiryDate" title="${message(code: 'order.expiryDate.label', default: 'Expiry Date')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${orderInstanceList}" var="orderInstance">
						<tr>
							<td>${fieldValue(bean: orderInstance, field: "orderNumber")}</td>
							
							<td>
								<g:link controller="organization" action="show" id="${orderInstance?.organization?.id}">
									${fieldValue(bean: orderInstance, field: "organization.name")}
								</g:link>
							</td>
						
							<td>${fieldValue(bean: orderInstance, field: "status")}</td>
						
							<td>${fieldValue(bean: orderInstance, field: "type")}</td>
						
							<td><g:formatDate date="${orderInstance.issueDate}" /></td>
						
							<td><g:formatDate date="${orderInstance.expiryDate}" /></td>
						
							<td class="link">
								<g:link action="show" id="${orderInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${orderInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
