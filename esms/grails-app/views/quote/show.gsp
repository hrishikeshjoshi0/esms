

<%@ page import="com.esms.model.quote.Quote"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'quote.label', default: 'Quote')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					Quote :
					${quoteInstance?.quoteName}
				</h1>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${quoteInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${quoteInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
					<g:if test="${quoteInstance?.status == 'PENDING'}">
						<g:link class="btn" action="markAsSent" id="${quoteInstance?.id}">
							<i class="icon-envelope"></i>
							Mark as Sent
						</g:link>
					</g:if>
					<g:elseif test="${quoteInstance?.status == 'SENT'}">
						<g:link class="btn" action="markAsAccepted" id="${quoteInstance?.id}">
							<i class="icon-envelope"></i>
							Mark as Accepted
						</g:link>
						<g:link class="btn" action="markAsRevised" id="${quoteInstance?.id}">
							<i class="icon-pencil"></i>
							Revise
						</g:link>
						<g:link class="btn" action="markAsDeclined" id="${quoteInstance?.id}">
							<i class="icon-trash"></i>
							Mark as Declined
						</g:link>
					</g:elseif>
					<g:elseif test="${quoteInstance?.status == 'ACCEPT'}">
						<g:link class="btn" action="convertToSalesOrder" id="${quoteInstance?.id}">
							<i class="icon-share-alt"></i>
							Create Order from Quote
						</g:link>
					</g:elseif>
				</div>
			</g:form>

			<div class="row">
				<div class="span12">
					<h3 style="margin-left: 20px;">
						<g:message code="quote.quoteName.label" default="Quote Name" /> : 
						<g:fieldValue bean="${quoteInstance}" field="quoteName" />
					</h3>
					<h3 style="margin-left: 20px;">
						<small>
							<g:message code="quote.organization.label" default="Organization" /> :
							<g:link controller="organization" action="show"
									id="${quoteInstance?.organization?.id}">
									${quoteInstance?.organization?.name}
							</g:link>
						</small>
					</h3>
				</div>
			</div>
			<div class="row">
				<div class="span4">
					<dl class="dl-horizontal" style="margin-left: -30px;">
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
							<g:message code="quote.issueDate.label" default="Issue Date" />
						</dt>
						<dd>
							<g:formatDate date="${quoteInstance?.issueDate}" />
						</dd>
						<dt>
							<g:message code="quote.expiryDate.label" default="Expiry Date" />
						</dt>
						<dd>
							<g:formatDate date="${quoteInstance?.expiryDate}" />
						</dd>
						<dt>
							<g:message code="quote.contactName.label" default="Contact Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${quoteInstance}" field="contactName" />
						</dd>
					</dl>
				</div>
				<div class="span4">
					<dl class="dl-horizontal" style="margin-left: -30px;">
						<dt>
							<g:message code="quote.totalAmount.label" default="Total Amount" />
						</dt>
						<dd>
							<g:fieldValue bean="${quoteInstance}" field="totalAmount" />
						</dd>
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
							<g:render template="quoteItemList" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
