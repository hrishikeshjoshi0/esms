

<%@ page import="com.esms.model.payment.PaymentItem" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'paymentItem.label', default: 'PaymentItem')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>
			
			<g:form>
				<g:hiddenField name="id" value="${paymentItemInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${paymentItemInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">
				
							<dt><g:message code="paymentItem.lineNumber.label" default="Line Number" /></dt>
						
							<dd><g:fieldValue bean="${paymentItemInstance}" field="lineNumber"/></dd>
						
				
							<dt><g:message code="paymentItem.orderNumber.label" default="Order Number" /></dt>
						
							<dd><g:fieldValue bean="${paymentItemInstance}" field="orderNumber"/></dd>
						
				
							<dt><g:message code="paymentItem.amount.label" default="Amount" /></dt>
						
							<dd><g:fieldValue bean="${paymentItemInstance}" field="amount"/></dd>
						
				
							<dt><g:message code="paymentItem.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${paymentItemInstance}" field="description"/></dd>
						
				
							<dt><g:message code="paymentItem.payment.label" default="Payment" /></dt>
						
							<dd><g:link controller="payment" action="show" id="${paymentItemInstance?.payment?.id}">${paymentItemInstance?.payment?.encodeAsHTML()}</g:link></dd>
						
				
			</dl>
		</div>
	</div>
</body>
</html>
