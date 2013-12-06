<div class="pull-right">
	<bs3:modalLink
		href="${createLink(controller:'organization',action:'createContact',params="['organization.id':organizationInstance?.id]")}"
		class="btn-primary" id="createContact" title="New Contact" />	
</div>

<!-- Contacts -->
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
			<g:sortableColumn property="phoneBook.email" title="${message(code: 'phoneBook.email.label', default: 'Email')}" />
			<g:sortableColumn property="phoneBook.homePhone" title="${message(code: 'phoneBook.homePhone.label', default: 'Home Phone')}" />
			<g:sortableColumn property="phoneBook.mobilePhone" title="${message(code: 'phoneBook.mobilePhone.label', default: 'Mobile Phone')}" />
			<g:sortableColumn property="phoneBook.officePhone" title="${message(code: 'phoneBook.officePhone.label', default: 'Office Phone')}" />
			<g:sortableColumn property="phoneBook.otherPhone" title="${message(code: 'phoneBook.otherPhone.label', default: 'Other Phone')}" />
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
					
					<td>${fieldValue(bean: phoneBookInstance, field: "email")}</td>
							
					<td>${fieldValue(bean: phoneBookInstance, field: "homePhone")}</td>
						
					<td>${fieldValue(bean: phoneBookInstance, field: "mobilePhone")}</td>
						
					<td>${fieldValue(bean: phoneBookInstance, field: "officePhone")}</td>
							
					<td>${fieldValue(bean: phoneBookInstance, field: "otherPhone")}</td>
							
					<td class="link"><g:link action="show" controller="contact"
							id="${contactInstance.id}" class="btn btn-default btn-sm">Show</g:link>
					</td>
				</tr>
			</g:each>	
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${organizationInstance?.contacts?.size()}" />
</div>