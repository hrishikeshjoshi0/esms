<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<meta name="layout" content="bootstrap3">
	
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'fullcalendar.css')}" media="screen">
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'calendar.css')}" media="screen">
	
	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-ui-timepicker-addon.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.qtip.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'fullcalendar.min.js')}"></script>
	<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrapx-clickover.js')}"></script>
	
	<title>Calendar</title>
</head>
<body>
	
	<div class="row">
		<div class="col-md-12">
			<div id="calendar" style="">
			</div>
		</div>
	</div>	
</body>
</html>