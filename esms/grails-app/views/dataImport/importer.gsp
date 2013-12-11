<html>
<head>
<title>Upload Document</title>
<meta name="layout" content="bootstrap3" />
</head>
<body>
	<div class="page-header">
		<h3>
			<g:message code="default.upload.label" args="[entityName]"
				default="Upload Document" />
		</h3>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="well">
				<fieldset>
					<fileuploader:form upload="importer" successAction="importData" successController="dataImport" />
				</fieldset>
			</div>
		</div>
	</div>
</body>
</html>