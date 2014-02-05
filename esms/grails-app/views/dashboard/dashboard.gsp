<%@ page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.party.Address"%>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<title>DexCRM</title>
	</head>
	
	<body>
		<div class="row">
			<div class="col-md-12 summaryWidgets">
				<div class="panel panel-default">
					<div class="panel-heading">
						Summary
					</div>
					<div class="panel-body">
						<!-- Summary Widgets -->
						<div class="col-md-2">
							<div class="panel panel-default">
							  <div class="panel-body">
							    Widget#1
							  </div>
							</div>
						</div>
						
						<div class="col-md-2">
							<div class="panel panel-default">
							  <div class="panel-body">
							    Widget#2
							  </div>
							</div>
						</div>
						
						<div class="col-md-2">
							<div class="panel panel-default">
							  <div class="panel-body">
							    Widget#3
							  </div>
							</div>
						</div>
						
						<div class="col-md-2">
							<div class="panel panel-default">
							  <div class="panel-body">
							    Widget#4
							  </div>
							</div>
						</div>
						
						<div class="col-md-2">
							<div class="panel panel-default">
							  <div class="panel-body">
							    Widget#5
							  </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div id="recentCustomers" class="panel panel-default">
					<div class="panel-heading">
						Recent Service Contracts
					</div>
					<div class="panel-body dashboard-widget">
						<g:render template="/dashboard/recentCustomers" />
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div id="recentCustomers" class="panel panel-default">
					<div class="panel-heading">
						Recent Service Contracts
					</div>
					<div class="panel-body dashboard-widget">
						<g:render template="/dashboard/recentCustomers" />
					</div>
				</div>
			</div>
			
		</div>	
		
		<div class="row">
			<div class="col-md-12 myTaskWidgets">
				<div class="panel panel-default">
					<div class="panel-heading">
						My Tasks
					</div>
					<div class="panel-body">
						
					</div>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-md-12 chartWidgets">
				<div class="panel panel-default">
					<div class="panel-heading">
						Charts
					</div>
					<div class="panel-body">
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 reportWidgets">
				<div class="panel panel-default">
					<div class="panel-heading">
						Reports
					</div>
					<div class="panel-body">
						
					</div>
				</div>
			</div>
		</div>
	</body>
</html>