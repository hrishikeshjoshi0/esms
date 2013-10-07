<%@ page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.party.Address"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="dashboardLayout">
<g:set var="entityName"
	value="${message(code: 'organization.label', default: 'Leads')}" />
<title>
	Venus CRM
</title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<g:render template="/dashboard/upcomingRenewals" />
		</div>
	</div>
	
	<hr/>
	
	<div class="row-fluid">
		<div class="span6">
			<g:render template="/dashboard/upcomingEvents" />
		</div>
		
		<div class="span6">
			<g:render template="/dashboard/overdueEvents" />
		</div>
	</div>
	
	<hr/>

	<div class="row-fluid">
		<div class="span6">
			<g:render template="/dashboard/ordersPendingPayment" />
		</div>

		<div class="span6">
			<g:render template="/dashboard/openPayments" />
		</div>
	</div>
	
	<hr/>

	<div class="row-fluid">
		<div class="span6">
			<div id="recentLeadsWidget" class="dashboard-widget">
				<g:render template="/dashboard/recentLeads" />
			</div>
		</div>
		
		<div class="span6">
			<div id="recentCustomers" class="dashboard-widget">
				<g:render template="/dashboard/recentCustomers" />
			</div>
		</div>
	</div>
	
	<hr/>

	<div class="row-fluid">
		<div class="span6">
			<div id="recentQuotesWidget" class="dashboard-widget">
				<g:render template="/dashboard/recentQuotes" />
			</div>
		</div>
		
		<div class="span6">
			<div class="dashboard-widget">
				<g:render template="/dashboard/recentOrders" />
			</div>
		</div>
	</div>
	
	<hr/>

	<div class="row-fluid">
		<div class="span6">
			<div class="dashboard-widget">
				<g:render template="/dashboard/recentDocuments" />
			</div>
		</div>

		<div class="span6">
			<div class="dashboard-widget">
				<g:render template="/dashboard/recentPayments" />
			</div>
		</div>
	</div>
</body>
</html>