<%@ page
	import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes"%>
<%@ page import="org.codehaus.groovy.grails.plugins.PluginManagerHolder"%>
<%@ page import="grails.plugin.springsecurity.SpringSecurityUtils"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'chosen.css')}" media="screen">
<link rel="stylesheet"
	href="${resource(dir: 'bootstrap3', file: 'bootstrap.css')}"
	media="screen">
<link rel="stylesheet"
	href="${resource(dir: 'bootstrap3/assets/css', file: 'bootswatch.min.css')}"
	media="screen">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	  <script src="http://getbootstrap.com/assets/js/html5shiv.js"></script>
	  <script src="http://getbootstrap.com/assets/js/respond.min.js"></script>
	<![endif]-->

<filterpane:includes />
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<resource:dateChooser />
<resource:autoComplete skin="esmsAutocomplete" />
<resource:tabView />

<script src="${resource(dir: 'js', file: 'jquery-1.7.1.min.js')}"></script>
<script
	src="${resource(dir: 'js', file: 'jquery-ui-1.8.18.custom.min.js')}"></script>
<!-- ADD JQUERY PLUGINS BELOW THIS LINE -->

<script type="text/javascript"
	src="${resource(dir: 'js', file: 'prettify.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js', file: 'jquery.slimscroll.js')}"></script>

<script
	src="${resource(dir: 'bootstrap3/bootstrap/dist/js', file: 'bootstrap.min.js')}"></script>
<script
	src="${resource(dir: 'bootstrap3/assets/js', file: 'bootswatch.js')}"></script>
<script src="${resource(dir: 'js', file: 'chosen.jquery.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.expand.js')}"></script>
<script type="text/javascript"
	src="${resource(dir: 'js/ie', file: 'respond.min.js')}"></script>

<title><g:layoutTitle default="${appName}" /></title>
<g:layoutHead />
</head>
<body>
	<!-- NavBar -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button class="navbar-toggle" type="button" data-toggle="collapse"
					data-target="#navbar-main">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse" id="navbar-main">
				<!-- Navigation Menus -->
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
							<g:message code="spring.security.ui.menu.users" /> <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li>
								<g:link controller="user" action='search'>
									<g:message code="spring.security.ui.search" />
								</g:link>
							</li>
							<li>
								<g:link controller="user" action='create'>
									<g:message code="spring.security.ui.create" />
								</g:link>
							</li>
						</ul>
					</li>
					
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
							<g:message code="spring.security.ui.menu.roles" /> <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li>
								<g:link controller="role" action='search'>
									<g:message code="spring.security.ui.search" />
								</g:link>
							</li>
							<li>
								<g:link controller="role" action='create'>
									<g:message code="spring.security.ui.create" />
								</g:link>
							</li>
						</ul>
					</li>
					
					<g:if
						test='${SpringSecurityUtils.securityConfig.securityConfigType?.toString() == 'Requestmap'}'>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
								<g:message code="spring.security.ui.menu.requestmaps" /> <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li>
									<g:link controller="requestmap" action='search'>
										<g:message code="spring.security.ui.search" />
									</g:link>
								</li>
								<li>
									<g:link controller="requestmap" action='create'>
										<g:message code="spring.security.ui.create" />
									</g:link>
								</li>
							</ul>
						</li>
					</g:if>
					
					<g:if
						test='${SpringSecurityUtils.securityConfig.rememberMe.persistent}'>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
								<g:message
									code="spring.security.ui.menu.persistentLogins" /> <b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><g:link controller="persistentLogin" action='search'>
										<g:message code="spring.security.ui.search" />
									</g:link></li>
							</ul>
						</li>
					</g:if>
					
					<%--<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
							<g:message code="spring.security.ui.menu.registrationCode" /> <b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li>
								<g:link controller="registrationCode" action='search'>
									<g:message code="spring.security.ui.search" />
								</g:link>
							</li>
						</ul>
					</li>
					
					<g:if
						test="${PluginManagerHolder.pluginManager.hasGrailsPlugin('springSecurityAcl')}">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message
									code="spring.security.ui.menu.acl" /> <b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><g:message code="spring.security.ui.menu.aclClass" />
									&raquo;
									<ul>
										<li><g:link controller="aclClass" action='search'>
												<g:message code="spring.security.ui.search" />
											</g:link></li>
										<li><g:link controller="aclClass" action='create'>
												<g:message code="spring.security.ui.create" />
											</g:link></li>
									</ul></li>
								<li><g:message code="spring.security.ui.menu.aclSid" />
									&raquo;
									<ul>
										<li><g:link controller="aclSid" action='search'>
												<g:message code="spring.security.ui.search" />
											</g:link></li>
										<li><g:link controller="aclSid" action='create'>
												<g:message code="spring.security.ui.create" />
											</g:link></li>
									</ul></li>
								<li><g:message
										code="spring.security.ui.menu.aclObjectIdentity" /> &raquo;
									<ul>
										<li><g:link controller="aclObjectIdentity" action='search'>
												<g:message code="spring.security.ui.search" />
											</g:link></li>
										<li><g:link controller="aclObjectIdentity" action='create'>
												<g:message code="spring.security.ui.create" />
											</g:link></li>
									</ul></li>
								<li><g:message code="spring.security.ui.menu.aclEntry" />
									&raquo;
									<ul>
										<li><g:link controller="aclEntry" action='search'>
												<g:message code="spring.security.ui.search" />
											</g:link></li>
										<li><g:link controller="aclEntry" action='create'>
												<g:message code="spring.security.ui.create" />
											</g:link></li>
									</ul></li>
							</ul></li>
					</g:if>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message
								code="spring.security.ui.menu.appinfo" /> <b class="caret"></b> </a>
						<ul class="dropdown-menu">
							<li><g:link action='config' controller='securityInfo'>
									<g:message code='spring.security.ui.menu.appinfo.config' />
								</g:link></li>
							<li><g:link action='mappings' controller='securityInfo'>
									<g:message code='spring.security.ui.menu.appinfo.mappings' />
								</g:link></li>
							<li><g:link action='currentAuth' controller='securityInfo'>
									<g:message code='spring.security.ui.menu.appinfo.auth' />
								</g:link></li>
							<li><g:link action='usercache' controller='securityInfo'>
									<g:message code='spring.security.ui.menu.appinfo.usercache' />
								</g:link></li>
							<li><g:link action='filterChain' controller='securityInfo'>
									<g:message code='spring.security.ui.menu.appinfo.filters' />
								</g:link></li>
							<li><g:link action='logoutHandler' controller='securityInfo'>
									<g:message code='spring.security.ui.menu.appinfo.logout' />
								</g:link></li>
							<li><g:link action='voters' controller='securityInfo'>
									<g:message code='spring.security.ui.menu.appinfo.voters' />
								</g:link></li>
							<li><g:link action='providers' controller='securityInfo'>
									<g:message code='spring.security.ui.menu.appinfo.providers' />
								</g:link></li>
						</ul></li>	
				--%></ul>
			</div>
		</div>
	</div>
	<!-- Navbar -->

	<!-- Container -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<g:render template="/_common/message"></g:render>

						<!-- Body -->
						<g:layoutBody />
						<g:pageProperty name="page.body" />
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<g:render template="/layouts/footer"></g:render>

	</div>
	<!-- Container Ends -->

	<g:javascript library="application" />
	<link rel="stylesheet"
		href="${resource(dir: 'bootstrap3', file: 'esms.css')}" media="screen">
	<r:layoutResources disposition="defer" />
</body>
</html>