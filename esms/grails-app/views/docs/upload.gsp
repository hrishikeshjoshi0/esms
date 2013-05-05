<%@ page import="com.esms.model.party.Party"%>
<html>
<head>
<title>Upload Document</title>
<meta name="layout" content="bootstrap" />
</head>
<body>
	<div class="page-header">
		<h1>
			<g:message code="default.upload.label" args="[entityName]" default="Upload Document"/>
		</h1>
	</div>
	
	<div class="row-fluid">
		<div class="span12">
			<fieldset>
				<fileuploader:form upload="docs" successAction="createDocument" partyId="${params.partyId}" 
						successController="docs" errorAction="index" errorController="docs" />
			</fieldset>		
		</div>
	</div>
</body>
</html>