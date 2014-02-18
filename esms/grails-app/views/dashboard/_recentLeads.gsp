<%@ page import="com.esms.model.party.*"%>

<div class="page-header">
	<h3>
		Recent Leads
	</h3>
</div>


<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'organization.name.label', default: 'Name')}
			</th>
			<th>
				Contact Person
			</th>
			<th>
				Contact Number
			</th>
			<th>
				Assigned To
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
					<%
						if(!organization?.contacts?.isEmpty()) {
							def contact = organization?.contacts.first()
							println contact?.phoneBooks?.first()?.mobilePhone
						}
					 %>
				</td>
				<td>
					${organization?.assignedTo}
				</td>
				<td class="link"><g:link controller="lead" action="disqualifyLead"
						id="${organization?.id}" class=" ">
						<i class="glyphicon glyphicon-trash"></i>
						Disqualify
				</g:link></td>
				<td class="link"><g:link controller="lead" action="show" class="lnk "
						id="${organization?.id}" class=" ">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="7" class="link">
				<g:link controller="lead" action="list" class="lnk ">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>