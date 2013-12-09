<%@ page import="com.esms.model.quote.Quote" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'quote.label', default: 'Quote')}" />
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
				
				<filterpane:filterPane domain="com.esms.model.quote.Quote"
					 filterProperties="${['quoteNumber', 'quoteName','status','organization.name']}"
                     titleKey="default.filterPane.header" dialog="y" visible="n"
										showSortPanel="y" showTitle="y" showButtons="y"
										fullAssociationPathFieldNames="false" />
				
				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
							<g:sortableColumn params="${filterParams}" property="quoteNumber" title="${message(code: 'quote.quoteNumber.label', default: 'Quote Number')}" />
							
							<g:sortableColumn params="${filterParams}" property="quoteName" title="${message(code: 'quote.quoteName.label', default: 'Quote Name')}" />
							
							<g:sortableColumn params="${filterParams}" property="organization.name" title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />
						
							<g:sortableColumn params="${filterParams}" property="status" title="${message(code: 'quote.status.label', default: 'Status')}" />
						
							<g:sortableColumn params="${filterParams}" property="type" title="${message(code: 'quote.type.label', default: 'Type')}" />
						
							<g:sortableColumn params="${filterParams}" property="salesChannel" title="${message(code: 'quote.salesChannel.label', default: 'Sales Channel')}" />
						
							<g:sortableColumn params="${filterParams}" property="description" title="${message(code: 'quote.description.label', default: 'Description')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${quoteInstanceList}" var="quoteInstance">
						<tr>
							<td>${fieldValue(bean: quoteInstance, field: "quoteNumber")}</td>
							
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
						
							<td class="link">
								<g:link action="show" id="${quoteInstance.id}" class="lnk">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate params="${filterParams}" total="${quoteInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
