

<%@ page import="com.esms.model.sales.Contract" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'contract.label', default: 'Contract')}" />
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

			<dl class="dl-horizontal">
				
							<dt><g:message code="contract.contractNumber.label" default="Contract Number" /></dt>
						
							<dd><g:fieldValue bean="${contractInstance}" field="contractNumber"/></dd>
						
				
							<dt><g:message code="contract.customerNumber.label" default="Customer Number" /></dt>
						
							<dd><g:fieldValue bean="${contractInstance}" field="customerNumber"/></dd>
						
				
							<dt><g:message code="contract.status.label" default="Status" /></dt>
						
							<dd><g:fieldValue bean="${contractInstance}" field="status"/></dd>
						
				
							<dt><g:message code="contract.fromDate.label" default="From Date" /></dt>
						
							<dd><g:formatDate date="${contractInstance?.fromDate}" /></dd>
						
				
							<dt><g:message code="contract.toDate.label" default="To Date" /></dt>
						
							<dd><g:formatDate date="${contractInstance?.toDate}" /></dd>
						
				
							<dt><g:message code="contract.invoicingIsFixedPrice.label" default="Invoicing Is Fixed Price" /></dt>
						
							<dd><g:formatBoolean boolean="${contractInstance?.invoicingIsFixedPrice}" /></dd>
						
				
							<dt><g:message code="contract.invoicingIsTimesheets.label" default="Invoicing Is Timesheets" /></dt>
						
							<dd><g:formatBoolean boolean="${contractInstance?.invoicingIsTimesheets}" /></dd>
						
				
							<dt><g:message code="contract.invoicingIsExpenses.label" default="Invoicing Is Expenses" /></dt>
						
							<dd><g:formatBoolean boolean="${contractInstance?.invoicingIsExpenses}" /></dd>
						
				
							<dt><g:message code="contract.assignedTo.label" default="Assigned To" /></dt>
						
							<dd><g:fieldValue bean="${contractInstance}" field="assignedTo"/></dd>
						
				
							<dt><g:message code="contract.description.label" default="Description" /></dt>
						
							<dd><g:fieldValue bean="${contractInstance}" field="description"/></dd>
						
				
							<dt><g:message code="contract.termsAndConditions.label" default="Terms And Conditions" /></dt>
						
							<dd><g:fieldValue bean="${contractInstance}" field="termsAndConditions"/></dd>
						
				
			</dl>

			<g:form>
				<g:hiddenField name="id" value="${contractInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${contractInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>
