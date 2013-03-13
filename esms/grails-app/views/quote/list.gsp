<%@ page import="com.esms.model.quote.Quote" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'quote.label', default: 'Quote')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<filterpane:includes />
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<filterpane:currentCriteria domainBean="com.esms.model.quote.Quote" 
                removeImgDir="images" removeImgFile="skin/database_delete.png" fullAssociationPathFieldNames="no"/>
                
				<div class="slidingDiv">
					<div class="page-header">
						<h1>
							Search
						</h1>
					</div>
					<fieldset>
						<filterpane:filterPane domain="com.esms.model.quote.Quote"
                                   filterProperties="${['quoteNumber', 'quoteName','status','organization.name']}"
                                   titleKey="default.filterPane.header"
                                   dialog="false"
                                   visible="y"
                                   showSortPanel="n"
                                   showTitle="n"
                                   fullAssociationPathFieldNames="false"/>
	                 </fieldset>       
				</div>
				
				<div class="page-header">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				
               <div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${quoteInstanceTotal?quoteInstanceTotal:quoteInstanceList.size()}" />
				</div>
				<br/>                 
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
				<%--
				<div class="pagination">
					<filterpane:paginate total="${quoteInstanceTotal?quoteInstanceTotal:quoteInstanceList.size()}" domainBean="com.esms.model.party.Organization" />
					<filterpane:filterButton text="Filter Me" appliedText="Change Filter" />
	                <filterpane:isNotFiltered>Pure and Unfiltered!</filterpane:isNotFiltered>
	                <filterpane:isFiltered>Filter Applied!</filterpane:isFiltered>
				</div>
					--%>
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${quoteInstanceTotal?quoteInstanceTotal:quoteInstanceList.size()}" />
				</div>
				<br/>
			</div>
		</div>
	</body>
</html>
