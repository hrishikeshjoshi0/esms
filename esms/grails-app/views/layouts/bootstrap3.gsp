<%@ page
	import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes"%>
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
	<g:render template="/_menu/navbar3"></g:render>

	<!-- Container -->
	<div id="main" class="container">
		<div class="row">
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-body">
						<g:render template="/_common/message"></g:render>

						<!-- Body -->
						<g:layoutBody />
						<g:pageProperty name="page.body" />
					</div>
				</div>
			</div>

			<div class="col-md-2">
				<g:render template="/_menu/menubar3"></g:render>
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