
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
				
				<filterpane:filterPane domain="com.esms.model.order.Order"
		                filterProperties="${['orderNumber', 'status','type','contactName']}"
						 titleKey="default.filterPane.header" dialog="y" visible="n"
										showSortPanel="y" showTitle="y" showButtons="y"
										fullAssociationPathFieldNames="false" />
										
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${orderInstanceTotal}" />
				</div>
				<br/>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<g:sortableColumn params="${filterParams}" property="orderNumber" title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />
							
							<g:sortableColumn params="${filterParams}" property="organization.name" title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />
						
							<g:sortableColumn params="${filterParams}" property="status" title="${message(code: 'order.status.label', default: 'Status')}" />
						
							<g:sortableColumn params="${filterParams}" property="type" title="${message(code: 'order.type.label', default: 'Type')}" />
						
							<g:sortableColumn params="${filterParams}" property="issueDate" title="${message(code: 'order.issueDate.label', default: 'Issue Date')}" />
						
							<g:sortableColumn params="${filterParams}" property="grandTotal" title="${message(code: 'order.grandTotal.label', default: 'Grand Total')}" />
						
							<g:sortableColumn params="${filterParams}" property="receviedGrandTotal" title="${message(code: 'order.receviedGrandTotal.label', default: 'Received Amount')}" />
							
							<g:sortableColumn params="${filterParams}" property="openGrandTotal" title="${message(code: 'order.openGrandTotal.label', default: 'Open Amount')}" />
						
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
						
							<td>
								${fieldValue(bean : orderInstance, field : "grandTotal") }
							</td>
							
							<td>
								${fieldValue(bean : orderInstance, field : "receviedGrandTotal") }
							</td>
							
							<td>
								${fieldValue(bean : orderInstance, field : "openGrandTotal") }
							</td>
						
							<td class="link">
								<g:link action="show" id="${orderInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
