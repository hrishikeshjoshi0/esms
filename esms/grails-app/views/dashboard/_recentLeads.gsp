<%@ page import="com.esms.model.party.*"%>

<div class="page-header">
	<h1>Recent Leads</h1>
</div>


<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'organization.externalId.label', default: 'External Id')}
			</th>	
			<th>
				${message(code: 'organization.name.label', default: 'Name')}
			</th>	
			<th>
				${message(code: 'organization.assignedTo.label', default: 'Assigned To')}
			</th>	
			<th>
				${message(code: 'address.buildingName.label', default: 'Building Name')}
			</th>	
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentLeads}" var="organization">
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
				<td class="link"><g:link controller="lead" action="show"
						id="${organization?.id}" class=" ">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="5" class="link">
				<g:link controller="lead" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>