<html>
<head>
<title>Documents</title>
<meta name="layout" content="bootstrap3" />
</head>
<body>
	<div class="row">
		<div class="page-header">
			<h3>Document Store</h3>
		</div>

		<div class="col-md-12">
			<div class="well">
				<fileuploader:form upload="docs" successAction="index"
					successController="docs" errorAction="index" errorController="docs" />
			</div>
		</div>

		<div class="col-md-12">
			<table class="table table-striped table-bordered mediaTable">
				<thead>
					<tr>
						<th>
							${message(code: 'ufile.name.label', default: 'Name')}
						</th>

						<th>
							${message(code: 'ufile.extension.label', default: 'Extension')}
						</th>

						<th>
							${message(code: 'ufile.dateUploaded.label', default: 'Date Uploaded')}
						</th>

						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each var="f" in="${files}">
						<tr>
							<td>
								${f.name}
							</td>
							<td>
								${f.extension}
							</td>
							<td><g:formatDate format="MM/dd/yyyy HH:mm"
									date="${f.dateUploaded}" /></td>
							<td><fileuploader:download id="${f.id}" errorAction="index"
									errorController="docs">Download</fileuploader:download></td>
						</tr>
					</g:each>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="4" class="link"><g:link controller="docs"
								action="index" class="lnk ">Show All &raquo;</g:link></th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>