<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title><g:layoutTitle default="${meta(name: 'app.name')}"/></title>
		<meta name="description" content="">
		<meta name="author" content="">

		<meta name="viewport" content="initial-scale = 1.0">

		<!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<resource:autoComplete skin="default" />
		<r:require modules="scaffolding,jquery-ui"/>

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<g:layoutHead/>
		<r:layoutResources/>
	</head>

	<body>

		<nav class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					
					<a class="brand" href="${createLink(uri: '/')}">
						ESMS
					</a>

					<div class="nav-collapse">
						<ul class="nav">							
							<li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Home</a></li>
							<li
									<%= 'organization' == controllerName ? ' class="active"' : '' %>>
									<g:link
										controller="organization">
										Organization
									</g:link>
							</li>
							<%--<li
									<%= 'contact' == controllerName ? ' class="active"' : '' %>>
									<g:link
										controller="contact">
										Contact
									</g:link>
							</li>
							--%>
							<li
									<%= 'product' == controllerName ? ' class="active"' : '' %>>
									<g:link
										controller="product">
										Product
									</g:link>
							</li>
							<li
									<%= 'quote' == controllerName ? ' class="active"' : '' %>>
									<g:link
										controller="quote">
										Quote
									</g:link>
							</li>
							<%--<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
								<li
									<%= c.logicalPropertyName == controllerName ? ' class="active"' : '' %>>
									<g:link
										controller="${c.logicalPropertyName}">
										${c.naturalName}
									</g:link>
								</li>
							</g:each>
						--%></ul>
					</div>
				</div>
			</div>
		</nav>
		
		<div class="container-fluid" style="margin-top: 20px;">
			<g:render template="/layouts/content_fluid"></g:render>

			<hr style="margin: 0px;padding: 0px;">

			<footer>
				<p>&copy; Company 2011</p>
			</footer>
		</div>

		<r:layoutResources/>

	</body>
</html>