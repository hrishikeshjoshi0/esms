<%@ page import="com.esms.model.quote.Quote"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'quote.label', default: 'Quote')}" />
<title>
		Quote::${quoteInstance?.quoteNumber}:${quoteInstance?.organization?.name}
	</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Quote:${quoteInstance?.quoteName}
					${quoteInstance?.quoteNumber} :
					
					<g:link controller="organization" action="show"
						id="${quoteInstance?.organization?.id}">
						${quoteInstance?.organization?.name}
					</g:link>
				</h3>
			</div>
			
			<g:if test="${!quoteInstance?.areLinesAdded()}">
				<div>
					<bootstrap:alert class="${'alert-warning'}">
						Warning! This quotation looks empty, please add lines to it to start the sales process. 
					</bootstrap:alert>	
				</div>
			</g:if>

			<div class="well">
				<g:if
					test="${quoteInstance?.sent == false && quoteInstance?.quoteItems?.size() != 0}">
					<bs3:modalLink
						href="${createLink(controller:'quote',action:'markAsSent',id:quoteInstance?.id)}"
						class="btn-primary" id="markAsSent" title="Mark As Sent" />
				</g:if>

				<!-- State:Pending -->
				<g:if
					test="${quoteInstance?.status == 'PENDING' && quoteInstance?.quoteItems?.size() != 0}">
					<g:if
						test="${quoteInstance?.type == 'CONTRACT' && quoteInstance?.quoteItems?.size() != 0}">
						<bs3:modalLink
							href="${createLink(controller:'quote',action:'markAsAccepted',id:quoteInstance?.id)}"
							class="btn-primary" id="markAsAccepted" title="Mark As Accepted" />
					</g:if>
					<g:elseif test="${quoteInstance?.quoteItems?.size() != 0}">
						<g:link action="markAsAccepted" controller="quote"
							id="${quoteInstance?.id}" class="btn btn-default btn-sm">
								Mark as Accepted
							</g:link>
					</g:elseif>
					<%--
					HJ: Disabling this feature for Pilot Release.
					<bs3:modalLink
						href="${createLink(controller:'quote',action:'markAsRevised',id:quoteInstance?.id)}"
						class="btn-primary" id="markAsRevised" title="Mark As Revised" />
					--%>
				</g:if>
				<g:elseif
					test="${quoteInstance?.status == 'ACCEPT' 
						&& (quoteInstance.type == 'CONTRACT' || quoteInstance.type == 'MODERNIZATION' || quoteInstance.type == 'INSTALLATION' || quoteInstance.type == 'REPAIR') 
						&& quoteInstance?.quoteItems?.size() != 0}">
					<!-- State:Accept -->
					<bs3:modalLink
						href="${createLink(controller:'quote',action:'confirmSale',id:quoteInstance?.id)}"
						class="btn-primary" id="confirmSale" title="Confirm Sale" />
				</g:elseif>
				<g:elseif
					test="${quoteInstance?.status == 'ACCEPT' && quoteInstance.type == 'REPAIR' && quoteInstance?.quoteItems?.size() != 0}">
					<bs3:modalLink
						href="${createLink(controller:'quote',action:'confirmSale',id:quoteInstance?.id)}"
						class="btn-primary" id="confirmSale" title="Confirm Sale" />
				</g:elseif>
				
				<g:if
					test="${quoteInstance?.status != 'DISQUALIFIED'}">
					<bs3:modalLink
							href="${createLink(controller:'quote',action:'markAsDisqualified',id:quoteInstance?.id)}"
							id="markAsDisqualified" title="Mark as Disqualified" />
				</g:if>	
				
				<g:if
					test="${quoteInstance?.status != 'DECLINE' && quoteInstance?.status != 'PENDING' && quoteInstance?.status != 'DISQUALIFIED'}">
					<bs3:modalLink
							href="${createLink(controller:'quote',action:'markAsDeclined',id:quoteInstance?.id)}"
							id="markAsDeclined" title="Mark As Declined" />
				</g:if>
				
				<g:link class="btn btn-default btn-sm" action="edit" controller="quote"
					id="${quoteInstance?.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
					
				<g:link class="btn btn-default btn-sm deleteBtn" action="delete" controller="quote"
					id="${quoteInstance?.id}">
					<g:message code="default.button.delete.label" default="Delete" />
				</g:link>	
			</div>


			<div class="panel panel-default">
				<div class="panel-body">
					<div class="col-md-5">
						<dl class="dl-horizontal">
							<dt>
								<g:message code="quote.sent.label" default="Sent" />
							</dt>
							<dd>
								<g:formatBoolean boolean="${quoteInstance?.sent}" true="Yes"
									false="No" />
							</dd>

							<g:if test="${quoteInstance?.sent}">
								<dt>
									<g:message code="quote.recepientContactName.label"
										default="Recepient Name" />
								</dt>
								<dd>
									${quoteInstance?.recepientContactName}
								</dd>

								<dt>
									<g:message code="quote.recepientContactNumber.label"
										default="Recepient Number" />
								</dt>
								<dd>
									${quoteInstance?.recepientContactNumber}
								</dd>

								<dt>
									<g:message code="quote.receivedDateTime.label"
										default="Received Date" />
								</dt>
								<dd>
									${quoteInstance?.receivedDateTime}
								</dd>

								<dt>
									<g:message code="quote.handedOveryBy.label"
										default="Handed Over By" />
								</dt>
								<dd>
									${quoteInstance?.handedOveryBy}
								</dd>
							</g:if>
							
							<g:if
								test="${quoteInstance?.status == 'ACCEPT' 
									&& (quoteInstance.type == 'CONTRACT') 
									&& quoteInstance?.quoteItems?.size() != 0}">
								<dt>
									<g:message code="quote.contractFromDate.label"
										default="Contract From Date" />
								</dt>
								<dd>
									<g:formatDate date="${quoteInstance?.contractFromDate}"/>
								</dd>
								
								<dt>
									<g:message code="quote.contractToDate.label"
										default="Contract To Date" />
								</dt>
								<dd>
									<g:formatDate date="${quoteInstance?.contractToDate}"/>
								</dd>	
							</g:if>		

							<dt>
								<g:message code="quote.status.label" default="Status" />
							</dt>
							<dd>
								<g:fieldValue bean="${quoteInstance}" field="status" />
							</dd>
							<dt>
								<g:message code="quote.type.label" default="Type" />
							</dt>
							<dd>
								<g:fieldValue bean="${quoteInstance}" field="type" />
							</dd>
							<dt>
								<g:message code="quote.salesChannel.label"
									default="Sales Channel" />
							</dt>
							<dd>
								<g:fieldValue bean="${quoteInstance}" field="salesChannel" />
							</dd>
							<dt>
								<g:message code="quote.contactName.label" default="Contact Name" />
							</dt>

							<dd>
								<g:fieldValue bean="${quoteInstance}" field="contactName" />
							</dd>
							
							<dt>
								<g:message code="quote.assignedTo.label" default="Assigned To" />
							</dt>
							<dd>
								<g:fieldValue bean="${quoteInstance}" field="assignedTo" />
							</dd>

							<dt>
								<g:message code="quote.relatedTo.label" default="Related To" />
							</dt>

							<dd>
								<g:fieldValue bean="${quoteInstance}" field="relatedTo" />
							</dd>

							<dt>
								<g:message code="quote.relatedToValue.label"
									default="Related To Value" />
							</dt>

							<dd>
								<g:fieldValue bean="${quoteInstance}" field="relatedToValue" />
							</dd>

							<g:if test="${quoteInstance?.status == 'DECLINED'}">
								<dt>
									<g:message code="quote.declinedReason.label"
										default="Reason For Decline" />
								</dt>

								<dd>
									<g:fieldValue bean="${quoteInstance}" field="declinedReason" />
								</dd>
							</g:if>
						</dl>
					</div>
					<div class="col-md-5">
						<dl class="dl-horizontal">
							<dt>
								<g:message code="quote.quotedGrandTotal.label"
									default="Quoted Amount" />
							</dt>
							<dd>
								<g:fieldValue bean="${quoteInstance}" field="quotedGrandTotal" />
							</dd>

							<dt>
								<g:message code="quote.negotiatedGrandTotal.label"
									default="Negotiated Amount" />
							</dt>
							<dd>
								<g:fieldValue bean="${quoteInstance}"
									field="negotiatedGrandTotal" />
							</dd>

							<%--<dt>
							<g:message code="quote.totalAmount.label" default="Total Amount" />
						</dt>
						<dd>
							<g:fieldValue bean="${quoteInstance}" field="totalAmount" />
						</dd>
						--%>

							<dt>
								<g:message code="quote.totalTax.label" default="Total Tax" />
							</dt>
							<dd>
								<g:fieldValue bean="${quoteInstance}" field="totalTax" />
							</dd>
							<dt>
								<g:message code="quote.totalDiscount.label"
									default="Total Discount" />
							</dt>
							<dd>
								<g:fieldValue bean="${quoteInstance}" field="totalDiscount" />
							</dd>
							<dt>
								<g:message code="quote.grandTotal.label" default="Grand Total" />
							</dt>
							<dd>
								<g:fieldValue bean="${quoteInstance}" field="grandTotal" />
							</dd>

							<dt>
								<g:message code="quote.adjustment.label" default="Adjustment" />
							</dt>

							<dd>
								<g:fieldValue bean="${quoteInstance}" field="adjustment" />
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
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render template="quoteItemList" />
					</richui:tabContent>
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>
 </body>
</html>
