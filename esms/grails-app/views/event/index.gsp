<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="bootstrap">
  <title>Calendar</title>
</head>
<body>
	
  <div id="calendar" style="margin:10px;"></div>
  
  <script>
  	$(document).ready(function() {
  		$('#calendar').fullCalendar('render');
  	});
  </script>
</body>
</html>