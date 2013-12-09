<div class="pull-right">
	<a
		href="<g:createLink controller="docs" action="upload" params="['partyId':organizationInstance.id]" />"
		role="button" class="btn btn-default btn-sm">  Upload Document
	</a>
</div>

<!-- Contacts -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="name"
				title="${message(code: 'ufile.name.label', default: 'Name')}" />

			<g:sortableColumn property="size"
				title="${message(code: 'ufile.size.label', default: 'Size')}" />

			<g:sortableColumn property="dateUploaded"
				title="${message(code: 'address.dateUploaded.label', default: 'Date Uploaded')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.documents}" var="doc">
			<tr>
				<td>
					${fieldValue(bean: doc, field: "name")}
				</td>

				<td>
					${fieldValue(bean: doc, field: "size")}
				</td>
				
				<td>
					${fieldValue(bean: doc, field: "dateUploaded")}
				</td>

				<td class="link">
					<fileuploader:download 	id="${doc.id}"
						errorAction="index"
						errorController="docs">Download
					</fileuploader:download>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pgn">
	<bootstrap:paginate total="${organizationInstance?.addresses?.size()}" />
</div>

<!-- Modal -->
<div id="docsModal" class="modal hide fade" tabindex="-1" role="dialog" 
	data-remote="<g:createLink controller="organization" action="createDocument"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Document</h3>
	</div>
	<g:form controller="organization" action="createDocument" method="POST">
		<g:hiddenField name="party.id" value="${organizationInstance?.id}" />
		<div class="modal-body">
		</div>
		<div class="modal-footer">
			<div class="form-group">
				<button type="submit" class="btn btn-primary">
					
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>