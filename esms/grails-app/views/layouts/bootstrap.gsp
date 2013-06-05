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

<body>
	<div id="spinner" style="display: none">
		<img src="${resource(dir: 'img', file: 'ajax_loader.gif')}" alt="" />
	</div>
	
	<div class="style_switcher">
			<div class="sepH_c">
				<p>Colors:</p>
				<div class="clearfix">
					<a href="javascript:void(0)" class="style_item jQclr blue_theme style_active" title="blue">blue</a>
					<a href="javascript:void(0)" class="style_item jQclr dark_theme" title="dark">dark</a>
					<a href="javascript:void(0)" class="style_item jQclr green_theme" title="green">green</a>
					<a href="javascript:void(0)" class="style_item jQclr brown_theme" title="brown">brown</a>
					<a href="javascript:void(0)" class="style_item jQclr eastern_blue_theme" title="eastern_blue">eastern blue</a>
					<a href="javascript:void(0)" class="style_item jQclr tamarillo_theme" title="tamarillo">tamarillo</a>
				</div>
			</div>
			<div class="sepH_c">
				<p>Backgrounds:</p>
				<div class="clearfix">
					<span class="style_item jQptrn style_active ptrn_def" title=""></span>
					<span class="ssw_ptrn_a style_item jQptrn" title="ptrn_a"></span>
					<span class="ssw_ptrn_b style_item jQptrn" title="ptrn_b"></span>
					<span class="ssw_ptrn_c style_item jQptrn" title="ptrn_c"></span>
					<span class="ssw_ptrn_d style_item jQptrn" title="ptrn_d"></span>
					<span class="ssw_ptrn_e style_item jQptrn" title="ptrn_e"></span>
				</div>
			</div>
			<div class="sepH_c">
				<p>Layout:</p>
				<div class="clearfix">
					<label class="radio inline"><input type="radio" name="ssw_layout" id="ssw_layout_fluid" value="" checked /> Fluid</label>
					<label class="radio inline"><input type="radio" name="ssw_layout" id="ssw_layout_fixed" value="gebo-fixed" /> Fixed</label>
				</div>
			</div>
			<div class="sepH_c">
				<p>Sidebar position:</p>
				<div class="clearfix">
					<label class="radio inline"><input type="radio" name="ssw_sidebar" id="ssw_sidebar_left" value="" checked /> Left</label>
					<label class="radio inline"><input type="radio" name="ssw_sidebar" id="ssw_sidebar_right" value="sidebar_right" /> Right</label>
				</div>
			</div>
			<div class="sepH_c">
				<p>Show top menu on:</p>
				<div class="clearfix">
					<label class="radio inline"><input type="radio" name="ssw_menu" id="ssw_menu_click" value="" checked /> Click</label>
					<label class="radio inline"><input type="radio" name="ssw_menu" id="ssw_menu_hover" value="menu_hover" /> Hover</label>
				</div>
			</div>
			
			<div class="gh_button-group">
				<a href="#" id="showCss" class="btn btn-primary btn-mini">Show CSS</a>
				<a href="#" id="resetDefault" class="btn btn-mini">Reset</a>
			</div>
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

	<%--<div id="outer-wrapper">
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
		--%>

	<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.debouncedresize.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.actual.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.cookie.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'jquery.mediaTable.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'chosen.jquery.min.js')}" type="text/javascript"></script>
	<r:require module="calendar" />
	<g:javascript library="application" />
	<r:layoutResources />

</body>
</html>