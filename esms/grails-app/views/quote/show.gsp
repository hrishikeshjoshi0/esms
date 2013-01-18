

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
					<g:message code="default.show.label" args="[entityName]" />
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
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="quote.quoteName.label" default="Quote Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteInstance}" field="quoteName" />
				</dd>


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
					<g:message code="quote.salesChannel.label" default="Sales Channel" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteInstance}" field="salesChannel" />
				</dd>


				<dt>
					<g:message code="quote.description.label" default="Description" />
				</dt>

				<dd>
					<g:fieldValue bean="${quoteInstance}" field="description" />
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


				<dt>
					<g:message code="quote.organization.label" default="Organization" />
				</dt>

				<dd>
					<g:link controller="organization" action="show"
						id="${quoteInstance?.organization?.id}">
						${quoteInstance?.organization?.name}
					</g:link>
				</dd>


				<dt>
					<g:message code="quote.quoteItems.label" default="Quote Items" />
				</dt>
			</dl>
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
