<!-- Left side column. contains the logo and sidebar -->
<g:set var="controllerName" value="${params.controller}" />
<aside class="left-side sidebar-offcanvas">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<%--<div class="btn-group">
				<button type="button"
					class="btn btn-success btn-sm btn-flat dropdown-toggle"
					data-toggle="dropdown">
					<i class="fa fa-cog"></i> General <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" role="menu">
					<!-- Create New Xxx -->
					<li><g:link controller="product">
							<i class="fa fa-plus"></i> 
					CRM
				</g:link></li>
					<li><g:link controller="product">
							<i class="fa fa-plus"></i> 
					Products
				</g:link></li>
					<li><g:link controller="product">
							<i class="fa fa-plus"></i> 
					Sales
				</g:link></li>
					<li><g:link controller="product">
							<i class="fa fa-plus"></i> 
					Job Center
				</g:link></li>
					<li><g:link controller="product">
							<i class="fa fa-plus"></i> 
					Finance
				</g:link></li>
					<!-- Create New Xxx Ends -->
				</ul>
			</div>
		--%></div>

		<!-- search form -->
		<%--<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control"
					placeholder="Search..." /> <span class="input-group-btn">
					<button type='submit' name='seach' id='search-btn'
						class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->
		--%>
		
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li <%= 'dashboard' == controllerName ? ' class="active"' : '' %>>
				<g:link controller="dashboard">
				  		<i class="fa fa-dashboard"></i> <span>Dashboard</span>
				</g:link>
			</li>
			
			<li class="treeview <%= ['lead','organization'].contains(controllerName)  ? ' active' : '' %>">
				<a href="#"> 
					<i class="fa fa-users"></i> 
					<span>CRM</span> 
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li <%= 'lead' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="lead">
								Leads
						</g:link>
					</li>
					<li
						<%= 'organization' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="organization">
							 		Customers
						</g:link>
					</li>
				</ul>
			</li>
			
			<li class="treeview <%= ['quote','order'].contains(controllerName)  ? ' active' : '' %>">
				<a href="#"> 
					<i class="fa fa-briefcase"></i>
					<span>Sales</span> 
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li <%= 'quote' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="quote">
								Quotes
						</g:link>
					</li>
					<li
						<%= 'order' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="order">
							 	Orders
						</g:link>
					</li>
				</ul>
			</li>
			
			<li class="treeview <%= ['invoice','payment'].contains(controllerName)  ? ' active' : '' %>">
				<a href="#"> 
					<i class="fa fa-money"></i>
					<span>Invoicing</span> 
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li <%= 'invoice' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="invoice">
							Invoices
						</g:link>
					</li>
					<li
						<%= 'payment' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="payment">
							Payment
						</g:link>
					</li>
				</ul>
			</li>
			
			<li <%= 'product' == controllerName ? ' class="active"' : '' %>>
				<g:link controller="product">
				  	<i class="fa fa-cogs"></i>
				  	<span>Products</span>
				</g:link>
			</li>
			
			<li <%= 'event' == controllerName ? ' class="active"' : '' %>>
				<g:link
					controller="event"> 
					<i class="fa fa-calendar"></i>
					<span>Calendar</span> 
					<%--<small class="badge pull-right bg-red">3</small>
					--%>
				</g:link>
			</li>
			
			<li class="treeview <%= ['report'].contains(controllerName)  ? ' active' : '' %>">
				<a href="#"> 
					<i class="fa fa-bar-chart-o"></i>
					<span>Reports</span> 
					<i class="fa fa-angle-left pull-right"></i>
				</a>
				<ul class="treeview-menu">
					<li><g:link controller="report" action="upcomingRepairs">
							<g:message code="default.button.upcomingRepairs.label"
								default="Upcoming Repairs" />
						</g:link></li>

					<li><g:link controller="report" action="upcomingRenewals">
							<g:message code="default.button.upcomingRenewals.label"
								default="Upcoming Renewals" />
						</g:link></li>

					<li><g:link controller="report" action="amountReceivables">
							<g:message code="default.button.amountReceivables.label"
								default="Amount Receivables" />
						</g:link></li>

					<li><g:link controller="report" action="toBeReplaced">
							<g:message code="default.button.toBeReplaced.label"
								default="To Be Replaced" />
						</g:link></li>
				</ul> 
			</li>
			
			<%--<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
					<span>UI Elements</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="../UI/general.html"><i
							class="fa fa-angle-double-right"></i> General</a></li>
					<li><a href="../UI/icons.html"><i
							class="fa fa-angle-double-right"></i> Icons</a></li>
					<li><a href="../UI/buttons.html"><i
							class="fa fa-angle-double-right"></i> Buttons</a></li>
					<li><a href="../UI/sliders.html"><i
							class="fa fa-angle-double-right"></i> Sliders</a></li>
					<li><a href="../UI/timeline.html"><i
							class="fa fa-angle-double-right"></i> Timeline</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Forms</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="../forms/general.html"><i
							class="fa fa-angle-double-right"></i> General Elements</a></li>
					<li><a href="../forms/advanced.html"><i
							class="fa fa-angle-double-right"></i> Advanced Elements</a></li>
					<li><a href="../forms/editors.html"><i
							class="fa fa-angle-double-right"></i> Editors</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-table"></i>
					<span>Tables</span> <i class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="../tables/simple.html"><i
							class="fa fa-angle-double-right"></i> Simple tables</a></li>
					<li><a href="../tables/data.html"><i
							class="fa fa-angle-double-right"></i> Data tables</a></li>
				</ul></li>
			
			<li><a href="../mailbox.html"> <i class="fa fa-envelope"></i>
					<span>Mailbox</span> <small class="badge pull-right bg-yellow">12</small>
			</a></li>
			<li class="treeview"><a href="#"> <i
					class="fa fa-folder"></i> <span>Examples</span> <i
					class="fa fa-angle-left pull-right"></i>
			</a>
				<ul class="treeview-menu">
					<li><a href="invoice.html"><i
							class="fa fa-angle-double-right"></i> Invoice</a></li>
					<li><a href="login.html"><i
							class="fa fa-angle-double-right"></i> Login</a></li>
					<li><a href="register.html"><i
							class="fa fa-angle-double-right"></i> Register</a></li>
					<li><a href="lockscreen.html"><i
							class="fa fa-angle-double-right"></i> Lockscreen</a></li>
					<li><a href="404.html"><i class="fa fa-angle-double-right"></i>
							404 Error</a></li>
					<li><a href="500.html"><i class="fa fa-angle-double-right"></i>
							500 Error</a></li>
					<li><a href="blank.html"><i
							class="fa fa-angle-double-right"></i> Blank Page</a></li>
				</ul></li>
			--%>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>