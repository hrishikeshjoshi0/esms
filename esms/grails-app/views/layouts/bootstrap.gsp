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
	<link href="${resource(dir: 'lib/antiscroll', file: 'antiscroll.css')}" type="text/css" rel='stylesheet'>
	<g:layoutHead />
	<r:layoutResources />
</head>

<body>
	<div id="spinner" style="display: none">
		<img src="${resource(dir: 'img', file: 'ajax_loader.gif')}" alt="" />
	</div>
	
	<div class="style_switcher">
			<h2 class='style_switcher_header'>
				Notifications
			</h2>
			<hr/>
			<!-- Style Switcher Content -->
			<g:render template="/layouts/notification" />		
			
			<div class="hide">
				<ul id="ssw_styles">
					<li class="small ssw_mbColor sepH_a" style="display:none">body {<span class="ssw_mColor sepH_a" style="display:none"> color: #<span></span>;</span> <span class="ssw_bColor" style="display:none">background-color: #<span></span> </span>}</li>
					<li class="small ssw_lColor sepH_a" style="display:none">a { color: #<span></span> }</li>
				</ul>
			</div>
		</div>
	
	<div id="maincontainer" class="clearfix">
		
		<!-- header start-->
		<g:render template="/_menu/navbar"></g:render>
		<!-- header end-->
		
		<!-- main content start-->
		<div id="contentwrapper">
			<div class="main_content">
				<div id="container">
					<div class="row-fluid">
						<div class="span12">
							
							<g:if
								test="${	params.view != null
										&&	params.view != ''
										&&	params.view != 'index'
							}">
								<div class="row-fluid">
									<div class="span12">
										<g:render template="/_menu/submenubar" />
									</div>
								</div>
							</g:if>
							
							<!--Body content-->
							<!-- Secondary menu in one line (e.g., actions for current controller) -->
							<g:if test="${flash.message}">
								<div style="margin: 5px;">
									<bootstrap:alert class="alert-info">
										${flash.message}
									</bootstrap:alert>
								</div>
							</g:if>
							<div id="body_content">
								<br/>
								<g:layoutBody />
								<g:pageProperty name="page.body" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- sidebar -->
		<g:render template="/_menu/menubar"></g:render>	
		
		<script>
			$(document).ready(function() {
				//* show all elements & remove preloader
				setTimeout('$("html").removeClass("js")', 1000);
			});
		</script>
	</div>

	<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.debouncedresize.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.actual.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.cookie.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.mediaTable.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'chosen.jquery.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'lib/antiScroll', file: 'antiscroll.js')}" type="text/javascript"></script>
	<link href="${resource(dir: 'lib/antiscroll', file: 'antiscroll.css')}" type="text/css" rel='stylesheet'>
	
	<r:require module="calendar" />
	<g:javascript library="application" />
	<r:layoutResources />

</body>
</html>