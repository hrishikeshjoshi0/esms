<%@ page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.party.Address"%>
<%@ page import="org.grails.plugins.google.visualization.data.Cell; org.grails.plugins.google.visualization.util.DateUtil" %>


<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<gvisualization:apiImport/>
<title>DexCRM</title>

</head>
<body>
	<div class="row">
		<%
		  def ordersByStatusColumns = [['string', 'Status'], ['number', 'Total']]
		  def accountsBySalesStatusColumns = [['string', 'Sales Status'], ['number', 'Total']]
		  def leadConversionColumns = [['string', 'Label'], ['number', 'Value']]
		  %>
		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					Accounts
				</div>
				<div class="panel-body">
					<gvisualization:barCoreChart elementId="barchart" title="Accounts" columns="${accountsBySalesStatusColumns}" data="${accountsBySalesStatus}" />
					<div id="barchart"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					Orders By Status
				</div>
				<div class="panel-body">
					<gvisualization:imagePieChart elementId="imagepiechart" title="Orders By Status" columns="${ordersByStatusColumns}" data="${ordersByStatus}" />
					<div id="imagepiechart"></div>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					Lead Conversion Rate
				</div>
				<div class="panel-body">
					<gvisualization:gauge elementId="gauge" redFrom="${0}" redTo="${10}" yellowFrom="${11}" yellowTo="${50}" greenFrom="${51}" greenTo="${100}" minorTicks="${5}" columns="${leadConversionColumns}" data="${leadConversionData}" />
       				<div id="gauge"></div>
				</div>
			</div>
		</div>
	</div>		
	
	<div class="row">
		<div class="col-md-6 dashboard-widget">
			<div class="page-header">
				<h3>Upcoming Renewals</h3>
			</div>
			<div id="recentQuotesWidget" class="dashboard-widget">
				<g:render template="/dashboard/upcomingRenewals" />
			</div>
		</div>
		
		<div class="col-md-6 dashboard-widget">
			<div class="page-header">
				<h3>Upcoming Tasks</h3>
			</div>
			<div id="recentQuotesWidget" class="dashboard-widget">
				<g:render template="/dashboard/upcomingTasks" />
			</div>
		</div>
		
		<%--<div class="col-md-12 dashboard-widget">
			<div class="page-header">
				<h3>Upcoming Renewals And Tasks
				</h3>
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
	--%></div>

	<div class="row">
		<div class="col-md-6 dashboard-widget">
			<div id="recentQuotesWidget" class="dashboard-widget">
				<g:render template="/dashboard/recentMaintenanceQuotes" />
			</div>
		</div>
		
		<div class="col-md-6 dashboard-widget">
			<div id="recentCustomers" class="dashboard-widget">
				<g:render template="/dashboard/recentCustomers" />
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6 dashboard-widget">
			<div class="page-header">
				<h3>Repair, Modernization & Installation Quotes</h3>
			</div>
			<div id="recentCustomers" class="dashboard-widget">
				<g:render template="/dashboard/recentRepairModernizationInstallationQuotes" />
			</div>
		</div>
		
		<div class="col-md-6 dashboard-widget">
			<div class="page-header">
				<h3>Repair, Modernization & Installation Orders</h3>
			</div>
			<div id="recentCustomers" class="dashboard-widget">
				<g:render template="/dashboard/recentRepairModernizationInstallationOrders" />
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-6 dashboard-widget">
			<g:render template="/dashboard/outstandingPayments" />
		</div>

		<div class="col-md-6 dashboard-widget">
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
		<div class="col-md-6 dashboard-widget">
			<g:render template="/dashboard/recentDocuments" />
		</div>

		<div class="col-md-6 dashboard-widget">
			<g:render template="/dashboard/recentPayments" />
		</div>
	</div>
</body>
</html>