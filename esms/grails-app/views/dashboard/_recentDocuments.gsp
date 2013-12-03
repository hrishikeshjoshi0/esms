<%@ page import="com.lucastex.grails.fileuploader.UFile"%>

<div class="dashboard-widget-header">
	<h3>Recent Uploaded Documents</h3>
</div>

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
		<g:each var="f" in="${recentDocuments}">
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
</table>