<%@ page import="com.esms.model.invoice.Invoice"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'invoice.label', default: 'Invoice')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					INVOICE # |
					${invoiceInstance?.invoiceNumber}
					|
					<g:link controller="organization" action="show"
						id="${invoiceInstance?.organization?.id}">
						${invoiceInstance?.organization?.name}
					</g:link>
				</h1>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${invoiceInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${invoiceInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<%--<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
					<g:link class="btn" action="create" controller="event" params="['party.id':invoiceInstance?.organization.id]">
						<i class="icon-calendar"></i>
						<g:message code="default.button.createEvent.label" default="Create Event" />
					</g:link>
					--%>

					<g:link class="btn" action="create" controller="payment"
						params="[invoiceId :invoiceInstance.id]">
						<i class="icon-briefcase"></i>
						<g:message code="default.button.registerPayment.label"
							default="Register Payment" />
					</g:link>

					<g:link controller="task" action="create" role="button"
						class="btn btn-info"
						params="[relatedTo:'INVOICE',relatedToValue:invoiceInstance?.invoiceNumber,taskName:'Reminder For Invoice']">
						<i class="icon-calendar icon-white"></i>
					 	Create Task
					</g:link>
				</div>
			</g:form>

			<%--<g:if test="${invoiceInstance?.status == 'PENDING_INVOICE' && invoiceInstance?.orderItems?.size() != 0}">
			<div class="form-actions">
				<g:jasperReport jasper="GoldContractTemplate" format="PDF"
							name="Print Agreement" delimiterAfter=" " delimiterBefore=" "
								heightAttr="15px">
					<input type="hidden" name="order" value="${invoiceInstance.id}" />
				</g:jasperReport>
			</div>
			</g:if>
			--%>
			<div class="row-fluid">
				<div class="span4">
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
							<g:fieldValue bean="${invoiceInstance}" field="referenceOrderNumber" />
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
							<g:message code="invoice.description.label" default="Description" />
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
				<div class="span4">
					<dl class="dl-horizontal">
						<dt>
							<g:message code="invoice.totalAmount.label"
								default="Total Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${invoiceInstance}" field="totalAmount" />
						</dd>
						
						<dt>
							<g:message code="invoice.adjustment.label"
								default="Adjustment" />
						</dt>

						<dd>
							<g:fieldValue bean="${invoiceInstance}" field="adjustment" />
						</dd>

						<%--<dt>
							<g:message code="invoice.totalTax.label" default="Total Tax" />
						</dt>

						<dd>
							<g:fieldValue bean="${invoiceInstance}" field="totalTax" />
						</dd>


						<dt>
							<g:message code="invoice.totalDiscount.label"
								default="Total Discount" />
						</dt>

						<dd>
							<g:fieldValue bean="${invoiceInstance}" field="totalDiscount" />
						</dd>
						--%>
						
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

	<div class="row-fluid">
		<div class="span12">
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
