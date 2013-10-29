<%@ page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.party.Address"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="dashboardLayout">
<g:set var="entityName"
	value="${message(code: 'organization.label', default: 'Leads')}" />
<resource:tabView />
<title>Venus CRM</title>
<style type="text/css"><%--
	.dashboard-widget {
		height: 350px;
		overflow: auto;
		overflow-y: auto;
	}
--%></style>
</head>
<body>
	<div class="row-fluid">
		<div class="span12 dashboard-widget">
			<div class="page-header">
				<h1>Upcoming Renewals And Tasks</h1>
			</div>

			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Upcoming Renewals" />
					<richui:tabLabel title="Upcoming Tasks" />
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render template="/dashboard/upcomingRenewals" />
					</richui:tabContent>

					<richui:tabContent>
				   	 	<g:render template="/dashboard/upcomingTasks" />
					</richui:tabContent>
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>

	<hr />

	<div class="row-fluid">
		<div class="span6 dashboard-widget">
			<div id="recentLeadsWidget" class="dashboard-widget">
				<g:render template="/dashboard/recentLeads" />
			</div>
		</div>

		<div class="span6 dashboard-widget">
			<div id="recentCustomers" class="dashboard-widget">
				<g:render template="/dashboard/recentCustomers" />
			</div>
		</div>
	</div>

	<hr />

	<div class="row-fluid">
		<div class="span6 dashboard-widget">
			<div id="recentQuotesWidget" class="dashboard-widget">
				<g:render template="/dashboard/recentQuotes" />
			</div>
		</div>

		<div class="span6 dashboard-widget">
			<div class="dashboard-widget">
				<g:render template="/dashboard/recentRepairModernizationInstallationQuotes" />
			</div>
		</div>
	</div>

	<hr />

	<div class="row-fluid">
		<div class="span6 dashboard-widget">
			<g:render template="/dashboard/ordersPendingPayment" />
		</div>

		<div class="span6 dashboard-widget">
			<g:render template="/dashboard/openPayments" />
		</div>
	</div>

	<hr />
	
	<div class="row-fluid">
		<div class="span6 dashboard-widget">
			<g:render template="/dashboard/upcomingEvents" />
		</div>

		<div class="span6 dashboard-widget">
			<g:render template="/dashboard/overdueEvents" />
		</div>
	</div>

	<hr />

	<div class="row-fluid">
		<div class="span6 dashboard-widget">
			<g:render template="/dashboard/recentDocuments" />
		</div>

		<div class="span6 dashboard-widget">
			<g:render template="/dashboard/recentPayments" />
		</div>
	</div>
</body>
</html>