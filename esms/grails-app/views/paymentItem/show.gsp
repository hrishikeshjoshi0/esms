

<%@ page import="com.esms.model.payment.PaymentItem" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'paymentItem.label', default: 'PaymentItem')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:message code="default.show.label" args="[entityName]" />
				</h3>
			</div>
			
			<div class="well">
				<g:form>
					<g:hiddenField name="id" value="${paymentItemInstance?.id}" />
						<g:link class="btn btn-default btn-sm" action="edit" id="${paymentItemInstance?.id}">
							
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-sm btn-default" type="submit" name="_action_delete">
							
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
				</g:form>
			</div>

			<div class="panel panel-default">
				<div class="panel-body">
					<dl class="dl-horizontal">

						<dt>
							<g:message code="paymentItem.lineNumber.label"
								default="Line Number" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentItemInstance}" field="lineNumber" />
						</dd>


						<dt>
							<g:message code="paymentItem.orderNumber.label"
								default="Order Number" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentItemInstance}" field="orderNumber" />
						</dd>


						<dt>
							<g:message code="paymentItem.amount.label" default="Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentItemInstance}" field="amount" />
						</dd>


						<dt>
							<g:message code="paymentItem.description.label"
								default="Description" />
						</dt>

						<dd>
							<g:fieldValue bean="${paymentItemInstance}" field="description" />
						</dd>


						<dt>
							<g:message code="paymentItem.payment.label" default="Payment" />
						</dt>

						<dd>
							<g:link controller="payment" action="show"
								id="${paymentItemInstance?.payment?.id}">
								${paymentItemInstance?.payment?.encodeAsHTML()}
							</g:link>
						</dd>


					</dl>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
