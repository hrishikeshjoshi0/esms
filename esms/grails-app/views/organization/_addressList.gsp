<div class="pull-right">
	<bs3:modalLink
		href="${createLink(controller:'organization',createAddress:'createAddress',params="['party.id':organizationInstance?.id]")}"
		class="btn-primary" id="createAddress" title="Create Address" />
</div>

<!-- Contacts -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>

			<g:sortableColumn property="address1"
				title="${message(code: 'address.address1.label', default: 'Address1')}" />

			<g:sortableColumn property="address2"
				title="${message(code: 'address.address2.label', default: 'Address2')}" />

			<g:sortableColumn property="buildingName"
				title="${message(code: 'address.buildingName.label', default: 'Building Name')}" />

			<g:sortableColumn property="city"
				title="${message(code: 'address.city.label', default: 'City')}" />

			<g:sortableColumn property="country"
				title="${message(code: 'address.country.label', default: 'Country')}" />
				
			<g:sortableColumn property="addressType"
				title="${message(code: 'address.addressType.label', default: 'Address Type')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.addresses}" var="addressInstance">
			<tr>

				<td>
					${fieldValue(bean: addressInstance, field: "address1")}
				</td>

				<td>
					${fieldValue(bean: addressInstance, field: "address2")}
				</td>
				
				<td>
					${fieldValue(bean: addressInstance, field: "buildingName")}
				</td>

				<td>
					${fieldValue(bean: addressInstance, field: "city")}
				</td>

				<td>
					${fieldValue(bean: addressInstance, field: "country")}
				</td>

				<td>
					${fieldValue(bean: addressInstance, field: "addressType")}
				</td>

				<td class="link"><g:link action="show" controller="address"
						id="${addressInstance.id}" class="btn btn-default btn-sm">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${organizationInstance?.addresses?.size()}" />
</div>