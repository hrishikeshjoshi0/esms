<header>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="brand" href="${createLink(uri: '/')}">
					<img src="${resource(dir: 'images', file: 'venus_crm_logo.png')}" alt="${meta(name:'app.name')}" style="width:180px;"/> <br/>
				</a>
				
						<ul class="nav">
							<li class="dropdown">
								<a data-toggle="dropdown" class="dropdown-toggle" href="#">
									<i class="icon-star icon-white"></i> <b class="caret"></b>
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
					
					<li>
						<a> | </a>
					</li>
					
					<!-- User -->
					<li>
						<a href="#">
							Logged In Since :
							<g:formatDate date="${session.lastLoginDate}" format="yyyy-MM-dd" type="datetime" style="SHORT"/>
						</a>
					</li>
					
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
	</div>
	<div class="modal hide fade" id="myMail">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3>New messages</h3>
		</div>
		<div class="modal-body">
			<div class="alert alert-info">In this table jquery plugin turns
				a table row into a clickable link.</div>
			<table class="table table-condensed table-striped" data-rowlink="a">
				<thead>
					<tr>
						<th>Sender</th>
						<th>Subject</th>
						<th>Date</th>
						<th>Size</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Declan Pamphlett</td>
						<td><a href="javascript:void(0)">Lorem ipsum dolor sit
								amet</a></td>
						<td>23/05/2012</td>
						<td>25KB</td>
					</tr>
					<tr>
						<td>Erin Church</td>
						<td><a href="javascript:void(0)">Lorem ipsum dolor sit
								amet</a></td>
						<td>24/05/2012</td>
						<td>15KB</td>
					</tr>
					<tr>
						<td>Koby Auld</td>
						<td><a href="javascript:void(0)">Lorem ipsum dolor sit
								amet</a></td>
						<td>25/05/2012</td>
						<td>28KB</td>
					</tr>
					<tr>
						<td>Anthony Pound</td>
						<td><a href="javascript:void(0)">Lorem ipsum dolor sit
								amet</a></td>
						<td>25/05/2012</td>
						<td>33KB</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
			<a href="javascript:void(0)" class="btn">Go to mailbox</a>
		</div>
	</div>
	<div class="modal hide fade" id="myTasks">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3>New Tasks</h3>
		</div>
		<div class="modal-body">
			<div class="alert alert-info">In this table jquery plugin turns
				a table row into a clickable link.</div>
			<table class="table table-condensed table-striped" data-rowlink="a">
				<thead>
					<tr>
						<th>id</th>
						<th>Summary</th>
						<th>Updated</th>
						<th>Priority</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>P-23</td>
						<td><a href="javascript:void(0)">Admin should not break
								if URL&hellip;</a></td>
						<td>23/05/2012</td>
						<td class="tac"><span class="label label-important">High</span></td>
						<td>Open</td>
					</tr>
					<tr>
						<td>P-18</td>
						<td><a href="javascript:void(0)">Displaying submenus in
								custom&hellip;</a></td>
						<td>22/05/2012</td>
						<td class="tac"><span class="label label-warning">Medium</span></td>
						<td>Reopen</td>
					</tr>
					<tr>
						<td>P-25</td>
						<td><a href="javascript:void(0)">Featured image on post
								types&hellip;</a></td>
						<td>22/05/2012</td>
						<td class="tac"><span class="label label-success">Low</span></td>
						<td>Updated</td>
					</tr>
					<tr>
						<td>P-10</td>
						<td><a href="javascript:void(0)">Multiple feed fixes
								and&hellip;</a></td>
						<td>17/05/2012</td>
						<td class="tac"><span class="label label-warning">Medium</span></td>
						<td>Open</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
			<a href="javascript:void(0)" class="btn">Go to task manager</a>
		</div>
	</div>
</header>
<%--<div class="nav-collapse">
	<nav class="navbar navbar-inverse" style="background-color:#336699;">
		<div class="navbar-inner">
			<div class="container-fluid" style="border-bottom:0px dotted #efefef;">
				<div class="pull-left">
					<a href="${createLink(uri: '/')}">
						<img src="${resource(dir: 'images', file: 'logo1.png')}" alt="${meta(name:'app.name')}" style="width:180px;"/>
					</a>
				</div>
				
				<div class="pull-right">
					<g:render template="/_menu/config"></g:render>
					
					<g:render template="/_menu/user"></g:render>
				</div>
			</div>
			
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>

				<div class="nav-collapse">
					<ul class="nav">
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
						<!-- 
						<li <%= 'dashboard' == controllerName ? ' class="active"' : '' %>>
							<g:link controller="dashboard">
										Dashboard
							</g:link>
						</li>
						 -->
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<div class="pull-left">
		Left-side entries
	</div>

	<div class="pull-right">
		Right-side entries
		NOTE: the following menus are in reverse order due to "pull-right" alignment (i.e., right to left)
		<g:render template="/_menu/language"/>														
					<g:render template="/_menu/config"/>
					<g:render template="/_menu/info"/>														
					<g:render template="/_menu/user"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
					<g:render template="/_menu/admin"/>
					
																
					<g:render template="/_menu/search"/>
	  				
	</div>

</div>
--%>