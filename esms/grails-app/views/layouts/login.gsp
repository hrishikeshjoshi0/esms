<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes"%>
<!doctype html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="utf-8">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="initial-scale = 1.0">
	
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	  <script src="http://getbootstrap.com/assets/js/html5shiv.js"></script>
	  <script src="http://getbootstrap.com/assets/js/respond.min.js"></script>
	<![endif]-->
	
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${resource(dir: 'bootstrap3', file: 'bootstrap.css')}" media="screen">
	<link rel="stylesheet" href="${resource(dir: 'bootstrap3/assets/css', file: 'bootswatch.min.css')}" media="screen">
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
	<script type="text/javascript" src="${resource(dir: 'js/ie', file: 'respond.min.js')}"></script>
	<link rel="stylesheet" href="${resource(dir: 'bootstrap3', file: 'esms.css')}" media="screen">
	
	<script src="${resource(dir: 'js', file: 'jquery-1.7.1.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery-ui-1.8.18.custom.min.js')}"></script>
	<!-- ADD JQUERY PLUGINS BELOW THIS LINE -->
	
	<script src="${resource(dir: 'bootstrap3/bootstrap/dist/js', file: 'bootstrap.min.js')}"></script>
	<script src="${resource(dir: 'bootstrap3/assets/js', file: 'bootswatch.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.growl.js')}"></script>
	
	<!-- Favicons and the like (avoid using transparent .png) -->
	<link rel="shortcut icon" href="favicon.ico" />
	<link rel="apple-touch-glyphicon glyphicon-precomposed" href="icon.png" />
	<link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>

	<g:layoutHead />
	<r:layoutResources />
</head>

<body class="login_page">
	<g:layoutBody />
	<g:pageProperty name="page.body" />
	<!-- Footer -->
	<g:render template="/layouts/footer"></g:render>
</body>
</html>