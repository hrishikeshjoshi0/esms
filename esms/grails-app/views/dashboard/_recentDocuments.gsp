<%@ page import="com.lucastex.grails.fileuploader.UFile"%>

<div class="heading clearfix">
	<h3 class="pull-left">Recent Uploaded Documents</h3>
	<span class="pull-right label label-important"> ${recentDocuments?.size()}
		Documents
	</span>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<g:sortableColumn property="name"
				title="${message(code: 'ufile.name.label', default: 'Name')}" />

			<g:sortableColumn property="extension"
				title="${message(code: 'ufile.extension.label', default: 'Extension')}" />

			<g:sortableColumn property="dateUploaded"
				title="${message(code: 'ufile.dateUploaded.label', default: 'Date Uploaded')}" />

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