<%@ page import="com.esms.model.party.*"%>

<div class="heading clearfix">
	<h3 class="pull-left">Recent Customers</h3>
	<span class="pull-right label label-important"> ${recentCustomers?recentCustomers.size:0}
		Customers
	</span>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<g:sortableColumn property="externalId"
				title="${message(code: 'organization.externalId.label', default: 'External Id')}" />
			<g:sortableColumn property="name"
				title="${message(code: 'organization.name.label', default: 'Name')}" />
			<g:sortableColumn property="assignedTo"
				title="${message(code: 'organization.assignedTo.label', default: 'Assigned To')}" />
			<g:sortableColumn property="addresses.buildingName"
				title="${message(code: 'address.buildingName.label', default: 'Building Name')}" />
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentCustomers}" var="organization">
			<g:set var="addressInstance"
				value="${Address.findByAddressTypeAndParty('BILLING',organization) }" />
			<tr>
				<td>
					${fieldValue(bean: organization, field: "externalId")}
				</td>
				<td>
					${fieldValue(bean: organization, field: "name")}
				</td>
				<td>
					${fieldValue(bean: organization, field: "assignedTo")}
				</td>
				<td>
					${addressInstance?.buildingName}
				</td>
				<td class="link"><g:link action="show" id="${organization?.id}">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>