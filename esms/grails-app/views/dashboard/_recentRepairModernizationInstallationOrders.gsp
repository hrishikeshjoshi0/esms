	<%@ page import="com.esms.model.party.*"%>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'organization.name.label', default: 'Name')}
			</th>
			<th>
				Type of Enquiry
			</th>	
			<th>
				Contact Person
			</th>	
			<th>
				Contact Number
			</th>	
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentRepairsModernizationAndInstallationOrders}" var="order">
			<g:set var="organization"
				value="${order.organization}" />
			<g:set var="addressInstance"
				value="${Address.findByAddressTypeAndParty('BILLING',organization) }" />
			<tr>
				<td>
					<g:link controller="organization" action="show" id="${organization?.id}">
						${fieldValue(bean: organization, field: "name")}
					</g:link>
				</td>
				<td>
					${order.organization?.liftInfo?.typeOfEnquiry}
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
				<td class="link"><g:link controller="order" action="show" id="${order?.id}">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
			<tr>
				<th colspan="5" class="link">
					<g:link controller="order" action="list">Show All &raquo;</g:link>
				</th>				
			</tr>
		</tfoot>
</table>