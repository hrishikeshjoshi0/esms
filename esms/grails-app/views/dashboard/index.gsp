<!doctype html>
<html>
<head>
	<meta name="layout" content="dashboardLayout" />
	<title>Venus CRM</title>
	<style>
		.row-fluid {
			margin: 2px;
			padding: 2px;
			max-height: 50px; 
		}
		
		.span12 {
			margin: 2px;
			padding: 2px;
			max-height: 50px;
		}
	</style>
</head>
<body>
	<div id="contentwrapper" class="">
		<!-- Row 1 -->
		<div class="row-fluid">
			<div class="span12" style="margin:2px;">
				<g:render template="/dashboard/upcomingEvents" />
			</div>
		</div>
		
		<hr/>
		
		<div class="row-fluid">
			<div class="span12">
				<g:render template="/dashboard/overdueEvents" />
			</div>
		</div>
		
		<hr/>
		
		<!-- Row 2 -->
		<div class="row-fluid">
			<div class="span6">
				<g:render template="/dashboard/ordersPendingPayment" />
			</div>

			<div class="span6">
				<g:render template="/dashboard/openPayments" />
			</div>
		</div>

		<hr/>
		<!-- 
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
		-->
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>
