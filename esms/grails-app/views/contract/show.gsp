

<%@ page import="com.esms.model.sales.Contract"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'contract.label', default: 'Contract')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:message code="default.show.label" args="[entityName]" />
				</h3>
			</div>

			<g:form>
				<g:hiddenField name="id" value="${contractInstance?.id}" />
				<div class="form-group">
					<g:link class="btn btn-default btn-xs" action="edit" id="${contractInstance?.id}">
						
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-sm btn-danger" type="submit" name="_action_delete">
						
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
					<g:link class="btn btn-default btn-xs" controller="order" action="create"
						params="[type:'SALES',relatedTo:'CONTRACT',relatedToValue:contractInstance.contractNumber,'organization.id':contractInstance.organization.id]">
						
						Create Sales Order
					</g:link>
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="contract.contractNumber.label"
						default="Contract Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${contractInstance}" field="contractNumber" />
				</dd>


				<dt>
					<g:message code="contract.organization.id.label"
						default="Customer Number" />
				</dt>

				<dd>
					<g:link controller="organization" action="show"
						id="${contractInstance?.organization?.id}">
						${contractInstance?.organization?.name}
					</g:link>
				</dd>


				<dt>
					<g:message code="contract.status.label" default="Status" />
				</dt>

				<dd>
					<g:fieldValue bean="${contractInstance}" field="status" />
				</dd>


				<dt>
					<g:message code="contract.fromDate.label" default="From Date" />
				</dt>

				<dd>
					<g:formatDate date="${contractInstance?.fromDate}" />
				</dd>


				<dt>
					<g:message code="contract.toDate.label" default="To Date" />
				</dt>

				<dd>
					<g:formatDate date="${contractInstance?.toDate}" />
				</dd>


				<dt>
					<g:message code="contract.invoicingIsFixedPrice.label"
						default="Invoicing Is Fixed Price" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${contractInstance?.invoicingIsFixedPrice}" />
				</dd>


				<dt>
					<g:message code="contract.invoicingIsTimesheets.label"
						default="Invoicing Is Timesheets" />
				</dt>

				<dd>
					<g:formatBoolean
						boolean="${contractInstance?.invoicingIsTimesheets}" />
				</dd>


				<dt>
					<g:message code="contract.invoicingIsExpenses.label"
						default="Invoicing Is Expenses" />
				</dt>

				<dd>
					<g:formatBoolean boolean="${contractInstance?.invoicingIsExpenses}" />
				</dd>


				<dt>
					<g:message code="contract.assignedTo.label" default="Assigned To" />
				</dt>

				<dd>
					<g:fieldValue bean="${contractInstance}" field="assignedTo" />
				</dd>


				<dt>
					<g:message code="contract.description.label" default="Description" />
				</dt>

				<dd>
					<g:fieldValue bean="${contractInstance}" field="description" />
				</dd>


				<dt>
					<g:message code="contract.termsAndConditions.label"
						default="Terms And Conditions" />
				</dt>

				<dd>
					<g:fieldValue bean="${contractInstance}" field="termsAndConditions" />
				</dd>


			</dl>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<!--  -->
			<ul class="nav nav-tabs" id="organization_show_tab">
			  <li class="active"><a href="#salesOrdersTabsPane" data-toggle="tab">Service & Repair Orders</a></li>
			  <li><a href="#activityTabsPane" data-toggle="tab">Activity</a></li>
			</ul>
			 
			<div class="tab-content">
			  <div class="tab-pane active" id="salesOrdersTabsPane">
			  	<g:render template="service_repair_orderList" />
			  </div>
			  <div class="tab-pane" id="activityPane">
			  	<g:render template="actvityList" />
			  </div>
			</div>
		</div>
		
	</div>	
</body>
</html>
