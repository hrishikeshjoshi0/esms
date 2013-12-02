<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-collapse collapse" id="navbar-main">
			<!-- Navigation Menus -->
			<ul class="nav navbar-nav">
				<li
					<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>>
					<a href="${createLink(uri: '/')}"> Home </a>
				</li>
				<li <%= 'lead' == controllerName ? ' class="active"' : '' %>><g:link
						controller="lead">
										Leads
									</g:link></li>
				<li <%= 'organization' == controllerName ? ' class="active"' : '' %>>
					<g:link controller="organization">
										Customers
									</g:link>
				</li>
				<li <%= 'product' == controllerName ? ' class="active"' : '' %>>
					<g:link controller="product">
										Products
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
				<li <%= 'event' == controllerName ? ' class="active"' : '' %>>
					<g:link controller="event">
										Calendar
									</g:link>
				</li>
				<li <%= 'payment' == controllerName ? ' class="active"' : '' %>>
					<g:link controller="payment">
										Payments
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

			<ul class="nav navbar-nav navbar-right">
				<li><g:link controller="event" action="listView"
						class="label ttip_b" title="New tasks">
						<span id="new_tasks"
							data-url="${createLink(controller : 'event',action: 'getLatestTaskCount')}">
						</span>
						<i class="splashy-calendar_week"></i>
					</g:link></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> Welcome, <sec:username /> <b
						class="caret"></b>
				</a>

					<ul class="dropdown-menu">
						<li><g:link controller="logout">
								<i class="icon-off"></i> Sign Out</g:link></li>
					</ul></li>
			</ul>

		</div>
	</div>
</div>