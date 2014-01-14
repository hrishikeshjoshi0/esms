<%@ page import="com.esms.model.order.Order"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'order.label', default: 'Order')}" />
	<title>
		Order::${orderInstance?.orderNumber}:${orderInstance?.organization?.name}
	</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:if test="${orderInstance?.type == 'SERVICE'}">
						Service Contract
					</g:if>
					<g:else>
						Order
					</g:else>
					${orderInstance?.orderNumber}
					:
					<g:link controller="organization" action="show"
						id="${orderInstance?.organization?.id}">
						${orderInstance?.organization?.name}
					</g:link>
				</h3>
				<h4>
					<g:if test="${orderInstance}">
						<span class=" "> 
						<g:if
								test="${orderInstance?.type == 'SERVICE'}">
										Current Active Contract :
										${contractName}
							</g:if> <g:elseif test="${orderInstance?.type == 'REPAIR'}">
										Repair
								</g:elseif> <g:elseif test="${orderInstance?.type == 'MODERNIZATION'}">
										Modernization
								</g:elseif> <g:elseif test="${orderInstance?.type == 'INSTALLATION'}">
										Installation
								</g:elseif>
						</span>
						<g:if test="${orderInstance?.type == 'SERVICE'}">
								(From
								<g:formatDate date="${orderInstance?.contractFromDate}"
								format="dd.MM.yyyy" />
								To
								<g:formatDate date="${orderInstance?.contractToDate}"
								format="dd.MM.yyyy" />)
						</g:if>
					</g:if>
				</h4>
			</div>

			<div class="well">
				<g:form>
					<g:hiddenField name="id" value="${orderInstance?.id}" />
					<g:if
						test="${orderInstance?.orderItems?.size() != 0
									&& orderInstance?.pendingInvoiceGrandTotal != null
									&& orderInstance?.pendingInvoiceGrandTotal > 0.0}">
						<g:link class="btn btn-primary btn-sm" action="createInvoice"
							id="${orderInstance?.id}">
							<g:message code="default.button.createInvoice.label"
								default="Create Invoice" />
						</g:link>
					</g:if>

					<!-- Btn Group Create Event -->
					<g:render template="/_common/buttons/createEventButtonGroup" model="[order:orderInstance]"></g:render>

					<g:link controller="task" action="create" role="button"
						class="btn btn-default btn-sm"
						params="[relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,taskName:'Reminder For Invoice']">
						 	Create Task
					</g:link>

					<g:if test="${orderInstance?.type == 'SERVICE'}">
						<g:if test="${!orderInstance?.taggedForRenewal}">
							<g:link class="btn btn-primary btn-sm" action="tagForRenewal"
								controller="order" id="${orderInstance.id}">
									Start Renewal Process
								</g:link>
						</g:if>
						<g:elseif
							test="${orderInstance?.taggedForRenewal && (orderInstance.renewalStage == 'RENEWAL_LETTER_SENT' 
								|| orderInstance.renewalStage == 'TAGGED_FOR_RENEWAL')
								& (!renewalQuote || renewalQuote?.status != 'CONVERTED_TO_SERVICE_CONTRACT')}">
							
							<!-- Single button -->
							<div class="btn-group">
							  <button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
							    Renewal Actions <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" role="menu">
							    	<g:if test="${!renewalQuote && orderInstance?.renewalStage == 'TAGGED_FOR_RENEWAL'}">
							    		<li>
											<g:link action="create" controller="quote"
												params="[contractQuote:true,type:'CONTRACT',organizationId:orderInstance?.organization?.id,
												quoteName : 'Renewal Quote For Order Number:' + orderInstance?.orderNumber,
												relatedTo:'RENEWAL',relatedToValue:orderInstance?.orderNumber]">
												Create Renewal Quote
											</g:link>	
										</li>
									</g:if>
									<g:if test="${renewalQuote  && 
											(renewalQuote?.status == 'PENDING' || renewalQuote?.status == 'ACCEPT')}">
										<li>		
											<g:link action="show"
													controller="quote" id="${renewalQuote.id}">
												<g:if test="${renewalQuote?.status == 'PENDING' && !renewalQuote.sent}">
													Renewal Quote:${renewalQuote?.quoteNumber} Is Not Sent. 
												</g:if>
												<g:elseif test="${renewalQuote?.status == 'PENDING' && renewalQuote.sent}">
													Renewal Quote:${renewalQuote?.quoteNumber} Is Sent. 
												</g:elseif>
												<g:elseif test="${renewalQuote?.status == 'ACCEPT'}">
													Renewal Quote:${renewalQuote?.quoteNumber} Is Accepted.
												</g:elseif>
											</g:link>
										</li>	
									</g:if>
							  </ul>
							</div>
						</g:elseif>
						<g:link class="btn btn-default btn-sm" action="edit"
							id="${orderInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>

						<%--<button class="btn btn-sm btn-default" type="submit"
							name="_action_delete">
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
						--%>
					</g:if>
				</g:form>
			</div>

			<div class="panel panel-default">
				<div class="panel-body">
					<div class="col-md-4">
						<dl class="dl-horizontal">

							<dt>
								<g:message code="order.orderNumber.label" default="Order Number" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="orderNumber" />
							</dd>


							<dt>
								<g:message code="order.status.label" default="Status" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="status" />
							</dd>


							<dt>
								<g:message code="order.type.label" default="Type" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="type" />
							</dd>
							
							<dd>
								<g:fieldValue bean="${orderInstance}" field="contactName" />
							</dd>
							
							<dt>
								<g:message code="order.assignedTo.label" default="Assigned To" />
							</dt>
							<dd>
								<g:fieldValue bean="${orderInstance}" field="assignedTo" />
							</dd>

							<dt>
								<g:message code="order.relatedTo.label" default="Related To" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="relatedTo" />
							</dd>

							<dt>
								<g:message code="order.relatedToValue.label"
									default="Related To Value" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="relatedToValue" />
							</dd>


							<dt>
								<g:message code="order.description.label" default="Description" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="description" />
							</dd>


							<dt>
								<g:message code="order.issueDate.label" default="Issue Date" />
							</dt>

							<dd>
								<g:formatDate date="${orderInstance?.issueDate}" />
							</dd>


							<dt>
								<g:message code="order.expiryDate.label" default="Expiry Date" />
							</dt>

							<dd>
								<g:formatDate date="${orderInstance?.expiryDate}" />
							</dd>


							<dt>
								<g:message code="order.contactName.label" default="Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="contactName" />
							</dd>

							<g:if test="${orderInstance.type == 'SERVICE' }">
								<dt>
									<g:message code="order.contractFromDate.label"
										default="Contract Starts" />
								</dt>

								<dd>
									<g:formatDate date="${orderInstance.contractFromDate}"
										format="dd-MM-yyyy" />
								</dd>

								<dt>
									<g:message code="order.contractToDate.label"
										default="Contract Ends" />
								</dt>

								<dd>
									<g:formatDate date="${orderInstance.contractToDate}"
										format="dd-MM-yyyy" />
								</dd>
							</g:if>
						</dl>
					</div>
					<div class="col-md-4">
						<dl class="dl-horizontal">
							<dt>
								<g:message code="order.totalAmount.label" default="Total Amount" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="totalAmount" />
							</dd>


							<dt>
								<g:message code="order.totalTax.label" default="Total Tax" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="totalTax" />
							</dd>


							<%--<dt>
								<g:message code="order.totalDiscount.label"
									default="Total Discount" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="totalDiscount" />
							</dd>
							--%>
							
							<dt>
								<g:message code="order.adjustment.label" default="Adjustment" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="adjustment" />
							</dd>


							<dt>
								<g:message code="order.grandTotal.label" default="Grand Total" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="grandTotal" />
							</dd>

							<!-- Invoiced -->
							<dt>
								<g:message code="order.invoicedGrandTotal.label"
									default="Invoiced Amount" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="invoicedGrandTotal" />
							</dd>

							<dt>
								<g:message code="order.pendingInvoiceGrandTotal.label"
									default="Pending Invoice Amount" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}"
									field="pendingInvoiceGrandTotal" />
							</dd>
							<!--  -->
						</dl>
					</div>
					<div class="col-md-4">
						<dl class="dl-horizontal">
							<g:if test="${orderInstance?.taggedForRenewal && orderInstance?.renewalStage}">
								<dt>Renewal Stage</dt>

								<dd>
									${orderInstance?.renewalStage}
								</dd>
							</g:if>
							<g:if
								test="${renewalQuote && renewalQuote?.status != 'CONVERTED_TO_SERVICE_CONTRACT'}">
								<dt>Renewal Quote</dt>

								<dd>
									<g:link controller="quote" action="show"
										id="${renewalQuote?.id}">
										${renewalQuote?.quoteNumber}
									</g:link>
								</dd>
								
								<g:if test="${renewalQuote && renewalQuote?.status == 'ACCEPT'}">
									<dt>Quoted Price</dt>
	
									<dd>
										${renewalQuote?.grandTotal}
									</dd>
								</g:if>
							</g:if>
							<g:elseif
								test="${renewalQuote && (renewalQuote?.status == 'DECLINE' || renewalQuote && renewalQuote?.status == 'DISQUALIFIED')}">
								<dt>
									<g:message code="order.renewalStage.label"
										default="Renewal Stage" />
								</dt>

								<dd>Renewal Lost</dd>
							</g:elseif>
							<g:elseif
								test="${orderInstance?.renewalStage == 'RENEWAL_WON'}">
								<dt>Renewed Order</dt>

								<dd>
									${Order.findByReferenceQuoteNumber(renewalQuote?.quoteNumber)?.orderNumber}
								</dd>
							</g:elseif>
						</dl>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12">
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Order Lines" />
					<richui:tabLabel title="Invoices" />
					<richui:tabLabel title="Events" />
					<richui:tabLabel title="Notes" />
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render template="orderItemList" />
					</richui:tabContent>
					
					<richui:tabContent>
						<g:render template="invoiceList" />
					</richui:tabContent>
					
					<richui:tabContent>
						<g:render template="eventList" />
					</richui:tabContent>
					
					<richui:tabContent>
						<div class="pull-right">
							<bs3:modalLink
								href="${createLink(controller:'order',action:'editNotes',id:orderInstance?.id)}"
								id="editNotes" title="Edit" />
						</div>
						<g:fieldValue bean="${orderInstance}" field="notes" />
					</richui:tabContent>
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>
</body>
</html>