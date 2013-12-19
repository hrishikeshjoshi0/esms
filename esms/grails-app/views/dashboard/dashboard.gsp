<%@ page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.party.Address"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="dashboardLayout">
<title>Venus CRM</title>

</head>
<body>
	<div class="row">
		<div class="col-md-12 dashboard-widget">
			<div class="page-header">
				<h3>Upcoming Renewals And Tasks</h3>
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

	

	<div class="row">
		<div class="col-md-12 dashboard-widget">
			<div id="recentLeadsWidget" class="dashboard-widget">
				<g:render template="/dashboard/recentLeads" />
			</div>
		</div>
	</div>

	

	<div class="row">
		<div class="col-md-12 dashboard-widget">
			<div id="recentQuotesWidget" class="dashboard-widget">
				<g:render template="/dashboard/recentMaintenanceQuotes" />
			</div>
		</div>
	</div>

	

	<div class="row">
		<div class="col-md-12 dashboard-widget">
			<div id="recentCustomers" class="dashboard-widget">
				<g:render template="/dashboard/recentCustomers" />
			</div>
		</div>
	</div>

	

	<div class="row">
		<div class="col-md-12 dashboard-widget">
			<div class="page-header">
				<h3>Repair, Modernization & Installation Quotes & Orders</h3>
			</div>

			<richui:tabView id="rmiQuotesAndOrdersTabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Quotes" />
					<richui:tabLabel title="Orders" />
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render
							template="/dashboard/recentRepairModernizationInstallationQuotes" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render
							template="/dashboard/recentRepairModernizationInstallationOrders" />
					</richui:tabContent>
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>

	

	<div class="row">
		<div class="col-md-12 dashboard-widget">
			<g:render template="/dashboard/outstandingPayments" />
		</div>
	</div>

	

	<div class="row">
		<div class="col-md-12 dashboard-widget">
			<g:render template="/dashboard/openPayments" />
		</div>
	</div>

	

	<div class="row">
		<div class="col-md-6 dashboard-widget">
			<g:render template="/dashboard/upcomingEvents" />
		</div>

		<div class="col-md-6 dashboard-widget">
			<g:render template="/dashboard/overdueEvents" />
		</div>
	</div>

	

	<div class="row">
		<div class="col-md-4 dashboard-widget">
			<g:render template="/dashboard/recentDocuments" />
		</div>

		<div class="col-md-8 dashboard-widget">
			<g:render template="/dashboard/recentPayments" />
		</div>
	</div>
</body>
</html>