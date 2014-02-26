
<div class="navbar navbar-default navbar-fixed-top">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-inverse-collapse">
			<span class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#"> 
			<img alt="DexBiz" src="${resource(dir: 'images', file: 'Dexbiz_Symbol_Small.png')}" style="height:22px;padding:0px;border-color: #333;"/>
		</a>
	</div>

	<div class="navbar-collapse collapse navbar-inverse-collapse">
		<ul class="nav navbar-nav">
			<g:set var="controllerName" value="${params.controller}" />
			<li <%= 'dashboard' == controllerName ? ' class="active"' : '' %>>
				<g:link controller="dashboard">
					  		Dashboard
					  	</g:link>
			</li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">CRM <b class="caret"></b></a>
				<ul class="dropdown-menu">
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
				</ul></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">Sales <b class="caret"></b></a>
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
				</ul></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">Invoicing <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li <%= 'invoice' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="invoice">
							  		Invoices
							  	</g:link>
					</li>
					<li <%= 'payment' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="invoice">
							  		Payments
							  	</g:link>
					</li>
				</ul></li>
			<li <%= 'product' == controllerName ? ' class="active"' : '' %>>
				<g:link controller="product">
					  		Products
					  	</g:link>
			</li>
			<li <%= 'event' == controllerName ? ' class="active"' : '' %>><g:link
					controller="event">
					  		Calendar
					  	</g:link></li>
			<%--<li <%= 'employee' == controllerName ? ' class="active"' : '' %>>
						<g:link controller="employee">
					  		HR
					  	</g:link>
					  </li>
					  --%>
			<li <%= 'report' == controllerName ? ' class="active"' : '' %>>
				<g:link controller="report">
					  		Reports
					  	</g:link>
			</li>

			<%--<li><a href="#">Link</a></li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Dropdown header</li>
                        <li><a href="#">Separated link</a></li>
                        <li><a href="#">One more separated link</a></li>
                      </ul>
                    </li>
                  	--%>
		</ul>

		<%--<form class="navbar-form navbar-left">
                    <input type="text" class="form-control col-lg-8" placeholder="Search">
                  </form>
                  --%>
		<div class="pull-right col-md-4">
			<div class="col-md-6">
				<g:render template="/_common/suggest"></g:render>
			</div>

			<ul class="nav navbar-nav navbar-right">
				<%--<li><a href="#">Link</a></li>
	                   --%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <span class="glyphicon glyphicon-user"></span>
						<b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><g:link controller="user" action='search'>
									Search User
								</g:link></li>
						<li><g:link controller="user" action='create'>
									Create User
								</g:link></li>
						<li class="divider"></li>
						<li><g:link controller="logout">
								 Sign out
								</g:link></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<!-- /.nav-collapse -->
</div>

<nav class="navbar navbar-default navbar-fixed-bottom" role="navigation">
  <div class="container">
  </div>
</nav>

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