<div class="nav-collapse">
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
					<g:render template="/_menu/admin"></g:render>
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
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<div class="pull-left">
		<%--Left-side entries--%>
	</div>

	<div class="pull-right">
		<%--Right-side entries--%>
		<%--NOTE: the following menus are in reverse order due to "pull-right" alignment (i.e., right to left)--%>
		<%--<g:render template="/_menu/language"/>														
					<g:render template="/_menu/config"/>
					<g:render template="/_menu/info"/>														
					<g:render template="/_menu/user"/><!-- NOTE: the renderDialog for the "Register" modal dialog MUST be placed outside the NavBar (at least for Bootstrap 2.1.1): see bottom of main.gsp -->
					<g:render template="/_menu/admin"/>
					--%>
		<%--														
					<g:render template="/_menu/search"/>
	  				--%>
	</div>

</div>
