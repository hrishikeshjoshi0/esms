<%@ page import="com.esms.model.order.Order"%>
<%@ page import="com.esms.model.invoice.Invoice"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'invoice.label', default: 'Invoice')}" />
<title>
	Invoice::${invoiceInstance?.invoiceNumber}:${invoiceInstance?.organization?.name}
</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Invoice
					${invoiceInstance?.invoiceNumber}
					:
					<g:link controller="organization" action="show"
						id="${invoiceInstance?.organization?.id}">
						${invoiceInstance?.organization?.name}
					</g:link>
				</h3>
			</div>


			<g:form>
				<g:hiddenField name="id" value="${invoiceInstance?.id}" />
				<div class="well">
					<g:if test="${invoiceInstance?.status != 'CLOSED'}">
						<g:link class="btn btn-primary btn-sm" action="create"
							controller="payment" params="[invoiceId :invoiceInstance.id]">
							<g:message code="default.button.registerPayment.label"
								default="Register Payment" />
						</g:link>
					</g:if>


					<g:link controller="task" action="create" role="button"
						class="btn btn-default btn-sm"
						params="[relatedTo:'INVOICE',relatedToValue:invoiceInstance?.invoiceNumber,taskName:'Reminder For Invoice']">
					 	Create Task
					</g:link>

					<g:if test="${invoiceInstance?.status != 'CLOSED'}">
						<g:link class="btn btn-default btn-sm" action="edit"
							id="${invoiceInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
					</g:if>
				</div>
			</g:form>


			<div class="panel panel-default">
				<div class="panel-body">
					<div class="col-md-4">
						<dl class="dl-horizontal">

							<dt>
								<g:message code="invoice.invoiceNumber.label"
									default="Invoice Number" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}" field="invoiceNumber" />
							</dd>

							<dt>
								<g:message code="invoice.referenceOrderNumber.label"
									default="Reference Order Number" />
							</dt>

							<dd>
								<g:link class="link" controller="order" action="show"
									id="${Order.findByOrderNumber(invoiceInstance?.referenceOrderNumber)?.id}">
									<g:fieldValue bean="${invoiceInstance}"
										field="referenceOrderNumber" />
								</g:link>
							</dd>


							<dt>
								<g:message code="invoice.status.label" default="Status" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}" field="status" />
							</dd>


							<dt>
								<g:message code="invoice.type.label" default="Type" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}" field="type" />
							</dd>


							<dt>
								<g:message code="invoice.description.label"
									default="Description" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}" field="description" />
							</dd>


							<dt>
								<g:message code="invoice.issueDate.label" default="Issue Date" />
							</dt>

							<dd>
								<g:formatDate date="${invoiceInstance?.issueDate}" />
							</dd>


							<dt>
								<g:message code="invoice.expiryDate.label" default="Expiry Date" />
							</dt>

							<dd>
								<g:formatDate date="${invoiceInstance?.expiryDate}" />
							</dd>


							<dt>
								<g:message code="invoice.contactName.label"
									default="Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}" field="contactName" />
							</dd>

							<g:if test="${invoiceInstance.type == 'SERVICE' }">
								<dt>
									<g:message code="invoice.contractFromDate.label"
										default="Contract Starts" />
								</dt>

								<dd>
									<g:formatDate date="${invoiceInstance.contractFromDate}"
										format="dd-MM-yyyy" />
								</dd>

								<dt>
									<g:message code="invoice.contractToDate.label"
										default="Contract Ends" />
								</dt>

								<dd>
									<g:formatDate date="${invoiceInstance.contractToDate}"
										format="dd-MM-yyyy" />
								</dd>
							</g:if>
						</dl>
					</div>
					<div class="col-md-4">
						<dl class="dl-horizontal">
							<dt>
								<g:message code="invoice.totalAmount.label"
									default="Total Amount" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}" field="totalAmount" />
							</dd>

							<dt>
								<g:message code="invoice.adjustment.label" default="Adjustment" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}" field="adjustment" />
							</dd>

							<dt>
								<g:message code="invoice.grandTotal.label" default="Grand Total" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}" field="grandTotal" />
							</dd>

							<dt>
								<g:message code="invoice.openGrandTotal.label"
									default="Open Amount" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}" field="openGrandTotal" />
							</dd>

							<dt>
								<g:message code="invoice.receviedGrandTotal.label"
									default="Received Amount" />
							</dt>

							<dd>
								<g:fieldValue bean="${invoiceInstance}"
									field="receviedGrandTotal" />
							</dd>
						</dl>
					</div>
				</div>
			</div>
		</div>
	
		<div class="col-md-12">
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Lines" />
					<richui:tabLabel title="Payments" />
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render template="invoiceLineList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="paymentList" />
					</richui:tabContent>
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>
</body>
</html>
