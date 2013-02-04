
<%@ page import="com.esms.model.quote.Quote" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'quote.label', default: 'Quote')}" />
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
						
							<g:sortableColumn property="quoteName" title="${message(code: 'quote.quoteName.label', default: 'Quote Name')}" />
							
							<g:sortableColumn property="organization.name" title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'quote.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="type" title="${message(code: 'quote.type.label', default: 'Type')}" />
						
							<g:sortableColumn property="salesChannel" title="${message(code: 'quote.salesChannel.label', default: 'Sales Channel')}" />
						
							<g:sortableColumn property="description" title="${message(code: 'quote.description.label', default: 'Description')}" />
						
							<g:sortableColumn property="issueDate" title="${message(code: 'quote.issueDate.label', default: 'Issue Date')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${quoteInstanceList}" var="quoteInstance">
						<tr>
							<td>${fieldValue(bean: quoteInstance, field: "quoteName")}</td>
							
							<td>
								<g:link controller="organization" action="show" id="${quoteInstance?.organization?.id}">
									${fieldValue(bean: quoteInstance, field: "organization.name")}
								</g:link>
							</td>
						
							<td>${fieldValue(bean: quoteInstance, field: "status")}</td>
						
							<td>${fieldValue(bean: quoteInstance, field: "type")}</td>
						
							<td>${fieldValue(bean: quoteInstance, field: "salesChannel")}</td>
						
							<td>${fieldValue(bean: quoteInstance, field: "description")}</td>
						
							<td><g:formatDate date="${quoteInstance.issueDate}" /></td>
						
							<td class="link">
								<g:link action="show" id="${quoteInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${quoteInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
