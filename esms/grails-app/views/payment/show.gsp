

<%@ page import="com.esms.model.payment.Payment"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'payment.label', default: 'Payment')}" />
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
				<g:hiddenField name="id" value="${paymentInstance?.id}" />
				<div class="form-actions">
					<%--<g:link class="btn" action="edit" id="${paymentInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					--%><button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="payment.paymentNumber.label"
						default="Payment Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${paymentInstance}" field="paymentNumber" />
				</dd>


				<dt>
					<g:message code="payment.paymentMethod.label"
						default="Payment Type" />
				</dt>

				<dd>
					<g:fieldValue bean="${paymentInstance}" field="paymentMethod" />
				</dd>


				<dt>
					<g:message code="payment.chequeNumber.label"
						default="Cheque Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${paymentInstance}" field="chequeNumber" />
				</dd>


				<dt>
					<g:message code="payment.bank.label" default="Bank" />
				</dt>

				<dd>
					<g:fieldValue bean="${paymentInstance}" field="bank" />
				</dd>


				<dt>
					<g:message code="payment.branch.label" default="Branch" />
				</dt>

				<dd>
					<g:fieldValue bean="${paymentInstance}" field="branch" />
				</dd>


				<dt>
					<g:message code="payment.description.label" default="Description" />
				</dt>

				<dd>
					<g:fieldValue bean="${paymentInstance}" field="description" />
				</dd>


				<dt>
					<g:message code="payment.totalAmount.label" default="Total Amount" />
				</dt>

				<dd>
					<g:fieldValue bean="${paymentInstance}" field="totalAmount" />
				</dd>


				<dt>
					<g:message code="payment.balanceAmount.label"
						default="Balance Amount" />
				</dt>

				<dd>
					<g:fieldValue bean="${paymentInstance}" field="balanceAmount" />
				</dd>


				<dt>
					<g:message code="payment.matchedAmount.label"
						default="Matched Amount" />
				</dt>

				<dd>
					<g:fieldValue bean="${paymentInstance}" field="matchedAmount" />
				</dd>
			</dl>
		</div>

		<div class="span12">

			<!--  -->
			<ul class="nav nav-tabs" id="organization_show_tab">
				<li class="active"><a href="#paymentItemsTabPane"
					data-toggle="tab">Lines</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="paymentItemsTabPane">
					<g:render template="paymentItemList" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
