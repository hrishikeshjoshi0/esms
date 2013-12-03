<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
	<resource:calendarMonthView />
	<meta name="layout" content="bootstrap3">
	<title>Calendar</title>
</head>
<body>

	<div>
		<richui:calendarMonthView items="${eventList}" createLink="true"
			constraintDateFields="['startTime-endTime', 'startTime', 'endTime']"
			displayField="title" teaser="true" teaserLength="20"
			weekOfYear="true" weekAction="week" dayAction="day" month="${month}"
			action="show" />
	</div>

</body>
</html>