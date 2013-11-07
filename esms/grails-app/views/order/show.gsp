<%@ page import="com.esms.model.order.Order"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'order.label', default: 'Order')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:if test="${orderInstance?.type == 'SERVICE'}">
						SERVICE CONTRACT #
					</g:if>
					<g:else>
						ORDER #
					</g:else>
					${orderInstance?.orderNumber}
					|
					<g:link controller="organization" action="show"
						id="${orderInstance?.organization?.id}">
						${orderInstance?.organization?.name}
					</g:link>
					<g:if test="${orderInstance?.type == 'SERVICE'}">
						|
						CONTRACT PERIOD :
						<g:formatDate date="${orderInstance?.contractFromDate}" format="dd.MM.yyyy"/>
						-
						<g:formatDate date="${orderInstance?.contractToDate}" format="dd.MM.yyyy"/>
					</g:if>
					<g:if test="${orderInstance?.type == 'SERVICE'}">
						|
						CONTRACT :
						${contractName}
					</g:if>
					<g:elseif test="${orderInstance?.type == 'REPAIR'}">
						|
						REPAIR
					</g:elseif>
					
					
					<g:if test="${orderInstance?.type == 'SERVICE' && orderInstance?.taggedForRenewal == true}">
						<g:if
							test="${orderInstance?.renewalStage == 'RENEWAL_LETTER_SENT'}">
							<span class="badge badge-warning"> <i
								class="icon-tag icon-white"></i> Renewal Letter Sent
							</span>
						</g:if>
						<g:elseif test="${orderInstance?.renewalStage == 'RENEWAL_WON'}">
							<span class="badge badge-success"> <i
								class="icon-tag icon-white"></i> Renewal Won
							</span>
						</g:elseif>
						<g:elseif test="${orderInstance?.renewalStage == 'RENEWAL_LOST'}">
							<span class="badge badge-warning"> <i
								class="icon-tag icon-white"></i> Renewal Lost
							</span>
						</g:elseif>
						<g:else>
							<span class="badge badge-info"> <i
								class="icon-tag icon-white"></i> Tagged For Renewal
							</span>
						</g:else>
					</g:if>
				</h1>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${orderInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${orderInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>

					<g:if
						test="${orderInstance?.orderItems?.size() != 0}">
						<g:link class="btn" action="createInvoice"
							id="${orderInstance?.id}">
							<i class="icon-briefcase"></i>
							<g:message code="default.button.createInvoice.label"
								default="Create Invoice" />
						</g:link>
					</g:if>
					
					<g:render template="/order/btnCreateEvent" />

					<g:link controller="task" action="create" role="button" class="btn"
						params="[relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,taskName:'Reminder For Invoice']">
						<i class="icon-calendar"></i>
					 	Create Task
					</g:link>

					<g:if test="${orderInstance?.type == 'SERVICE'}">
						<g:if test="${!orderInstance?.taggedForRenewal}">
							<g:link class="btn btn-info" action="tagForRenewal"
								controller="order" id="${orderInstance.id}">
								<i class="icon-tag icon-white"></i>
								Tag For Renewal
							</g:link>
						</g:if>
					<g:elseif
						test="${orderInstance?.taggedForRenewal && (orderInstance.renewalStage == 'RENEWAL_LETTER_SENT' || orderInstance.renewalStage == 'TAGGED_FOR_RENEWAL')}">
						<!-- Single button -->
						<div class="btn-group">
							<g:link class="btn dropdown-toggle" data-toggle="dropdown">
								Renewal Actions <span class="caret"></span>
							</g:link>
							<ul class="dropdown-menu" role="menu">
								<li><g:if
										test="${orderInstance?.renewalStage == 'TAGGED_FOR_RENEWAL'}">
										<a data-toggle="modal" href="#" data-target="#markAsSent"
											role="button" class="link"> <i class="icon-envelope"></i>
											Renewal Letter Sent
										</a>
									</g:if></li>
								<li><g:if
										test="${orderInstance?.renewalStage == 'RENEWAL_LETTER_SENT'}">
										<li class="divider"></li>
										<g:link class="link link-info" action="renewalWon"
											controller="order" id="${orderInstance.id}">
											<i class="icon-ok-sign"></i>
										Renewal Won
									</g:link>
									</g:if></li>
								<li><g:if
										test="${orderInstance?.renewalStage == 'RENEWAL_LETTER_SENT'}">
										<li class="divider"></li>
										<g:link class="link link-info" action="renewalLost"
											controller="order" id="${orderInstance.id}">
											<i class="icon-remove-sign"></i>
										Renewal Lost
									</g:link>
									</g:if></li>
							</ul>
						</div>
					</g:elseif>
					</g:if>

					<%--<g:if test="${orderInstance?.status == 'INVOICED'}">
						<g:link class="btn" action="create" controller="payment"
							params="[orderId :orderInstance.id]">
							<i class="icon-briefcase"></i>
							<g:message code="default.button.registerPayment.label"
								default="Register Payment" />
						</g:link>
					</g:if>
				--%>
				</div>
			</g:form>

			<%--<g:if
				test="${orderInstance?.status == 'PENDING_INVOICE' && orderInstance?.orderItems?.size() != 0}">
				<div class="form-actions">
					<g:jasperReport jasper="GoldContractTemplate" format="PDF"
						name="Print Agreement" delimiterAfter=" " delimiterBefore=" "
						heightAttr="15px">
						<input type="hidden" name="order" value="${orderInstance.id}" />
					</g:jasperReport>
				</div>
			</g:if>
			--%>
			
			<div class="row-fluid">
				<div class="span4">
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
				<div class="span4">
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


						<dt>
							<g:message code="order.totalDiscount.label"
								default="Total Discount" />
						</dt>

						<dd>
							<g:fieldValue bean="${orderInstance}" field="totalDiscount" />
						</dd>
						
						<dt>
							<g:message code="order.adjustment.label"
								default="Adjustment" />
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
							<g:message code="order.invoicedGrandTotal.label" default="Invoiced Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${orderInstance}" field="invoicedGrandTotal" />
						</dd>
						
						<dt>
							<g:message code="order.pendingInvoiceGrandTotal.label" default="Pending Invoice Amount" />
						</dt>

						<dd>
							<g:fieldValue bean="${orderInstance}" field="pendingInvoiceGrandTotal" />
						</dd>
					</dl>
				</div>
				<div class="span4">
					<dl class="dl-horizontal">
						<g:if
							test="${orderInstance?.renewalStage == 'RENEWAL_LETTER_SENT'}">
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
								<g:fieldValue bean="${orderInstance}"
									field="recepientContactName" />
							</dd>

							<dt>
								<g:message code="order.recepientContactNumber.label"
									default="Recipient Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}"
									field="recepientContactNumber" />
							</dd>

							<dt>
								<g:message code="order.receivedDateTime.label"
									default="Recipient Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="receivedDateTime" />
							</dd>

							<dt>
								<g:message code="order.handedOveryBy.label"
									default="Recipient Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${orderInstance}" field="handedOveryBy" />
							</dd>
						</g:if>
						<g:elseif test="${orderInstance?.renewalStage == 'RENEWAL_LOST'}">
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
								<g:fieldValue bean="${orderInstance}" field="renewalLostReason" />
							</dd>
						</g:elseif>
						<g:elseif test="${orderInstance?.renewalStage == 'RENEWAL_WON'}">
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

	<div class="row-fluid">
		<div class="span12">
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Order Lines" />
					<richui:tabLabel title="Notes" />
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render template="orderItemList" />
					</richui:tabContent>
					
					<richui:tabContent>
						<g:fieldValue bean="${orderInstance}" field="notes" />
					</richui:tabContent>
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>

	<g:render template="saveRecepient"></g:render>
</body>
</html>