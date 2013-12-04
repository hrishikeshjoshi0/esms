
<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h3>
						<g:message code="default.list.label" args="[entityName]" />
					</h3>
				</div>
				
				<filterpane:filterPane domain="com.esms.model.order.Order"
		                filterProperties="${['orderNumber', 'status','type','contactName']}"
						 titleKey="default.filterPane.header" dialog="y" visible="n"
										showSortPanel="y" showTitle="y" showButtons="y"
										fullAssociationPathFieldNames="false" />
										
				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
							<g:sortableColumn params="${filterParams}" property="orderNumber" title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />
							
							<g:sortableColumn params="${filterParams}" property="organization.name" title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />
						
							<g:sortableColumn params="${filterParams}" property="status" title="${message(code: 'order.status.label', default: 'Status')}" />
						
							<g:sortableColumn params="${filterParams}" property="type" title="${message(code: 'order.type.label', default: 'Type')}" />
						
							<g:sortableColumn params="${filterParams}" property="issueDate" title="${message(code: 'order.issueDate.label', default: 'Issue Date')}" />
						
							<th>Total Amount</th>
							
							<th>Invoiced Amount</th>
						
							<th>Received Amount</th>
							
							<th>Pending Invoice Amount</th>
						
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
								${orderInstance?.invoicedGrandTotal}
							</td>
							
							<td>
								${orderInstance?.getReceivedAmount()}
							</td>
							
							<td>
								${fieldValue(bean : orderInstance, field : "pendingInvoiceGrandTotal") }
							</td>
							
							<td class="link">
								<g:link action="show" id="${orderInstance.id}" class="btn btn-default btn-xs">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${orderInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
