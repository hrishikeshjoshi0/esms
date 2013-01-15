<div class="pull-right">
	<a data-toggle="modal" href="#" data-target="#contactModal" role="button" class="btn"> 
		<i class="icon-plus"></i> New Contact
	</a>
</div>

<!-- Contacts -->
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<g:sortableColumn property="externalId"
				title="${message(code: 'contact.externalId.label', default: 'External Id')}" />
			<g:sortableColumn property="firstName"
				title="${message(code: 'contact.firstName.label', default: 'First Name')}" />
			<g:sortableColumn property="lastName"
				title="${message(code: 'contact.lastName.label', default: 'Last Name')}" />
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.contacts}" var="contactInstance">
			<tr>
				<td>
					${fieldValue(bean: contactInstance, field: "externalId")}
				</td>
				<td>
					${fieldValue(bean: contactInstance, field: "firstName")}
				</td>
				<td>
					${fieldValue(bean: contactInstance, field: "lastName")}
				</td>
				<td class="link"><g:link action="show" controller="contact"
						id="${contactInstance.id}" class="btn btn-small">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${organizationInstance?.contacts?.size()}" />
</div>

<!-- Add New Contact -->
<!-- Modal -->
<div id="contactModal" class="modal hide fade" tabindex="-1" role="dialog" 
	data-remote="<g:createLink controller="organization" action="createContact"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Contact</h3>
	</div>
	<g:form controller="organization" action="createAddress" method="POST">
		<g:hiddenField name="organization.id" value="${organizationInstance?.id}" />
		<g:hiddenField name="createdFromOrganizationDetailView" value="true" />
		<div class="modal-body">
			
		</div>
		<div class="modal-footer">
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">
					<i class="icon-ok icon-white"></i>
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>