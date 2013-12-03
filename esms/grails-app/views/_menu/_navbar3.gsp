<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-collapse collapse" id="navbar-main">
			<!-- Navigation Menus -->
			<ul class="nav navbar-nav">
				<li
					<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>>
					<a href="${createLink(uri: '/')}"> Home </a>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						CRM <b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
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
					</ul>
				</li>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						Sales <b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
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
						<li <%= 'product' == controllerName ? ' class="active"' : '' %>>
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
						<li <%= 'invoice' == controllerName ? ' class="active"' : '' %>>
							<g:link controller="invoice">
								Invoices
							</g:link>
						</li>
						<li class="divider"></li>
						<li <%= 'payment' == controllerName ? ' class="active"' : '' %>>
							<g:link controller="payment">
								Payments
							</g:link>
						</li>
					</ul>
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
						Report
					</g:link>
				</li>
			</ul>
			
			<div id="spinner" style="display: none">
				<img src="${resource(dir: 'img', file: 'ajax_loader.gif')}" alt="" />
			</div>

			<ul class="nav navbar-nav navbar-right">
				<li><g:link controller="event" action="listView"
						class="link" title="New tasks">
						<span class="badge" id="new_tasks"
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
								<i class="glyphicon glyphicon-off"></i> Sign Out</g:link></li>
					</ul></li>
			</ul>

		</div>
	</div>
</div>