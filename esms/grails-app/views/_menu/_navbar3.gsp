<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="row topbar">
		<div class="col-md-2">
			<a href="http://www.dexbiz.com/products/dexcrm">
				<img alt="DexBiz" src="${resource(dir: 'images', file: 'LogoCrmSm_Blue.png')}" />
			</a>
		</div>
		<div class="col-md-10">
			<sec:ifLoggedIn>
				<div class="navbar-header">
		          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		          </button>
		        </div>
		        <div class="navbar-collapse collapse" id="navbar-main">
					<ul class="nav nav-tabs">
					  <li class="active"><a href="#">Dashboard</a></li>
					  <li>
					  	<g:link action="index" controller="organization">
					  		CRM
					  	</g:link>
					  </li>
					  <li><a href="#">Sales</a></li>
					  <li><a href="#">Invoicing</a></li>
					  <li><a href="#">Calendar</a></li>
					  <li><a href="#">HR</a></li>
					  <li><a href="#">User Management</a></li>
					  <li><a href="#">Reports</a></li>
					</ul>
		        </div>
			</sec:ifLoggedIn>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="navbar-header">
	          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	        </div>
			<div class="navbar-collapse collapse" id="navbar-main">
				<sec:ifLoggedIn>
				<!-- Navigation Menus -->
				<ul class="nav navbar-nav">
					<li>
						<a href="${createLink(uri: '/')}"> Dashboard </a>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							CRM <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<!-- Leads -->
							<li class="dropdown-submenu">
								<a tabindex="-1" href="#">
									Lead Management
									<i class="icon-angle-down"></i>
								</a>
								<ul class="dropdown-menu">
									<li>
										<g:link action="create" controller="lead">
											Create New Lead
										</g:link>
									</li>
									<li>
										<g:link controller="lead">
											View All Leads
										</g:link>
									</li>
								</ul>
							</li>
							<!-- Lead Ends -->
							
							<li class="dropdown-submenu">
								<a tabindex="-1" href="#">
									Customers
									<i class="icon-angle-down"></i>
								</a>
								<ul class="dropdown-menu">
									<li>
										<g:link action="create" controller="organization">
											Create New Customer
										</g:link>
									</li>
									<li>
										<g:link controller="organization">
											View All Customers
										</g:link>
									</li>
								</ul>
							</li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Sales <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li class="dropdown-submenu">
								<a tabindex="-1" href="#">
									Quotes
									<i class="icon-angle-down"></i>
								</a>
								<ul class="dropdown-menu">
									<li>
										<g:link controller="quote">
											View All Quotes
										</g:link>
									</li>
									<li>
										<g:link action="create" controller="quote"
											params="[contractQuote:true,type:'CONTRACT']">
											Create Contract Quote
										</g:link>
									</li>
									<li>
										<g:link action="create" controller="quote"
											params="[type:'REPAIR']">
											Create Repair Quote
										</g:link>
									</li>
									<li>
										<g:link action="create" controller="quote"
											params="[contractQuote:true,type:'INSTALLATION']">
											Create Installation Quote
										</g:link>
									</li>
									<li>
										<g:link action="create" controller="quote"
											params="[type:'MODERNIZATION']">
											Create Modernization Quote
										</g:link>
									</li>
								</ul>
							</li>
							<li class="dropdown-submenu">
								<a tabindex="-1" href="#">
									Orders
									<i class="icon-angle-down"></i>
								</a>
								<ul class="dropdown-menu">
									<li>
										<g:link controller="order">
											View All Orders
										</g:link>
									</li>
								</ul>
							</li>						
							<li>
								<g:link controller="product">
									Products
								</g:link>
							</li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Invoicing <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li>
								<g:link controller="invoice">
									Invoices
								</g:link>
							</li>
							<li>
								<g:link controller="payment">
									Payments
								</g:link>
							</li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Calendar <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li>
								<g:link class="lnk " controller="event" action="index">View Calendar</g:link>
							</li>
							<li>
								<g:link class="lnk " controller="event" action="listView">All Events</g:link>
							</li>
							<li>
								<g:link class="lnk " controller="event" action="overdueEvents">Overdue Events</g:link>
							</li>
							<li>
								<g:link class="lnk " controller="event" action="upcomingEvents">Upcoming Events</g:link>
							</li>
							<li>
								<g:link class="lnk " controller="task" action="list">Tasks</g:link>
							</li>
						</ul>
					</li>
	
					<li>
						<g:link controller="employee">
							HR
						</g:link>
					</li>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							Reports <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li>
								<g:link controller="report" action="upcomingRepairs">
									<g:message code="default.button.upcomingRepairs.label"
										default="Upcoming Repairs" />
								</g:link>
							</li>
							
							<li>
								<g:link controller="report" action="upcomingRenewals">
									<g:message code="default.button.upcomingRenewals.label"
										default="Upcoming Renewals" />
								</g:link>
							</li>
							
							<li>
								<g:link controller="report" action="amountReceivables">
									<g:message code="default.button.amountReceivables.label"
										default="Amount Receivables" />
								</g:link>
							</li>
							
							<li>
								<g:link controller="report" action="toBeReplaced">
									<g:message code="default.button.toBeReplaced.label"
										default="To Be Replaced" />
								</g:link>
							</li>
							
							<li>
								<g:link controller="report" action="isProblemRepeated">
									<g:message code="default.button.isProblemRepeated.label"
										default="Is Problem Repeated" />
								</g:link>
							</li>
						</ul>
					</li>
				</ul>
				
				
				<g:form class="visible-md visible-lg">
						<richui:autoComplete name="q"
								action="${createLinkTo('dir': 'organization/search')}"
								class="col-md-2 col-md-offset-1" shadow="true" minQueryLength="1" style="margin-top:5px;"
								onItemSelect="document.location.href = '${createLinkTo(dir: 'organization/show')}/' + id;" />
				</g:form>
				
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">
							<span class="glyphicon glyphicon-user"></span>
							<%-- 
							Welcome, <sec:username /> 
							--%>
							<b class="caret"></b>
					</a>
	
					<ul class="dropdown-menu">
							<sec:ifAllGranted roles="ROLE_ADMIN">
								<!-- User Management -->
								<li class="dropdown-submenu">
									<a tabindex="-1" href="#">
										Users
										<i class="icon-angle-down"></i>
									</a>
									<ul class="dropdown-menu">
										<li><g:link controller="user" action='search'>
												Search User
											</g:link></li>
										<li><g:link controller="user" action='create'>
														Create User
													</g:link></li>
									</ul>
								</li>
								
								<%--<li class="dropdown-submenu">
									<a tabindex="-1" href="#">
										Roles
										<i class="icon-angle-down"></i>
									</a>
									<ul class="dropdown-menu">
										<li><g:link controller="role" action='search'>
														Search Role
													</g:link></li>
										<li><g:link controller="role" action='create'>
														Create Role
													</g:link></li>
									</ul>
								</li>
								--%>
								<li class="divider"></li>			
							</sec:ifAllGranted>
							<li>
								<g:link controller="logout">
								 Sign out</g:link>
							</li>
						</ul>
					</li>
					
					<li class="visible-md visible-lg">
						<g:remoteLink controller="task" action="administrationTaskListModal" id="1" onSuccess="openModalBox(data,'View Admin Tasks')">
	    					<span class="glyphicon glyphicon-list-alt"></span>		
	    				</g:remoteLink>
					</li>
				</ul>
				</sec:ifLoggedIn>
			</div>
		</div>
	</div>
</div>

<!-- Spinner Div -->
<div id="spinner" style="display: none">
	<img src="${resource(dir: 'images', file: 'spinner.gif')}"
		alt="Loading..." />
</div>
<!-- Spinner Div Ends -->

<!-- Modal Div -->
<div id="modalTemplate" class="modal fade">
	<div class="modal-dialog" style="width:90%;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body"></div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- Modal Div Ends -->