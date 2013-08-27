<%@ page import="com.esms.model.payment.Payment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
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
					<filterpane:paginate total="${paymentInstanceTotal?paymentInstanceTotal:paymentInstanceList.size()}" domainBean="com.esms.model.payment.Payment" />
				</div>
				<br/>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<g:sortableColumn property="paymentNumber" title="${message(code: 'payment.paymentNumber.label', default: 'Payment Number')}" />
							
							<g:sortableColumn property="lineNumber" title="${message(code: 'paymentItem.lineNumber.label', default: 'Line Number')}" />
						
							<g:sortableColumn property="orderNumber" title="${message(code: 'paymentItem.orderNumber.label', default: 'Order Number')}" />
							
							<g:sortableColumn property="organization.name" title="Customer/Building Name" />
						
							<g:sortableColumn property="bank" title="${message(code: 'payment.bank.label', default: 'Bank')}" />
							
							<g:sortableColumn property="chequeNumber" title="${message(code: 'payment.chequeNumber.label', default: 'Cheque Number')}" />
							
							<g:sortableColumn property="amount" title="${message(code: 'paymentItem.amount.label', default: 'Amount')}" />
						
							<g:sortableColumn property="paymentMethod" title="${message(code: 'payment.paymentMethod.label', default: 'Payment Type')}" />
						
						
							<g:sortableColumn property="branch" title="${message(code: 'payment.branch.label', default: 'Branch')}" />
							
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${paymentInstanceList}" var="paymentInstance">
							<g:each in="${paymentInstance?.paymentItems}" var="paymentItemInstance">
								<tr>
									<td>${fieldValue(bean: paymentInstance, field: "paymentNumber")}</td>
									
									<td>${fieldValue(bean: paymentItemInstance, field: "lineNumber")}</td>
								
									<td>
										${paymentItemInstance?.order?.orderNumber}
									</td>
									
									<td>
										${paymentItemInstance?.order?.organization?.name}
									</td>	
								
									<td>${fieldValue(bean: paymentInstance, field: "bank")}</td>
									
									<td>${fieldValue(bean: paymentInstance, field: "chequeNumber")}</td>
									
									<td>${fieldValue(bean: paymentItemInstance, field: "amount")}</td>
								
									<td>${fieldValue(bean: paymentInstance, field: "paymentMethod")}</td>
								
									<td>${fieldValue(bean: paymentInstance, field: "branch")}</td>
								
									<td class="link">
										<g:link action="show" id="${paymentInstance.id}" class="btn btn-small">Show &raquo;</g:link>
									</td>
								</tr>
							</g:each>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<filterpane:paginate total="${paymentInstanceTotal?paymentInstanceTotal:paymentInstanceList.size()}" domainBean="com.esms.model.payment.Payment" />
				</div>
			</div>
		</div>
	</body>
</html>
