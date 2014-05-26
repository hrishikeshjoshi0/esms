<!-- header logo: style can be found in header.less -->
<header class="header">
	<!-- Add the class icon to your logo image or logo icon to add the margining -->
	<g:link controller="dashboard" class="logo">
		Big Deals!
	</g:link>
	
	
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
			role="button"> <span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>
		
		<div class="col-md-6">
			<g:render template="/_common/suggest"></g:render>
		</div>
		
		<div class="navbar-right">
			<ul class="nav navbar-nav">
				<li class="dropdown notifications-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
						<i class="fa fa-plus"></i>
					</a>
					<ul class="dropdown-menu">
						<li class="header">Quick Add</li>
						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu">
								<li>
									<g:link controller="lead" action="create"> 
										<i class="ion ion-ios7-people info"></i>
										Lead
									</g:link>
								</li>
								
								<li>
									<g:link controller="lead" action="create"> 
										<i class="ion ion-ios7-people info"></i>
										Customers
									</g:link>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				
				
				<!-- Messages: style can be found in dropdown.less-->
				<!-- Notifications: style can be found in dropdown.less -->
				<%--<li class="dropdown notifications-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-warning"></i> <span class="label label-warning">10</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 10 notifications</li>
						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu">
								<li><a href="#"> <i class="ion ion-ios7-people info"></i>
										5 new members joined today
								</a></li>
								<li><a href="#"> <i class="fa fa-warning danger"></i>
										Very long description here that may not fit into the page and
										may cause design problems
								</a></li>
								<li><a href="#"> <i class="fa fa-users warning"></i> 5
										new members joined
								</a></li>

								<li><a href="#"> <i class="ion ion-ios7-cart success"></i>
										25 sales made
								</a></li>
								<li><a href="#"> <i class="ion ion-ios7-person danger"></i>
										You changed your username
								</a></li>
							</ul>
						</li>
						<li class="footer"><a href="#">View all</a></li>
					</ul></li>
					--%>
					
					<!-- Tasks: style can be found in dropdown.less -->
				<%--
				<li class="dropdown tasks-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="fa fa-tasks"></i> <span class="label label-danger">9</span>
				</a>
					<ul class="dropdown-menu">
						<li class="header">You have 9 tasks</li>
						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu">
								<li>
									<!-- Task item --> <a href="#">
										<h3>
											Design some buttons <small class="pull-right">20%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-aqua"
												style="width: 20%" role="progressbar" aria-valuenow="20"
												aria-valuemin="0" aria-valuemax="100">
												<span class="sr-only">20% Complete</span>
											</div>
										</div>
								</a>
								</li>
								<!-- end task item -->
								<li>
									<!-- Task item --> <a href="#">
										<h3>
											Create a nice theme <small class="pull-right">40%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-green"
												style="width: 40%" role="progressbar" aria-valuenow="20"
												aria-valuemin="0" aria-valuemax="100">
												<span class="sr-only">40% Complete</span>
											</div>
										</div>
								</a>
								</li>
								<!-- end task item -->
								<li>
									<!-- Task item --> <a href="#">
										<h3>
											Some task I need to do <small class="pull-right">60%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-red" style="width: 60%"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
								</a>
								</li>
								<!-- end task item -->
								<li>
									<!-- Task item --> <a href="#">
										<h3>
											Make beautiful transitions <small class="pull-right">80%</small>
										</h3>
										<div class="progress xs">
											<div class="progress-bar progress-bar-yellow"
												style="width: 80%" role="progressbar" aria-valuenow="20"
												aria-valuemin="0" aria-valuemax="100">
												<span class="sr-only">80% Complete</span>
											</div>
										</div>
								</a>
								</li>
								<!-- end task item -->
							</ul>
						</li>
						<li class="footer"><a href="#">View all tasks</a></li>
					</ul>
				</li>
				--%>
				
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu">
					<a href="#"
						class="dropdown-toggle" data-toggle="dropdown"> 
							<i class="glyphicon glyphicon-user"></i> <span>
							<sec:username/> <i class="caret"></i></span>
					</a>
				
					<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header bg-light-blue">
								<img src="${resource(dir: 'img', file: 'avatar3.png')}" class="img-circle"
													alt="User Image" />
								<p>
									<sec:username/>
								</p>
							</li>
							<!-- Menu Body -->
							<li class="user-body">
								<div class="col-xs-6 text-center">
									<g:link controller="user" action='search'>
										Search Users
									</g:link>
								</div>
								<div class="col-xs-6 text-center">
									<g:link controller="user" action='create'>
										Create New User
									</g:link>
								</div>
							</li>
							<li class="divider"></li>
							<li><g:link controller="logout">
									 Sign out
									</g:link></li>
						</ul>
					</li>
			</ul>
		</div>
	</nav>
</header>