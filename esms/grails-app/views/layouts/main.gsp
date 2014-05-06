<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>
			<g:layoutTitle default="BigDeals"/>
		</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<meta charset="UTF-8">
        <title>AdminLTE | Invoice</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'chosen.css')}" media="screen">
        <!-- bootstrap 3.0.2 -->
        <link href="${resource(dir: 'css/default', file: 'bootstrap.min.css')}" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${resource(dir: 'css/default', file: 'font-awesome.min.css')}" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="${resource(dir: 'css/default', file: 'ionicons.min.css')}" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="${resource(dir: 'css/default', file: 'AdminLTE.css')}" rel="stylesheet" type="text/css" />
        
        <filterpane:includes />
		<resource:dateChooser />
		<resource:autoComplete skin="esmsAutocomplete" />
		<resource:tabView />
		
		<script src="${resource(dir: 'js', file: 'jquery-1.7.1.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery-ui-1.8.18.custom.min.js')}"></script>
		<!-- ADD JQUERY PLUGINS BELOW THIS LINE -->
		
		<script type="text/javascript" src="${resource(dir: 'js', file: 'prettify.js')}"></script>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.slimscroll.js')}"></script>
		
		<script src="${resource(dir: 'bootstrap3/assets/js', file: 'bootswatch.js')}"></script>
		<script src="${resource(dir: 'js', file: 'chosen.jquery.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.expand.js')}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.growl.js')}"></script>
        
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body class="skin-blue">
		<!-- header logo: style can be found in header.less -->
		<g:render template="/layouts/default/header"></g:render>
		
		<div class="wrapper row-offcanvas row-offcanvas-left">
			<!-- header logo: style can be found in header.less -->
			<g:render template="/layouts/default/sidebar"></g:render>
			
			<!-- header logo: style can be found in header.less -->
			<g:render template="/layouts/default/content"></g:render>
		</div>
		
		<!-- Bootstrap -->
        <script src="${resource(dir: 'js', file: 'bootstrap.min.js')}" type="text/javascript"></script>
        <script src="${resource(dir: 'js/AdminLTE', file: 'app.js')}" type="text/javascript"></script>
        
		<link rel="stylesheet"
			href="${resource(dir: 'bootstrap3', file: 'esms.css')}" media="screen">
        <g:javascript library="application" />
		<r:layoutResources disposition="defer" />
	</body>
</html>
