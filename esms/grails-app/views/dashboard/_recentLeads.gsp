<%@ page import="com.esms.model.party.*"%>

<div class="page-header">
	<h1>
		Follow-up these leads
	</h1>
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
				${message(code: 'address.buildingName.label', default: 'Building Name')}
			</th>
			<th>
				Contact
			</th>	
			<th>
				${message(code: 'organization.assignedTo.label', default: 'Assigned To')}
			</th>	
			<th>
				Disqualify
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
					${addressInstance?.buildingName}
				</td>
				<td>
					<%
						if(!organization?.contacts?.isEmpty()) {
							def contact = organization?.contacts.first()
							println contact?.firstName
						}
					 %>
				</td>
				<td>
					${fieldValue(bean: organization, field: "assignedTo")}
				</td>
				<td class="link"><g:link controller="lead" action="disqualifyLead"
						id="${organization?.id}" class=" ">
						<i class="icon-trash"></i>
						Disqualify
				</g:link></td>
				<td class="link"><g:link controller="lead" action="show"
						id="${organization?.id}" class=" ">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="7" class="link">
				<g:link controller="lead" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>