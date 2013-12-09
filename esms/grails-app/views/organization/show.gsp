<%@ page import="com.esms.model.party.Organization"%>
<!doctype html>
<html>
<head>
	<meta name="layout" content="bootstrap3">
	<g:set var="entityName"
		value="${message(code: 'organization.label', default: 'Customer')}" />
	<title>
		Customer::${organizationInstance?.externalId}:${organizationInstance?.name}
	</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Customer ${organizationInstance?.externalId}:${organizationInstance?.name}
				</h3>
				<h4>
					<g:if test="${activeContract}">
						<span class=" "> 
						<g:if
								test="${activeContract?.type == 'SERVICE'}">
										Current Active Contract :
										${contractName}
							</g:if> <g:elseif test="${activeContract?.type == 'REPAIR'}">
										Repair
								</g:elseif> <g:elseif test="${activeContract?.type == 'MODERNIZATION'}">
										Modernization
								</g:elseif> <g:elseif test="${activeContract?.type == 'INSTALLATION'}">
										Installation
								</g:elseif>
						</span>
						<g:if test="${activeContract?.type == 'SERVICE'}">
								(Active From
								<g:formatDate date="${activeContract?.contractFromDate}"
								format="dd.MM.yyyy" />
								To
								<g:formatDate date="${activeContract?.contractToDate}"
								format="dd.MM.yyyy" />)
						</g:if>
					</g:if>
				</h4>
			</div>

			<div class="well">
				<g:form>
					<g:hiddenField name="id" value="${organizationInstance?.id}" />
						<!-- TODO : HRISHI Disabled temporarily -->
						<%--
							<g:link class="btn btn-default btn-sm" action="edit" id="${organizationInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
						--%>
						<a
							href="<g:createLink controller="quote" action="create" params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]"/>"
							role="button" class="btn btn-primary btn-sm">  New
							Contract Quote
						</a> <a
							href="<g:createLink controller="quote" action="create" params="[type:'REPAIR',organizationId:organizationInstance?.id]" />"
							role="button" class="btn btn-primary btn-sm">  New
							Repair Quote
						</a>
						<g:link controller="task" action="create" role="button"
							class="btn btn-sm btn-primary"
							params="[relatedTo:'ORGANIZATION',relatedToValue:organizationInstance?.externalId,taskName:'']">
							 	Create Task
						</g:link>
						
						<button class="btn btn-sm btn-default" type="submit" name="_action_delete">
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
				</g:form>
			</div>

			<div class="row">
				<div class="col-md-4">
					<dl class="dl-horizontal">
						<dt>
							<g:message code="organization.externalId.label"
								default="External Id" />
						</dt>

						<dd>
							<g:fieldValue bean="${organizationInstance}" field="externalId" />
						</dd>


						<dt>
							<g:message code="organization.assignedTo.label"
								default="Assigned To" />
						</dt>

						<dd>
							<g:fieldValue bean="${organizationInstance}" field="assignedTo" />
						</dd>

						<dt>
							<g:message code="organization.salesStatus.label"
								default="Sales Status" />
						</dt>

						<dd>
							<g:fieldValue bean="${organizationInstance}" field="salesStatus" />
						</dd>

						<dt>
							<g:message code="organization.reasonForChange.label"
								default="Reason for Change" />
						</dt>

						<dd>
							<g:fieldValue bean="${organizationInstance}" field="description" />
						</dd>

						<dt>
							<g:message code="organization.totalInvoicedAmount.label"
								default="Total Invoiced Amount" />
						</dt>

						<dd>
							<b> ${params.totalInvoicedAmount}
							</b>
						</dd>

						<dt>
							<g:message code="organization.totalReceivedAmount.label"
								default="Total Received Amount" />
						</dt>

						<dd>
							<b> ${params.totalReceivedAmount}
							</b>
						</dd>

					</dl>
				</div>

				<!-- Order Instance -->
				<g:if test="${activeContract}">
					<div class="col-md-4">
						<dl class="dl-horizontal">
							<dt>
								<g:message code="order.totalAmount.label" default="Total Amount" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}" field="totalAmount" />
							</dd>


							<dt>
								<g:message code="order.totalTax.label" default="Total Tax" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}" field="totalTax" />
							</dd>

							<dt>
								<g:message code="order.totalDiscount.label"
									default="Total Discount" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}" field="totalDiscount" />
							</dd>

							<dt>
								<g:message code="order.adjustment.label" default="Adjustment" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}" field="adjustment" />
							</dd>


							<dt>
								<g:message code="order.grandTotal.label" default="Grand Total" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}" field="grandTotal" />
							</dd>

							<!-- Invoiced -->
							<dt>
								<g:message code="order.invoicedGrandTotal.label"
									default="Invoiced Amount" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}"
									field="invoicedGrandTotal" />
							</dd>

							<dt>
								<g:message code="order.pendingInvoiceGrandTotal.label"
									default="Pending Invoice Amount" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}"
									field="pendingInvoiceGrandTotal" />
							</dd>
						</dl>
					</div>
				</g:if>
				<g:else>
					<div class="col-md-4">
						<dl class="dl-horizontal">
							<dt>No Ongoing Contract</dt>
						</dl>
					</div>

				</g:else>

				<div class="col-md-4">
					<dl class="dl-horizontal">
						<g:if
							test="${activeContract?.renewalStage == 'RENEWAL_LETTER_SENT'}">
							<dt>
								<g:message code="order.renewalStage.label"
									default="Renewal Stage" />
							</dt>

							<dd>Renewal Letter Sent</dd>

							<dt>
								<g:message code="order.recepientContactName.label"
									default="Recipient Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}"
									field="recepientContactName" />
							</dd>

							<dt>
								<g:message code="order.recepientContactNumber.label"
									default="Recipient Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}"
									field="recepientContactNumber" />
							</dd>

							<dt>
								<g:message code="order.receivedDateTime.label"
									default="Recipient Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}" field="receivedDateTime" />
							</dd>

							<dt>
								<g:message code="order.handedOveryBy.label"
									default="Recipient Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}" field="handedOveryBy" />
							</dd>
						</g:if>
						<g:elseif test="${activeContract?.renewalStage == 'RENEWAL_LOST'}">
							<dt>
								<g:message code="order.renewalStage.label"
									default="Renewal Stage" />
							</dt>

							<dd>Renewal Lost</dd>

							<dt>
								<g:message code="order.renewalLostReason.label"
									default="Recipient Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${activeContract}" field="renewalLostReason" />
							</dd>
						</g:elseif>
						<g:elseif test="${activeContract?.renewalStage == 'RENEWAL_WON'}">
							<dt>
								<g:message code="order.renewalStage.label"
									default="Renewal Stage" />
							</dt>

							<dd>Renewal Won</dd>
						</g:elseif>
					</dl>
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
