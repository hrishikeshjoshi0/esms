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

		<r:require modules="scaffolding,jquery-ui"/>
		<r:require module="calendar" />
		<r:require module="chosen" />

		<!-- Le fav and touch icons -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<g:layoutHead/>
		<r:layoutResources/>
		<style>
			#wrapper {
				width: 96%;
				height: 100%;
				margin: 0 auto;
				text-align: left;
				background-color: #fff;
				-moz-box-shadow: 3px 3px 3px 3px #222;
				-webkit-box-shadow: 3px 3px 3px 3px #222;
				box-shadow: 3px 3px 3px 3px #222;
			}
			
			#outer-wrapper {
				width: 100%;
				height: 100%;
				background-color: #666;
			}
		</style>
</head>

	<body>
		<div id="outer-wrapper">
		<div id="wrapper">
		<g:render template="/_menu/navbar"></g:render>
		<div class="container-fluid" style="margin-top:0px;z-index: -999;">
			
			<g:render template="/layouts/content_fluid"></g:render>

			<hr style="margin: 0px;padding: 0px;">

			<footer>
				<p>&copy; VENUS CRM</p>
			</footer>
		</div>
		</div>
		</div>

		
		<g:javascript library="application"/>
		<script src="chosen/chosen.jquery.js" type="text/javascript"></script>
		<r:layoutResources/>

	</body>
</html>