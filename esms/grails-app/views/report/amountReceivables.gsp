<%@page import="com.esms.model.invoice.Invoice"%>
<%@page import="com.esms.model.calendar.Event"%>
<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="Amount Receivables" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<div class="page-header">
					<h1>
						Amount Receivables (Sales, Repair, Modernization, Installation)
					</h1>
				</div>

				<filterpane:filterPane domain="com.esms.model.order.Order"
				filterProperties="${['orderNumber', 'status','type','contactName']}"
				 titleKey="default.filterPane.header" dialog="y" visible="n"
				 showSortPanel="y" showTitle="y" showButtons="y"
				 fullAssociationPathFieldNames="false" />

				<div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${amountReceivablesTotal}" />
				</div>
				<br/>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<g:sortableColumn params="${filterParams}" property="orderNumber" title="${message(code: 'invoice.invoiceNumber.label', default: 'Invoice Number')}" />
							
							<g:sortableColumn params="${filterParams}" property="organization.name" title="${message(code: 'invoice.organization.name.label', default: 'Organization')}" />
							
							<th>Title</th>
						
							<g:sortableColumn params="${filterParams}" property="type" title="${message(code: 'invoice.type.label', default: 'Type')}" />
						
							<g:sortableColumn params="${filterParams}" property="issueDate" title="${message(code: 'invoice.issueDate.label', default: 'Issue Date')}" />
						
							<th>Total Amount</th>
							
							<th>Invoiced Amount</th>
						
							<th>Received Amount</th>
							
							<th>Pending Invoice Amount</th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${amountReceivables}" var="orderInstance">
						<g:set var="eventInstance" value="${Event.findByRelatedToAndRelatedToValue('ORDER',orderInstance?.orderNumber) }" />
						<tr>
							<td>${fieldValue(bean: orderInstance, field: "orderNumber")}</td>
							
							<td>
								<g:link controller="organization" action="show" id="${orderInstance?.organization?.id}">
									${fieldValue(bean: orderInstance, field: "organization.name")}
								</g:link>
							</td>
							
							<td>
								${eventInstance?.title}
							</td>
						
							<td>${fieldValue(bean: orderInstance, field: "type")}</td>
						
							<td><g:formatDate date="${orderInstance.issueDate}" /></td>
						
							<td>
								${orderInstance?.grandTotal}
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
								<g:link action="show" controller="order" id="${orderInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
