<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="BigDeals" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<meta charset="UTF-8">
<title></title>
<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'chosen.css')}" media="screen">
<link href="${resource(dir: 'css', file: 'bootstrap.css')}" rel="stylesheet" />
<link href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" rel="stylesheet" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet" />
<link href="${resource(dir: 'css', file: 'font-awesome.css')}" rel="stylesheet" />
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="${resource(dir: 'css', file: 'font-awesome.css')}" rel="stylesheet" />
<link href="${resource(dir: 'css', file: 'style.css')}" rel="stylesheet" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	    <![endif]-->
<filterpane:includes />
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
	src="${resource(dir: 'bootstrap3/assets/js', file: 'bootswatch.js')}"></script>
<script src="${resource(dir: 'js', file: 'chosen.jquery.min.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.expand.js')}"></script>
<script src="${resource(dir: 'js', file: 'jquery.growl.js')}"></script>

<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<!-- header logo: style can be found in header.less -->
	<g:render template="/layouts/default/header"></g:render>

	<div class="main">
		<div class="main-inner">
			<div class="container content">
				<div class="row">
					<div class="col-md-3">
						<aside class="left-side sidebar-offcanvas">
							<g:render template="/layouts/default/sidebar"></g:render>
						</aside>
					</div>

					<div class="col-md-9 right-side">
						<g:render template="/layouts/default/content"></g:render>
						<!-- /widget-content -->
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /main-inner -->
	</div>
	
	<div class="footer">
        <div class="footer-inner">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        &copy; 2013 <a href="http://www.dexbiz.com/">Dexbiz Solutions</a>.
                    </div>
                    <!-- /span12 -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /footer-inner -->
    </div>

	<!-- Bootstrap -->
	<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}" type="text/javascript"></script>
	<script src="${resource(dir: 'js', file: 'excanvas.min.js')}"></script>
	<script src="${resource(dir: 'js', file: 'base.js')}"></script>

	<script>
		$(document).ready(function($) {
			var sidebarHeight = $(".sidebar>#accordian").height();
			var bodyHeight = ($(".main").height());

			if (bodyHeight > sidebarHeight) {
				$(".sidebar>#accordian").css('min-height', bodyHeight + 85);
			}
			;

			$("#accordian h3").click(function() {
				//slide up all the link lists
				$("#accordian ul ul").slideUp();
				//slide down the link list below the h3 clicked - only if its closed
				if (!$(this).next().is(":visible")) {
					$(this).next().slideDown();
				}
			})
		});
	</script>
	<g:javascript library="application" />
	<r:layoutResources disposition="defer" />
</body>
</html>
