<%--<div class="pull-right">
	<a data-toggle="modal" data-target="#contactModal" role="button"
		href="<g:createLink controller="lead" action="createContact" params="['party.id':organizationInstance?.id]" />" 
		class="btn btn-default btn-sm"> <i class="glyphicon glyphicon-plus"></i> New
		Contact
	</a>
</div>
--%>
<div class="table-responsive">
	<table class="table table-striped table-condensed table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="externalId"
					title="${message(code: 'contact.externalId.label', default: 'External Id')}" />
				<g:sortableColumn property="designation"
					title="${message(code: 'contact.designation.label', default: 'Designation')}" />
				<g:sortableColumn property="firstName"
					title="${message(code: 'contact.firstName.label', default: 'First Name')}" />
				<g:sortableColumn property="lastName"
					title="${message(code: 'contact.lastName.label', default: 'Last Name')}" />
				<g:sortableColumn property="phoneBook.email"
					title="${message(code: 'phoneBook.email.label', default: 'Email')}" />
				<g:sortableColumn property="phoneBook.homePhone"
					title="${message(code: 'phoneBook.homePhone.label', default: 'Home Phone')}" />
				<g:sortableColumn property="phoneBook.mobilePhone"
					title="${message(code: 'phoneBook.mobilePhone.label', default: 'Mobile Phone')}" />
				<g:sortableColumn property="phoneBook.officePhone"
					title="${message(code: 'phoneBook.officePhone.label', default: 'Office Phone')}" />
				<g:sortableColumn property="phoneBook.otherPhone"
					title="${message(code: 'phoneBook.otherPhone.label', default: 'Other Phone')}" />
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${organizationInstance?.contacts}" var="contactInstance">
				<g:each in="${contactInstance?.phoneBooks}" var="phoneBookInstance">
					<tr>
						<td>
							${fieldValue(bean: contactInstance, field: "externalId")}
						</td>
						<td>
							${fieldValue(bean: contactInstance, field: "designation")}
						</td>
						<td>
							${fieldValue(bean: contactInstance, field: "firstName")}
						</td>
						<td>
							${fieldValue(bean: contactInstance, field: "lastName")}
						</td>

						<td>
							${fieldValue(bean: phoneBookInstance, field: "email")}
						</td>

						<td>
							${fieldValue(bean: phoneBookInstance, field: "homePhone")}
						</td>

						<td>
							${fieldValue(bean: phoneBookInstance, field: "mobilePhone")}
						</td>

						<td>
							${fieldValue(bean: phoneBookInstance, field: "officePhone")}
						</td>

						<td>
							${fieldValue(bean: phoneBookInstance, field: "otherPhone")}
						</td>

						<td class="link"><g:link action="show" controller="contact"
								id="${contactInstance.id}" class="btn btn-default btn-sm">Show</g:link></td>
					</tr>
				</g:each>
			</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bootstrap:paginate total="${organizationInstance?.contacts?.size()}" />
	</div>
</div>

<!-- Add New Contact -->
<!-- Modal -->
<div class="modal" id="contactModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">Create New Contact</h4>
			</div>

			<div class="well">
				<g:form controller="lead" action="createContact" method="POST">
					<fieldset>
						<g:hiddenField name="party.id" value="${organizationInstance?.id}" />
						<g:hiddenField name="createdFromOrganizationDetailView" value="true" />
						<div class="modal-body">
							${message(code: 'default.ajax.loading.message', default: 'Loading')}
						</div>
						<div class="modal-footer">
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-sm btn-primary">
										<g:message code="default.button.create.label" default="Create" />
									</button>
								</div>
							</div>							
						</div>
					</fieldset>
				</g:form>				
			</div>			
		</div>
	</div>
</div>