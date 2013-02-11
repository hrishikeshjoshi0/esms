<div id="Navbar" class="navbar navbar-fixed-top navbar-inverse">
	<div class="navbar-inner">
		<div class="container">
			<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="${createLink(uri: '/')}"> <%--<img class="logo" src="${resource(dir:'kickstart/img',file:'grails.png')}" alt="${meta(name:'app.name')}" />
				--%> <%--${meta(name:'app.name')}
				--%> Venus
			</a>

			<div class="nav-collapse">
				<nav class="navbar navbar-inverse navbar-fixed-top">
					<div class="navbar-inner">
						<div class="container-fluid">

							<a class="btn btn-navbar" data-toggle="collapse"
								data-target=".nav-collapse"> <span class="icon-bar"></span>
								<span class="icon-bar"></span> <span class="icon-bar"></span>
							</a> 
							<a class="brand" href="${createLink(uri: '/')}"> 
								 VENUS
							</a>

							<div class="nav-collapse">
								<ul class="nav">
									<li
										<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>>
										<a href="${createLink(uri: '/')}">
											<i class="icon-home icon-white"></i>
											Home
										</a>
									</li>
									<li <%= 'contact' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="contract">
										Contracts
									</g:link>
									</li>
									<li
										<%= 'organization' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="organization">
										Organizations
									</g:link>
									</li>
									<li <%= 'contact' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="contact">
										Contacts
									</g:link>
									</li>
									<li <%= 'product' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="product">
										Product
									</g:link>
									</li>
									<li
										<%= 'quote' == controllerName ? ' class="active " ' : ' ' %>>
										<ul class="nav">
											<li class="dropdown"><g:link controller="quote"
													action="list" class="dropdown-toggle"
													data-toggle="dropdown">  
									          Quote  
									          <b class="caret"></b>
												</g:link>
												<ul class="dropdown-menu">
													<li><g:link controller="quote" action="list">
									     			Quotes
									     		</g:link></li>
													<li><g:link controller="quote" action="create"
															params="[contractQuote:true]">
									     			Contract Quote
									     		</g:link></li>
													<li><g:link controller="quote" action="create">
									     			Repair Quote
									     		</g:link></li>
												</ul></li>
										</ul>
									</li>
									<li <%= 'order' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="order">
										Order
									</g:link>
									</li>
									<li
										<%= 'activity' == controllerName ? ' class="active"' : '' %>>
										<g:link controller="event">
										Calendar
									</g:link>
									</li>
									<%--<g:each var="c"
										in="${grailsApplication.controllerClasses.sort { it.fullName } }">
										<li
											<%= c.logicalPropertyName == controllerName ? ' class="active"' : '' %>>
											<g:link controller="${c.logicalPropertyName}">
												${c.naturalName}
											</g:link>
										</li>
									</g:each>
								--%>
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

		</div>
	</div>
</div>
