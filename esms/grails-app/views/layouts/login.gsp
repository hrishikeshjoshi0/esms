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
	
	<r:require modules="scaffolding,jquery-ui" />
	<r:require module="calendar" />
	<r:require module="chosen" />
	<r:require module="gebo" />
	
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
	<g:layoutHead />
	<r:layoutResources />
</head>

<body class="login_page" style="">
	<g:layoutBody />
	<g:pageProperty name="page.body" />
	
	<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.debouncedresize.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.actual.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.cookie.min.js')}"></script>
	<script src="${resource(dir: 'bootstrap/js', file: 'bootstrap.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.mediaTable.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'chosen.jquery.min.js')}" type="text/javascript"></script>
	<g:javascript library="application" />
	<r:layoutResources />

</body>
</html>