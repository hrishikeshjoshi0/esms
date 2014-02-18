<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="row topbar">
		<div class="col-md-2">
			<a href="http://www.dexbiz.com/products/dexcrm">
				<img alt="DexBiz" src="${resource(dir: 'images', file: 'LogoCrmSm_Blue.png')}" />
			</a>
		</div>
		<div class="col-md-8">
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
					  <g:set var="controllerName" value="${params.controller}" />	
					  <li <%= 'dashboard' == controllerName ? ' class="active"' : '' %>>
					  	<g:link controller="dashboard">
					  		Dashboard
					  	</g:link>
					  </li>
					  <li <%= 'lead' == controllerName ? ' class="active"' : '' %>>
					  	<g:link controller="lead">
					  		Leads
					  	</g:link>
					  </li>
					  <li <%= 'organization' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="organization">
					  		Customers
					  	</g:link>
					  </li>
					  <li <%= 'quote' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="quote">
					  		Quotes
					  	</g:link>
					  </li>
					  <li <%= 'order' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="order">
					  		Orders
					  	</g:link>
					  </li>
					  <li <%= 'invoice' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="invoice">
					  		Invoices
					  	</g:link>
					  </li>
					  <li <%= 'product' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="product">
					  		Products
					  	</g:link>
					  </li>
					  <li <%= 'event' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="event">
					  		Calendar
					  	</g:link>
					  </li>
					  <li <%= 'employee' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="employee">
					  		HR
					  	</g:link>
					  </li>
					  <li <%= 'report' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="report">
					  		Reports
					  	</g:link>
					  </li>
					</ul>
		        </div>
			</sec:ifLoggedIn>
		</div>
		<div class="col-md-2">
			<g:render template="/_common/suggest"></g:render>
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
					<g:if test="${params.controller=='dashboard'}">
						<li>
							<g:link action="create" controller="lead">
								Create Lead
							</g:link>
						</li>
						<li>
							<g:link action="create" controller="quote"
								params="[contractQuote:true,type:'CONTRACT']">
								Create Contract Quote
							</g:link>
						</li>
						<li>
							<g:link class="lnk " controller="event" action="index">View Calendar</g:link>
						</li>
						<li>
							<g:link action="create" controller="invoice">
								Create Invoice
							</g:link>
						</li>
					</g:if>
					
					<g:if test="${params.controller=='lead'}">
						<li>
							<g:link action="create" controller="lead">
								Create Lead
							</g:link>
						</li>
						<li>
							<g:link controller="lead">
								View All Leads
							</g:link>
						</li>
					</g:if>
					
					<g:if test="${params.controller=='organization'}">
						<li>
							<g:link action="create" controller="organization">
								Create Customer
							</g:link>
						</li>
						<li>
							<g:link controller="organization">
								View All Customers
							</g:link>
						</li>
					</g:if>
					
					<g:if test="${params.controller=='quote'}">
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
					</g:if>
					
					<g:if test="${params.controller=='order'}">
						<li>
							<g:link action="create" controller="order">
								Create Order
							</g:link>
						</li>
						<li>
							<g:link controller="order">
								View All Orders
							</g:link>
						</li>
					</g:if>
					
					<g:if test="${params.controller=='invoice'}">
						<li>
							<g:link action="create" controller="invoice">
								Create Invoice
							</g:link>
						</li>
						<li>
							<g:link controller="invoice">
								View All Invoices
							</g:link>
						</li>
						<li>
							<g:link controller="payment">
								View All Payments
							</g:link>
						</li>
					</g:if>
					
					<g:if test="${params.controller=='product'}">
						<li>
							<g:link action="create" controller="lead">
								Create Product
							</g:link>
						</li>
						<li>
							<g:link controller="product">
								View All Products
							</g:link>
						</li>
					</g:if>
					
					<g:if test="${params.controller=='calendar'}">
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
					</g:if>
					
					<g:if test="${params.controller=='employee'}">
						<li>
							<g:link controller="employee">
								HR
							</g:link>
						</li>
					</g:if>
					
					<g:if test="${params.controller=='report'}">
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
					</g:if>
				</ul>				
				
				<div class="pull-right">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span class="glyphicon glyphicon-user"></span>
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
				</div>
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