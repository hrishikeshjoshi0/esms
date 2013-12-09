<%@page import="com.esms.model.invoice.Invoice"%>
<%@page import="com.esms.model.calendar.Event"%>
<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="Amount Receivables" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h3>
						Amount Receivables (Sales, Repair, Modernization, Installation)
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
							<g:sortableColumn params="${filterParams}" property="referenceOrderNumber" title="${message(code: 'invoice.referenceOrderNumber.label', default: 'Order Number')}" />
							
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
								<g:link action="show" controller="order" id="${orderInstance.id}" class="lnk">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate params="${filterParams}" total="${amountReceivablesTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
