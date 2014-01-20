<%@ page import="com.esms.model.payment.Payment" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'payment.label', default: 'Payment')}" />
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
				
				<filterpane:filterPane domain="com.esms.model.payment.Payment"
                     filterProperties="${['paymentNumber', 'bank','branch','totalAmount','chequeIssueDate','clearanceDate']}"
                     associatedProperties="${['organization.name']}"
                     titleKey="default.filterPane.header" dialog="y" visible="n"
					 showSortPanel="y" showTitle="y" showButtons="y"
					 fullAssociationPathFieldNames="false" />
				
				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
							<g:sortableColumn params="${filterParams}" property="paymentNumber" title="${message(code: 'payment.paymentNumber.label', default: 'Payment Number')}" />
							
							<g:sortableColumn params="${filterParams}" property="paymentItem.invoice.invoiceNumber" title="${message(code: 'paymentItem.invoice.label', default: 'Invoice Number')}" />
							
							<g:sortableColumn params="${filterParams}" property="paymentItem.invoice.referenceOrderNumber" title="${message(code: 'paymentItem.invoice.referenceOrderNumber.label', default: 'Order Number')}" />
							
							<g:sortableColumn params="${filterParams}" property="organization.name" title="Customer/Building Name" />
						
							<g:sortableColumn params="${filterParams}" property="bank" title="${message(code: 'payment.bank.label', default: 'Bank')}" />
							
							<g:sortableColumn params="${filterParams}" property="chequeNumber" title="${message(code: 'payment.chequeNumber.label', default: 'Cheque Number')}" />
							
							<g:sortableColumn params="${filterParams}" property="amount" title="${message(code: 'paymentItem.amount.label', default: 'Amount')}" />
						
							<g:sortableColumn params="${filterParams}" property="paymentMethod" title="${message(code: 'payment.paymentMethod.label', default: 'Payment Type')}" />
						
						
							<g:sortableColumn params="${filterParams}" property="branch" title="${message(code: 'payment.branch.label', default: 'Branch')}" />
							
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${paymentInstanceList}" var="paymentInstance">
								<tr>
									<td>${fieldValue(bean: paymentInstance, field: "paymentNumber")}</td>
									
									<td>
										<g:if test="${paymentInstance?.paymentItems?.size() > 0}">
											${paymentInstance?.paymentItems?.first()?.invoice?.invoiceNumber}
										</g:if>
										<g:else>
											
										</g:else>
									</td>
									
									<td>
										<g:if test="${paymentInstance?.paymentItems?.size() > 0}">
											${paymentInstance?.paymentItems?.first()?.invoice?.referenceOrderNumber}
										</g:if>
										<g:else>
											
										</g:else>
									</td>
									
									<td>
										${paymentInstance?.organization?.name}
									</td>	
								
									<td>${fieldValue(bean: paymentInstance, field: "bank")}</td>
									
									<td>${fieldValue(bean: paymentInstance, field: "chequeNumber")}</td>
									
									<td>${paymentInstance?.totalAmount}</td>
								
									<td>${fieldValue(bean: paymentInstance, field: "paymentMethod")}</td>
								
									<td>${fieldValue(bean: paymentInstance, field: "branch")}</td>
								
									<td class="link">
										<g:link action="show" id="${paymentInstance.id}" class="lnk">Show &raquo;</g:link>
									</td>
								</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate params="${filterParams}" total="${paymentInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
