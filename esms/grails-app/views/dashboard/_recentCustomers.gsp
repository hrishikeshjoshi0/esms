<%@ page import="com.esms.model.party.*"%>

<div class="page-header">
	<h1>Recent Customers</h1>
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
				Contact 
			</th>	
			<th>
				${message(code: 'organization.assignedTo.label', default: 'Assigned To')}
			</th>	
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
				<td class="link"><g:link controller="organization" action="show" id="${organization?.id}">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
			<tr>
				<th colspan="6" class="link">
					<g:link controller="organization" action="list">Show All &raquo;</g:link>
				</th>				
			</tr>
		</tfoot>
</table>