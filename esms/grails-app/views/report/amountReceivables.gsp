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

				<filterpane:filterPane domain="com.esms.model.invoice.Invoice"
				filterProperties="${['invoiceNumber', 'status','type','contactName']}"
				 titleKey="default.filterPane.header" dialog="y" visible="n"
				 showSortPanel="y" showTitle="y" showButtons="y"
				 fullAssociationPathFieldNames="false" />

				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
							<g:sortableColumn params="${filterParams}" property="invoiceNumber" title="${message(code: 'invoice.invoiceNumber.label', default: 'Invoice Number')}" />
							
							<g:sortableColumn params="${filterParams}" property="organization.name" title="${message(code: 'invoice.organization.name.label', default: 'Organization')}" />
							
							<th>Title</th>
						
							<g:sortableColumn params="${filterParams}" property="type" title="${message(code: 'invoice.type.label', default: 'Type')}" />
						
							<g:sortableColumn params="${filterParams}" property="issueDate" title="${message(code: 'invoice.issueDate.label', default: 'Issue Date')}" />
						
							<th>
								${message(code: 'invoice.grandTotal.label', default: 'Grand Total')}
							</th>
							
							<th>
								${message(code: 'invoice.openGrandTotal.label', default: 'Outstanding Amount')}
							</th>
							
							<th>
								${message(code: 'invoice.receviedGrandTotal.label', default: 'Received Amount')}
							</th>
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${amountReceivables}" var="invoiceInstance">
						<g:set var="eventInstance" value="${Event.findByRelatedToAndRelatedToValue('ORDER',invoiceInstance?.referenceOrderNumber) }" />
						<tr>
							<td>${fieldValue(bean: invoiceInstance, field: "invoiceNumber")}</td>
							
							<td>
								<g:link controller="organization" action="show" id="${invoiceInstance?.organization?.id}">
									${fieldValue(bean: invoiceInstance, field: "organization.name")}
								</g:link>
							</td>
							
							<td>
								${eventInstance?.title}
							</td>
						
							<td>${fieldValue(bean: invoiceInstance, field: "type")}</td>
						
							<td><g:formatDate date="${invoiceInstance.issueDate}" /></td>
							
							<td>
								${fieldValue(bean : invoiceInstance, field : "grandTotal") }
							</td>
							
							<td>
								${fieldValue(bean : invoiceInstance, field : "openGrandTotal") }
							</td>
							
							<td>
								${fieldValue(bean : invoiceInstance, field : "receviedGrandTotal") }
							</td>
						
							<td class="link">
								<g:link action="show" controller="invoice" id="${invoiceInstance.id}" class="lnk">Show &raquo;</g:link>
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
