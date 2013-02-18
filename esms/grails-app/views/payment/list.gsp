
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
				<div class="page-header">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
						
							<g:sortableColumn property="paymentNumber" title="${message(code: 'payment.paymentNumber.label', default: 'Payment Number')}" />
						
							<g:sortableColumn property="paymentType" title="${message(code: 'payment.paymentType.label', default: 'Payment Type')}" />
						
							<g:sortableColumn property="chequeNumber" title="${message(code: 'payment.chequeNumber.label', default: 'Cheque Number')}" />
						
							<g:sortableColumn property="bank" title="${message(code: 'payment.bank.label', default: 'Bank')}" />
						
							<g:sortableColumn property="branch" title="${message(code: 'payment.branch.label', default: 'Branch')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'payment.status.label', default: 'Status')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${paymentInstanceList}" var="paymentInstance">
						<tr>
						
							<td>${fieldValue(bean: paymentInstance, field: "paymentNumber")}</td>
						
							<td>${fieldValue(bean: paymentInstance, field: "paymentType")}</td>
						
							<td>${fieldValue(bean: paymentInstance, field: "chequeNumber")}</td>
						
							<td>${fieldValue(bean: paymentInstance, field: "bank")}</td>
						
							<td>${fieldValue(bean: paymentInstance, field: "branch")}</td>
						
							<td>${fieldValue(bean: paymentInstance, field: "status")}</td>
						
							<td class="link">
								<g:link action="show" id="${paymentInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${paymentInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
