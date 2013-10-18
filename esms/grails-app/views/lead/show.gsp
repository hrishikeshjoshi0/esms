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

	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					LEAD #
					${organizationInstance?.externalId}
					|
					${organizationInstance?.name} 
				</h1>
			</div>
			
			<g:form>
				<g:hiddenField name="id" value="${organizationInstance?.id}" />
				<div class="form-actions">
					<!-- TODO : HRISHI disabled temporarily -->
					<g:link class="btn" action="edit" id="${organizationInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
					<a data-toggle="modal" href="#" data-target="#contactModal" role="button" class="btn"> 
						<i class="icon-plus"></i> New Contact
					</a>
					<a data-toggle="modal" href="#" data-target="#addressModal" role="button" class="btn"> 
						<i class="icon-plus"></i> New Address
					</a>
					<a data-toggle="modal" href="#" data-target="#phoneBookModal"
						role="button" class="btn"> <i class="icon-plus"></i> New Phone Book
					</a>
					<g:if test="${organizationInstance.salesStatus == 'LEAD'}">
						<g:link controller="organization" action="convertLeadToCustomer"  id="${organizationInstance?.id}" role="button" class="btn">
						 	<i class="icon-share-alt"></i> Convert Lead
						</g:link>
					</g:if>
				</div>
			</g:form>

			<dl class="dl-horizontal" style="margin-left: -30px;">
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

			</dl>
		</div>

		<div class="span12">
			
			<!--  -->
			<ul class="nav nav-tabs" id="organization_show_tab">
			  <li class="active"><a href="#contactsTabPane" data-toggle="tab">Contact</a></li>
			  <li><a href="#liftInfoTabPane" data-toggle="tab">About the Lift</a></li>
			  <li><a href="#addressesTabsPane" data-toggle="tab">Addresses</a></li>
			  <%--<li><a href="#phonesTabsPane" data-toggle="tab">Phones</a></li>
			  --%>
			  <li><a href="#quotesTabsPane" data-toggle="tab">Quotes</a></li>
			  <li><a href="#eventsTabsPane" data-toggle="tab">Events</a></li>
			</ul>
			 
			<div class="tab-content">
			  <div class="tab-pane active" id="contactsTabPane">
			  	<g:render template="contactList" />
			  </div>
			  <div class="tab-pane" id="liftInfoTabPane">
			  	<g:render template="liftInfo" />
			  </div>
			  <div class="tab-pane" id="addressesTabsPane">
			  	<g:render template="addressList" />
			  </div>
			  <%--<div class="tab-pane" id="phonesTabsPane">
			  	<g:render template="phoneBookList" />
			  </div>
			  --%>
			  <div class="tab-pane" id="quotesTabsPane">
			  	<g:render template="quoteList" />
			  </div>
			  <div class="tab-pane" id="eventsTabsPane">
			  	<g:render template="eventList" />
			  </div>
			</div>
			<!--  -->
			
			<%--<div class="accordion" id="detailViewAccordion" style="margin-left: -30px;">
				<!-- Contacts -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseContact"> <span class="left"> <i
								class="icon-user"></i> Contacts
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseContact" class="accordion-body collapse in">
						<div class="accordion-inner">
							<g:render template="contactList" />
						</div>
					</div>
				</div>

				<!-- Addresses -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseAddress"> <span class="left"> <i
								class="icon-book"></i> Addresses
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseAddress" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:render template="addressList" />
						</div>
					</div>
				</div>

				<!-- Phones -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapsePhoneBook"> <span class="left"> <i
								class="icon-headphones"></i> Phones
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapsePhoneBook" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:render template="phoneBookList" />
						</div>
					</div>
				</div>
				
				<!-- Quote -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseQuote"> <span class="left"> <i
								class="icon-envelope"></i> Quotes
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseQuote" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:render template="quoteList" />
						</div>
					</div>
				</div>
				
				<!-- Service Order -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseServiceOrder"> <span class="left"> <i
								class="icon-briefcase"></i> Service Orders
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseServiceOrder" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:render template="serviceorderList" />
						</div>
					</div>
				</div>
				
				<!-- Repair Order -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseRepairOrder"> <span class="left"> <i
								class="icon-wrench"></i> Repair Orders
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseRepairOrder" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:render template="repairorderList" />
						</div>
					</div>
				</div>
				
				
				<!-- Events -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseEvents"> <span class="left"> <i
								class="icon-time"></i> Events
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseEvents" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:render template="eventList" />
						</div>
					</div>
				</div>
				
			</div>
		--%></div>
	</div>
</body>
</html>
