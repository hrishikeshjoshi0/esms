<!doctype html>
<html>
<head>
	<meta name="layout" content="bootstrap" />
	<title>Venus CRM</title>
</head>
<body>
	<div id="contentwrapper" class="">
		<!-- Row 1 -->
		<div class="row-fluid">
			
			<!-- 1/2 row width -->
			<div class="span6">
				<div id="recentLeadsWidget" class="dashboard-widget">
					<g:render template="/dashboard/recentLeads" />
				</div>
			</div>

			<div class="span6">
				<div class="dashboard-widget">
					<g:render template="/dashboard/recentCustomers" />
				</div>
			</div>
		</div>

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
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>
