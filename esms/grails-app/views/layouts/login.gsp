<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title><g:layoutTitle default="${meta(name: 'app.name')}" /></title>
	<meta name="description" content="">
	<meta name="author" content="">
	
	<meta name="viewport" content="initial-scale = 1.0">
	
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="${resource(dir: 'bootstrap3', file: 'bootstrap.css')}" media="screen">
	<link rel="stylesheet" href="${resource(dir: 'bootstrap3/assets/css', file: 'bootswatch.min.css')}" media="screen">
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
	<g:layoutHead />
	<r:layoutResources />
</head>

<body class="login_page" style="">
	<g:layoutBody />
	<g:pageProperty name="page.body" />
	
</body>
</html>