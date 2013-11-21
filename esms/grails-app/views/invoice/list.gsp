
<%@ page import="com.esms.model.invoice.Invoice" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'invoice.label', default: 'Invoice')}" />
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
				
				<filterpane:filterPane domain="com.esms.model.invoice.Invoice"
		                filterProperties="${['invoiceNumber', 'status','type','contactName']}"
						 titleKey="default.filterPane.header" dialog="y" visible="n"
										showSortPanel="y" showTitle="y" showButtons="y"
										fullAssociationPathFieldNames="false" />
										
				<div class="pagination">
					<bootstrap:paginate total="${invoiceInstanceTotal}" />
				</div>
				<br/>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						
							<g:sortableColumn property="invoiceNumber" title="${message(code: 'invoice.invoiceNumber.label', default: 'Invoice Number')}" />
							
							<g:sortableColumn property="invoiceNumber" title="${message(code: 'invoice.referenceOrderNumber.label', default: 'Reference Order Number')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'invoice.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="type" title="${message(code: 'invoice.type.label', default: 'Type')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'invoice.description.label', default: 'Description')}" />
						
							<g:sortableColumn property="issueDate" title="${message(code: 'invoice.issueDate.label', default: 'Issue Date')}" />
						
							<g:sortableColumn property="expiryDate" title="${message(code: 'invoice.expiryDate.label', default: 'Expiry Date')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${invoiceInstanceList}" var="invoiceInstance">
						<tr>
						
							<td>${fieldValue(bean: invoiceInstance, field: "invoiceNumber")}</td>
							
							<td>${fieldValue(bean: invoiceInstance, field: "referenceOrderNumber")}</td>
						
							<td>${fieldValue(bean: invoiceInstance, field: "status")}</td>
						
							<td>${fieldValue(bean: invoiceInstance, field: "type")}</td>
						
							<td>${fieldValue(bean: invoiceInstance, field: "description")}</td>
						
							<td><g:formatDate date="${invoiceInstance.issueDate}" /></td>
						
							<td><g:formatDate date="${invoiceInstance.expiryDate}" /></td>
						
							<td class="link">
								<g:link action="show" id="${invoiceInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>
