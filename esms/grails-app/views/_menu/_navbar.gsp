<header>
	<div id="main-navbar" class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<div class="row-fluid">
				<div class="span12">
					<div class="row-fluid">
						<div class="span12">
							<div class="pull-left">
								<%--Left-side entries--%>
								<ul class="nav nav-pills">
									<li
										<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>>
										<a href="${createLink(uri: '/')}"> Home </a>
									</li>
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
									<li <%= 'product' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="product">
										Product
									</g:link>
									</li>
									<li <%= 'quote' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="quote">
										Quote
									</g:link>
									</li>
									<li <%= 'order' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="order">
										Order
									</g:link>
									</li>
									<li <%= 'invoice' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="invoice">
										Invoice
									</g:link>
									</li>
									<li
										<%= 'event' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="event">
										Calendar
									</g:link>
									</li>
									<li <%= 'payment' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="payment">
										Payment
									</g:link>
									</li>
									<li
										<%= 'employee' == controllerName ? ' class="active"' : '' %>>
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
							</div>
							
							<div class="pull-right">
								<g:render template="/_menu/user" />
								
								<ul class="nav user_menu pull-right">
									<li class="hidden-phone hidden-tablet">
										<div class="nb_boxes clearfix">
											<g:link controller="event" action="listView" class="label ttip_b"
												title="New tasks">
												<span id="new_tasks"
													data-url="${createLink(controller : 'event',action: 'getLatestTaskCount')}">
												</span>
												<i class="splashy-calendar_week"></i>
											</g:link>
										</div>
									</li>
								</ul>	
							</div>
						</div>
					</div>

					<div class="row-fluid">
						<div class="span12">
							<div class="pull-right" style="margin-left:0%;">
								<ul class="nav user_menu">
									<li><g:form style="height:32px;margin:0px;">
											<richui:autoComplete name="q"
												action="${createLinkTo('dir': 'organization/search')}"
												class="input-xxlarge" shadow="true" minQueryLength="1"
												onItemSelect="document.location.href = '${createLinkTo(dir: 'organization/show')}/' + id;" />
										</g:form></li>
								</ul>
							</div>
						</div>
					</div>
					
				</div>
			</div>
				</div>	
		</div>
		<!-- Moved to main-content -->
		<%--<div class="navbar-inner" style="height: 20px;">
			<g:render template="/_menu/breadcrumb"></g:render>
		</div>
		--%>
	</div>
</header>
<br />
<br />