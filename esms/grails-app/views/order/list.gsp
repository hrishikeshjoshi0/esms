
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
				
				<filterpane:currentCriteria domainBean="com.esms.model.order.Order" 
                removeImgDir="images" removeImgFile="skin/database_delete.png" fullAssociationPathFieldNames="no"/>
                
				<div class="slidingDiv">
					<div class="page-header">
						<h1>
							Search
						</h1>
					</div>
					<fieldset>
						<filterpane:filterPane domain="com.esms.model.order.Order"
		                                   filterProperties="${['orderNumber', 'status','type','contactName']}"
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
					<bootstrap:paginate params="${filterParams}" total="${orderInstanceTotal?orderInstanceTotal:orderInstanceList.size()}" />
				</div>
				<br/>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<g:sortableColumn property="orderNumber" title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />
							
							<g:sortableColumn property="organization.name" title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'order.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="type" title="${message(code: 'order.type.label', default: 'Type')}" />
						
							<g:sortableColumn property="issueDate" title="${message(code: 'order.issueDate.label', default: 'Issue Date')}" />
						
							<g:sortableColumn property="grandTotal" title="${message(code: 'order.grandTotal.label', default: 'Grand Total')}" />
						
							<g:sortableColumn property="receviedGrandTotal" title="${message(code: 'order.receviedGrandTotal.label', default: 'Received Amount')}" />
							
							<g:sortableColumn property="openGrandTotal" title="${message(code: 'order.openGrandTotal.label', default: 'Open Amount')}" />
						
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
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${orderInstanceTotal?orderInstanceTotal:orderInstanceList.size()}" />
				</div>
				<br/>
			</div>
		</div>
	</body>
</html>
