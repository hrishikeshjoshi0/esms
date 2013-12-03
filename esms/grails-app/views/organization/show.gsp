

<%@ page import="com.esms.model.party.Organization"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'organization.label', default: 'Organization')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					CUSTOMER #
					${organizationInstance?.externalId}
					|
					${organizationInstance?.name}
					<g:if test="${activeContract}">
						<g:if test="${activeContract?.type == 'SERVICE'}">
								|
								CONTRACT PERIOD :
								<g:formatDate date="${activeContract?.contractFromDate}"
								format="dd.MM.yyyy" />
								-
								<g:formatDate date="${activeContract?.contractToDate}"
								format="dd.MM.yyyy" />
						</g:if>
						<g:if test="${activeContract?.type == 'SERVICE'}">
								|
								CONTRACT :
								${contractName}
						</g:if>
						<g:elseif test="${activeContract?.type == 'REPAIR'}">
								|
								REPAIR
							</g:elseif>
					</g:if>
				</h3>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${organizationInstance?.id}" />
				<div class="well">

					<!-- TODO : HRISHI Disabled temporarily -->
					<%--<g:link class="btn btn-default btn-sm" action="edit" id="${organizationInstance?.id}">
							
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						--%>

					<button class="btn btn-sm btn-danger" type="submit" name="_action_delete">
						
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
					<g:if test="${organizationInstance.salesStatus == 'LEAD'}">
						<g:link controller="organization" action="convertLeadToCustomer"
							id="${organizationInstance?.id}" role="button" class="btn btn-default btn-sm">
							 Convert Lead
							</g:link>
					</g:if>
					<g:link controller="task" action="create" role="button"
						class="btn btn-sm btn-info"
						params="[relatedTo:'ORGANIZATION',relatedToValue:organizationInstance?.externalId,taskName:'']">
						
						 	Create Task
						</g:link>
				</div>
			</g:form>

			<div class="row">
				<div class="col-md-4">
					<div class="table-responsive">
						<table class="table table-striped table-condensed table-bordered">
							<tr>
								<td><g:message code="organization.externalId.label"
										default="External Id" /></td>

								<td><g:fieldValue bean="${organizationInstance}"
										field="externalId" /></td>


								<td><g:message code="organization.assignedto.label"
										default="Assigned To" /></td>

								<td><g:fieldValue bean="${organizationInstance}"
										field="assignedTo" /></td>
							</tr>

							<tr>
								<td><g:message code="organization.salesStatus.label"
										default="Sales Status" /></td>

								<td><g:fieldValue bean="${organizationInstance}"
										field="salesStatus" /></td>

								<td><g:message code="organization.reasonForChange.label"
										default="Reason for Change" /></td>

								<td><g:fieldValue bean="${organizationInstance}"
										field="description" /></td>
							</tr>

							<tr>
								<td><g:message
										code="organization.totalInvoicedAmount.label"
										default="Total Invoiced Amount" /></td>

								<td><b> ${params.totalInvoicedAmount}
								</b></td>

								<td><g:message
										code="organization.totalReceivedAmount.label"
										default="Total Received Amount" /></td>

								<td><b> ${params.totalReceivedAmount}
								</b></td>
							</tr>
						</table>
					</div>
				</div>

				<!-- Order Instance -->
				<div class="col-md-4">
					<g:if test="${activeContract}">
						<div class="table-responsive">
							<table class="table table-striped table-condensed table-bordered">
								<tr>
									<td><g:message code="order.totalAmount.label"
											default="Total Amount" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="totalAmount" /></td>


									<td><g:message code="order.totalTax.label"
											default="Total Tax" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="totalTax" /></td>
								</tr>

								<tr>
									<td><g:message code="order.totalDiscount.label"
											default="Total Discount" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="totalDiscount" /></td>

									<td><g:message code="order.adjustment.label"
											default="Adjustment" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="adjustment" /></td>
								</tr>

								<tr>
									<td><g:message code="order.grandTotal.label"
											default="Grand Total" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="grandTotal" /></td>

									<!-- Invoiced -->
									<td><g:message code="order.invoicedGrandTotal.label"
											default="Invoiced Amount" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="invoicedGrandTotal" /></td>
								</tr>

								<tr>
									<td><g:message code="order.pendingInvoiceGrandTotal.label"
											default="Pending Invoice Amount" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="pendingInvoiceGrandTotal" /></td>
								</tr>
							</table>
						</div>
					</g:if>
					<g:else>
						<div class="table-responsive">
							<table class="table table-striped table-condensed table-bordered">
								<tr>
									<td><b>No Active Contract</b></td>
								</tr>
							</table>
						</div>
					</g:else>
				</div>

				<div class="col-md-4">
					<g:if
						test="${activeContract?.renewalStage == 'RENEWAL_LETTER_SENT'}">
						<div class="table-responsive">
							<table class="table table-striped table-condensed table-bordered">
								<tr>
									<td><g:message code="order.renewalStage.label"
											default="Renewal Stage" /></td>

									<td>Renewal Letter Sent</td>

									<td><g:message code="order.recepientContactName.label"
											default="Recipient Contact Name" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="recepientContactName" /></td>

									<td><g:message code="order.recepientContactNumber.label"
											default="Recipient Contact Name" /></td>
								</tr>

								<tr>
									<td><g:fieldValue bean="${activeContract}"
											field="recepientContactNumber" /></td>

									<td><g:message code="order.receivedDateTime.label"
											default="Recipient Contact Name" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="receivedDateTime" /></td>

								</tr>

								<tr>
									<td><g:message code="order.handedOveryBy.label"
											default="Recipient Contact Name" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="handedOveryBy" /></td>
								</tr>
							</table>
						</div>
					</g:if>
					<g:elseif test="${activeContract?.renewalStage == 'RENEWAL_LOST'}">
						<div class="table-responsive">
							<table class="table table-striped table-condensed table-bordered">
								<tr>
									<td><g:message code="order.renewalStage.label"
											default="Renewal Stage" /></td>

									<td>Renewal Lost</td>

									<td><g:message code="order.renewalLostReason.label"
											default="Recipient Contact Name" /></td>

									<td><g:fieldValue bean="${activeContract}"
											field="renewalLostReason" /></td>
								</tr>
							</table>
						</div>
					</g:elseif>
					<g:elseif test="${activeContract?.renewalStage == 'RENEWAL_WON'}">
						<div class="table-responsive">
							<table class="table table-striped table-condensed table-bordered">
								<tr>
									<td><g:message code="order.renewalStage.label"
											default="Renewal Stage" /></td>

									<td>Renewal Won</td>
								</tr>
							</table>
						</div>
					</g:elseif>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Contacts" />
					<richui:tabLabel title="Lift Information" />
					<richui:tabLabel title="Addresses" />
					<richui:tabLabel title="Orders" />
					<richui:tabLabel title="Repair Quotes" />
					<richui:tabLabel title="Contract Quotes" />
					<richui:tabLabel title="Modernization Quotes" />
					<richui:tabLabel title="Installation Quotes" />
					<richui:tabLabel title="Events" />
					<richui:tabLabel title="Invoices" />
					<richui:tabLabel title="Payments" />
					<richui:tabLabel title="Documents" />
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render template="contactList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="liftInfo" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="addressList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="orderList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="repairQuoteList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="contractQuoteList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="modernizationQuoteList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="installationQuoteList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="eventList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="invoiceList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="paymentList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="docsList" />
					</richui:tabContent>
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>
</body>
</html>
