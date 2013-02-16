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
		<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

		<resource:autoComplete skin="default" />
		<r:require modules="scaffolding,jquery-ui"/>
		<r:require module="calendar" />

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<g:layoutHead/>
		<r:layoutResources/>
	</head>

	<body>
	
		<g:render template="/_menu/navbar"></g:render>
		<div class="container-fluid" style="margin-top: 35px;">
			<g:render template="/layouts/content_fluid"></g:render>

			<hr style="margin: 0px;padding: 0px;">

			<footer>
				<p>&copy; Company 2011</p>
			</footer>
		</div>

		<g:javascript library="application"/>
		<r:layoutResources/>

	</body>
</html>