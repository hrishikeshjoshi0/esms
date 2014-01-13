<%@ page import="org.grails.plugins.google.visualization.data.Cell; org.grails.plugins.google.visualization.util.DateUtil" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap" />
<title>DexCRM</title>
<gvisualization:apiImport />
</head>
<body>
	<div class="container">
		<gvisualization:pieCoreChart elementId="piechart"
			title="My Daily Activities" width="${900}" height="${900}"
			columns="${resultColumns}" data="${resultData}" />
	   
	   <h2>Quotes By Status</h2>
	   		
       <div class="row">
       		<div class="col-md-4">
				<div id="piechart"></div>	
       		</div>
       		<div class="col-md-4">
				<div id="piechart"></div>	       		
       		</div>
       		<div class="col-md-4">
       			<div id="piechart"></div>
       		</div>
       </div>
       
	</div>
</body>
</html>
