<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${resource(dir: 'bootstrap3', file: 'bootstrap.css')}" media="screen">
	<link rel="stylesheet" href="${resource(dir: 'bootstrap3/assets/css', file: 'bootswatch.min.css')}" media="screen">
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	  <script src="http://getbootstrap.com/assets/js/html5shiv.js"></script>
	  <script src="http://getbootstrap.com/assets/js/respond.min.js"></script>
	<![endif]-->
	
	<filterpane:includes/>
	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
	<resource:dateChooser />
	<resource:tabView/>
	
	<link rel="stylesheet" href="${resource(dir: 'bootstrap3', file: 'esms.css')}" media="screen">
	
	<script src="${resource(dir: 'js', file: 'jquery-1.7.1.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery-ui-1.8.18.custom.min.js')}"></script>
	
	<script src="${resource(dir: 'bootstrap3/bootstrap/dist/js', file: 'bootstrap.min.js')}"></script>
	<script src="${resource(dir: 'bootstrap3/assets/js', file: 'bootswatch.js')}"></script>
	
	
	<g:layoutHead />
</head>
<body>
	<!-- NavBar -->
	<g:render template="/_menu/navbar3"></g:render>

	<!-- Container -->
	<div class="container">
		<div class="row">
			<div class="col-md-9">
				<div id="breadcrumb">
					<g:render template="/_menu/breadcrumb"></g:render>
				</div>
				
				<!-- Body -->		
				<g:layoutBody />
				<g:pageProperty name="page.body" />
			</div>
			
			<div class="col-md-3">
				<g:render template="/_menu/menubar3"></g:render>
			</div>
		</div>	
		
		<!-- Footer -->
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						Morya Solutions 
					</div>
				</div>
			</div>
		</footer>
	</div>
	<!-- Container Ends -->
	
	<g:javascript library="application" />
	<modalbox:modalIncludes />
	<r:layoutResources disposition="defer"/>
</body>
</html>