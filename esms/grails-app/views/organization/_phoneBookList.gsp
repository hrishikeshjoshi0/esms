<div class="pull-right">
	<a data-toggle="modal" href="#" data-target="#phoneBookModal"
		role="button" class="btn btn-default btn-xs"> <i class="glyphicon glyphicon-plus"></i> New Phone Book
	</a>
</div>


<!-- Contacts -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="email"
				title="${message(code: 'phoneBook.email.label', default: 'Email')}" />

			<g:sortableColumn property="homePhone"
				title="${message(code: 'phoneBook.homePhone.label', default: 'Home Phone')}" />

			<g:sortableColumn property="mobilePhone"
				title="${message(code: 'phoneBook.mobilePhone.label', default: 'Mobile Phone')}" />

			<g:sortableColumn property="officePhone"
				title="${message(code: 'phoneBook.officePhone.label', default: 'Office Phone')}" />

			<g:sortableColumn property="otherPhone"
				title="${message(code: 'phoneBook.otherPhone.label', default: 'Other Phone')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.phoneBooks}" var="phoneBookInstance">
			<tr>

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

				<td class="link"><g:link action="show" controller="phoneBook"
						id="${phoneBookInstance.id}" class="btn btn-default btn-xs">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${organizationInstance?.phoneBooks?.size()}" />
</div>

<!-- Modal -->
<div id="phoneBookModal" class="modal hide fade" tabindex="-1"
	role="dialog"
	data-remote="<g:createLink controller="organization" action="createPhoneBook"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New PhoneBook</h3>
	</div>
	<g:form controller="organization" action="createPhoneBook" method="POST">
		<g:hiddenField name="party.id" value="${organizationInstance?.id}" />
		<g:hiddenField name="createdFromOrganizationDetailView" value="true" />
		<div class="modal-body"></div>
		<div class="modal-footer">
			<div class="form-group">
				<button type="submit" class="btn btn-primary">
					
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>