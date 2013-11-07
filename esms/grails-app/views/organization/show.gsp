

<%@ page import="com.esms.model.party.Organization"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'organization.label', default: 'Organization')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div class="row-fluid" style="">
		<div class="span12">
			<div class="page-header">
				<h1>
					CUSTOMER #
					${organizationInstance?.externalId}
					|
					${organizationInstance?.name}
					<g:if test="${activeContract}">
						<g:if test="${activeContract?.type == 'SERVICE'}">
							|
							CONTRACT PERIOD :
							<g:formatDate date="${activeContract?.contractFromDate}" format="dd.MM.yyyy"/>
							-
							<g:formatDate date="${activeContract?.contractToDate}" format="dd.MM.yyyy"/>
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
				</h1>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${organizationInstance?.id}" />
				<div class="form-actions">

					<!-- TODO : HRISHI Disabled temporarily -->
					<%--<g:link class="btn" action="edit" id="${organizationInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					--%>

					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
					<g:if test="${organizationInstance.salesStatus == 'LEAD'}">
						<g:link controller="organization" action="convertLeadToCustomer"
							id="${organizationInstance?.id}" role="button" class="btn">
							<i class="icon-share-alt"></i> Convert Lead
						</g:link>
					</g:if>
					<g:link controller="task" action="create" role="button"
						class="btn btn-info"
						params="[relatedTo:'ORGANIZATION',relatedToValue:organizationInstance?.externalId,taskName:'']">
						<i class="icon-calendar icon-white"></i>
					 	Create Task
					</g:link>
				</div>
			</g:form>

			<div class="row-fluid">
				<div class="span4">
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
				<div class="span4">
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
							<g:message code="order.adjustment.label"
								default="Adjustment" />
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
							<g:message code="order.invoicedGrandTotal.label" default="Invoiced Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${activeContract}" field="invoicedGrandTotal" />
						</dd>
						
						<dt>
							<g:message code="order.pendingInvoiceGrandTotal.label" default="Pending Invoice Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${activeContract}" field="pendingInvoiceGrandTotal" />
						</dd>
					</dl>
				</div>
				
				<div class="span4">
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

		<div class="span12">
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
