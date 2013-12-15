

<%@ page import="com.esms.model.order.PurchaseOrder" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'purchaseOrder.label', default: 'PurchaseOrder')}" />
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
					<g:hiddenField name="id" value="${purchaseOrderInstance?.id}" />
					<g:link class="btn btn-default btn-sm" action="edit"
						id="${purchaseOrderInstance?.id}">

						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-sm btn-default" type="submit"
						name="_action_delete">

						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</g:form>
			</div>

			<div class="panel panel-default">
				<div class="panel-body">
					<dl class="dl-horizontal">

						<dt>
							<g:message code="purchaseOrder.purchaseOrderNumber.label"
								default="Purchase Order Number" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}"
								field="purchaseOrderNumber" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.status.label" default="Status" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}" field="status" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.type.label" default="Type" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}" field="type" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.description.label"
								default="Description" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}" field="description" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.issueDate.label"
								default="Issue Date" />
						</dt>

						<dd>
							<g:formatDate date="${purchaseOrderInstance?.issueDate}" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.expiryDate.label"
								default="Expiry Date" />
						</dt>

						<dd>
							<g:formatDate date="${purchaseOrderInstance?.expiryDate}" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.totalAmount.label"
								default="Total Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}" field="totalAmount" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.totalTax.label"
								default="Total Tax" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}" field="totalTax" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.totalDiscount.label"
								default="Total Discount" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}"
								field="totalDiscount" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.grandTotal.label"
								default="Grand Total" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}" field="grandTotal" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.termsAndConditions.label"
								default="Terms And Conditions" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}"
								field="termsAndConditions" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.vendorName.label"
								default="Vendor Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}" field="vendorName" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.contactName.label"
								default="Contact Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}" field="contactName" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.inventoryJournalEntries.label"
								default="Inventory Journal Entries" />
						</dt>

						<g:each in="${purchaseOrderInstance.inventoryJournalEntries}"
							var="i">
							<dd>
								<g:link controller="inventoryJournal" action="show" id="${i.id}">
									${i?.encodeAsHTML()}
								</g:link>
							</dd>
						</g:each>


						<dt>
							<g:message code="purchaseOrder.openGrandTotal.label"
								default="Open Grand Total" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}"
								field="openGrandTotal" />
						</dd>


						<dt>
							<g:message code="purchaseOrder.organization.label"
								default="Organization" />
						</dt>

						<dd>
							<g:link controller="organization" action="show"
								id="${purchaseOrderInstance?.organization?.id}">
								${purchaseOrderInstance?.organization?.encodeAsHTML()}
							</g:link>
						</dd>


						<dt>
							<g:message code="purchaseOrder.paidGrandTotal.label"
								default="Paid Grand Total" />
						</dt>

						<dd>
							<g:fieldValue bean="${purchaseOrderInstance}"
								field="paidGrandTotal" />
						</dd>


						<%--<dt>
							<g:message code="purchaseOrder.purchaseOrderItems.label"
								default="Purchase Order Items" />
						</dt>

						<g:each in="${purchaseOrderInstance.purchaseOrderItems}" var="p">
							<dd>
								<g:link controller="purchaseOrderItem" action="show"
									id="${p.id}">
									${p?.encodeAsHTML()}
								</g:link>
							</dd>
						</g:each>
						--%>
					</dl>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
