<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
		<div class="navbar-collapse collapse" id="navbar-main">
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
				
				<%--<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						Templates <b class="caret"></b>
						<i class="icon-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Free Templates</a></li>
						<li><a href="#">Premium Templates</a></li>
						<li class="dropdown-submenu">
							<a tabindex="-1" href="#">
								WordPress Themes 
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">Free WordPress Themes</a></li>
								<li><a href="#">Premium WordPress Themes</a></li>
							</ul>
						</li>
					</ul>
				</li>
				--%>
				
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
				
				<li>
					<g:link controller="event">
						Calendar
					</g:link>
				</li>
				
				<li>
					<g:link controller="employee">
						HR
					</g:link>
				</li>
				<li>
					<g:link controller="report">
						Report
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
			
			<ul class="nav navbar-nav navbar-right">
				<li>
					<div id="spinner" style="display: none">
						<img src="${resource(dir: 'img', file: 'ajax_loader.gif')}" alt="" />
					</div>
				</li>
				<li><g:link controller="event" action="listView"
						class="link" title="New tasks">
						<span  
							id="new_tasks"
							data-url="${createLink(controller : 'event',action: 'getLatestTaskCount')}">
						</span>						
						New Tasks
					</g:link></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> Welcome, <sec:username /> <b
						class="caret"></b>
				</a>

					<ul class="dropdown-menu">
						<li><g:link controller="logout">
							 Sign Out</g:link></li>
					</ul></li>
			</ul>

		</div>
	</div>
</div>