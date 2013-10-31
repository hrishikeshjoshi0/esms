<head>
	<resource:autoComplete skin="esmsAutocomplete"/>
</head>
<header>
	<div class="navbar navbar-fixed-top" >
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="brand" href="${createLink(uri: '/')}">
					<img src="${resource(dir: 'images', file: 'venus_crm_logo.png')}" alt="${meta(name:'app.name')}" 
							style="height:40px;width:auto;"/> <br/>
				</a>
				
						<ul class="nav">
							<li class="dropdown">
								<a data-toggle="dropdown" class="dropdown-toggle" href="#">
									<i class="icon-th-large icon-white"></i>
									Quick Links 
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
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
									<li <%= 'activity' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="event">
														Calendar
													</g:link>
									</li>
									<li <%= 'payment' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="payment">
														Payment
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
							</li>
						</ul>
						
				<ul class="nav user_menu pull-left" style="margin-left:2px;">
					<li>
						<g:form style="margin-top:10px;">
							<richui:autoComplete name="q" action="${createLinkTo('dir': 'organization/search')}"
									class="input-xxlarge" shadow="true" minQueryLength="1"  
						    		onItemSelect="document.location.href = '${createLinkTo(dir: 'organization/show')}/' + id;" />
						</g:form>
					</li>
				</ul>		
				
				<!-- Nav Right -->
				<ul class="nav user_menu pull-right" style="margin-left:2px;">
					<li class="hidden-phone hidden-tablet">
						<div class="nb_boxes clearfix">
							<%--<a data-toggle="modal" data-backdrop="static" href="#myMail" class="label ttip_b" title="New messages">
								25 <i class="splashy-mail_light"></i>
							</a> 
							--%>
							<g:link controller="event" action="listView" class="label ttip_b" title="New tasks">
								<span id="new_tasks" data-url="${createLink(controller : 'event',action: 'getLatestTaskCount')}">
								</span> 
								<i class="splashy-calendar_week"></i>
							</g:link>
						</div>
					</li>
					
					<li>
						<a> | </a>
					</li>
					
					<!-- User -->
					<li>
						<a href="#">
							<i class="icon-user icon-white"></i>
							Welcome,
							<sec:username />
						</a>
					</li>
					
					<%--<li>
						<a> | </a>
					</li>
					
					<!-- User -->
					<li>
						<a href="#">
							Logged In Since :
							<g:formatDate date="${session.lastLoginDate}" format="yyyy-MM-dd" type="datetime" style="SHORT"/>
						</a>
					</li>
					--%>
					<li>
						<a> | </a>
					</li>
					
					<li>
						<g:link class="dropdown-toggle" controller="logout">Log Out</g:link>
					</li>
					
				</ul>
				
				<a data-target=".nav-collapse" data-toggle="collapse"
					class="btn_menu"> <span class="icon-align-justify icon-white"></span>
				</a>
			</div>
		</div>
		<div class="navbar-inner" style="height:20px;">
			<g:render template="/_menu/breadcrumb"></g:render>
		</div>
	</div>
</header>
<br/><br/>