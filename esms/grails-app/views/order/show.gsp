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
					<g:if test="${orderInstance.status == 'PENDING_INVOICE' }">
						ORDER
					</g:if>
					<g:elseif test="${orderInstance.status == 'INVOICED' }">
						INVOICE
					</g:elseif>
					${orderInstance?.orderNumber}
				</h1>
				<h3 style="margin-left: 20px;">
					<small> <g:message code="quote.organization.label"
							default="Organization" /> : <g:link controller="organization"
							action="show" id="${orderInstance?.organization?.id}">
							${orderInstance?.organization?.name}
						</g:link>
					</small>
				</h3>
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
					<g:link class="btn" action="completeSale" id="${orderInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:if test="${orderInstance?.status == 'PENDING_INVOICE'}">
						<g:link class="btn" action="createInvoice"
							id="${orderInstance?.id}">
							<i class="icon-briefcase"></i>
							<g:message code="default.button.createInvoice.label"
								default="Create Invoice" />
						</g:link>
					</g:if>
					<g:link class="btn" action="create" controller="event" params="['party.id':orderInstance?.organization.id]">
						<i class="icon-calendar"></i>
						<g:message code="default.button.createEvent.label" default="Create Event" />
					</g:link>
				</div>
			</g:form>

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
					
					<dt>
						<g:message code="order.organization.label" default="Organization" />
					</dt>
				
					<dd>
						<g:link controller="organization" action="show"
							id="${orderInstance?.organization?.id}">
							${orderInstance?.organization?.name}
						</g:link>
					</dd>
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
					<g:message code="order.grandTotal.label" default="Grand Total" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderInstance}" field="grandTotal" />
				</dd>

				<dt>
					<g:message code="order.openGrandTotal.label" default="Open Amount" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderInstance}" field="openGrandTotal" />
				</dd>

				<dt>
					<g:message code="order.receviedGrandTotal.label"
						default="Received Amount" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderInstance}" field="receviedGrandTotal" />
				</dd>

				</dl>
			</div>
			</div>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			
			<!--  -->
			<ul class="nav nav-tabs" id="order_show_tab">
			  <li class="active"><a href="#orderItemsTabsPane" data-toggle="tab">Lines</a></li>
			  <li><a href="#inventoryTabsPane" data-toggle="tab">Inventory</a></li>
			</ul>
			 
			<div class="tab-content">
			  <div class="tab-pane active" id="orderItemsTabsPane">
			  	<g:render template="orderItemList" />
			  </div>
			  <div class="tab-pane" id="inventoryTabsPane">
			  	<g:render template="inventoryAssignmentsList" />
			  </div>
			</div> 
			
			<%--<div class="accordion" id="detailViewAccordion">
				<!-- Contacts -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseContact"> <span class="left"> <i
								class="icon-user"></i> Order Items
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseContact" class="accordion-body collapse in">
						<div class="accordion-inner">
							<g:render template="orderItemList" />
						</div>
					</div>
				</div>
			</div>
		--%></div>
	</div>
</body>
</html>
