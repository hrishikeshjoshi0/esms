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
					Payment :
					${paymentInstance?.paymentNumber}
				</h1>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${paymentInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${paymentInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>
			
			<div class="row">
				<div class="span12">
					<h3 style="margin-left: 20px;">
						<g:message code="payment.paymentName.label" default="Payment Number" /> : 
						<g:fieldValue bean="${paymentInstance}" field="paymentNumber" />
					</h3>
					
				</div>
			</div>
			<div class="row">
				<div class="span4">
					<dl class="dl-horizontal" style="margin-left: -30px;">
						<dt>
							<g:message code="payment.status.label" default="Status" />
						</dt>
						<dd>
							<g:fieldValue bean="${paymentInstance}" field="status" />
						</dd>
						<dt>
							<g:message code="payment.type.label" default="Payment Type" />
						</dt>
						<dd>
							<g:fieldValue bean="${paymentInstance}" field="paymentType" />
						</dd>
						<dt>
							<g:message code="payment.salesChannel.label"
								default="Check Number" />
						</dt>
						<dd>
							<g:fieldValue bean="${paymentInstance}" field="checkNumber" />
						</dd>
						
					</dl>
				</div>
				<div class="span4">
					<dl class="dl-horizontal" style="margin-left: -30px;">
						<dt>
							<g:message code="payment.totalAmount.label" default="Total Amount" />
						</dt>
						<dd>
							<g:fieldValue bean="${paymentInstance}" field="totalAmount" />
						</dd>
						<dt>
							<g:message code="payment.totalTax.label" default="Paid Amount" />
						</dt>
						<dd>
							<g:fieldValue bean="${paymentInstance}" field="paidAmount" />
						</dd>
						<dt>
							<g:message code="payment.totalDiscount.label"
								default="Balance Amount" />
						</dt>
						<dd>
							<g:fieldValue bean="${paymentInstance}" field="balanceAmount" />
						</dd>
						
					</dl>
				</div>
			</div>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<div class="accordion" id="detailViewAccordion">
				<!-- Contacts -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseContact"> <span class="left"> <i
								class="icon-user"></i> Line Items
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseContact" class="accordion-body collapse in">
						<div class="accordion-inner">
							<g:render template="paymentItemList" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
