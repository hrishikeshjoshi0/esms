

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

	<div class="row-fluid" style="margin-top: -15px;">
		<div class="span12">
			<div class="page-header">
				<h1>
					LEAD :
					${organizationInstance?.externalId}
					
					<h3>
					<small> ${organizationInstance?.name} </small>
					</h3>					
				</h1>
			</div>
			
			<g:form>
				<g:hiddenField name="id" value="${organizationInstance?.id}" />
				<div class="form-actions">
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
			  <li class="active" data-toggle="tab"><a href="#contactsTabPane" data-toggle="tab">Contact</a></li>
			  <li><a href="#liftInfoTabPane" data-toggle="tab">About the Lift</a></li>
			  <li><a href="#addressesTabsPane" data-toggle="tab">Addresses</a></li>
			  <li><a href="#phonesTabsPane" data-toggle="tab">Phones</a></li>
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
			  <div class="tab-pane" id="phonesTabsPane">
			  	<g:render template="phoneBookList" />
			  </div>
			  <div class="tab-pane" id="quotesTabsPane">
			  	<g:render template="quoteList" />
			  </div>
			  <div class="tab-pane" id="eventsTabsPane">
			  	<g:render template="eventList" />
			  </div>
			</div>
			<!--  -->
			
			</div>
	</div>
</body>
</html>
