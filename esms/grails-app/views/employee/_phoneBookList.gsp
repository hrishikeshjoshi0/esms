<div class="pull-right">
	<bs3:modalLink href="${createLink(controller:'employee',action:'createPhoneBook',params:['party.id':employeeInstance?.id])}"
			id="createPhoneBook" title="New Phone"/>
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
		<g:each in="${employeeInstance?.phoneBooks}" var="phoneBookInstance">
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
						id="${phoneBookInstance.id}" class="lnk">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pgn">
	<bootstrap:paginate total="${employeeInstance?.phoneBooks?.size()}" />
</div>