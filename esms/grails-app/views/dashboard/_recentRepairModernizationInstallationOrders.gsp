<%@page import="com.esms.model.calendar.Event"%>
<%@ page import="com.esms.model.party.*"%>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'organization.name.label', default: 'Name')}
			</th>
			<th>
				Type
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
			<th>
				Starts
			</th>
			<th>
				Ends
			</th>
			<th>
				Status
			</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentRepairsModernizationAndInstallationOrders}" var="order">
			<g:set var="organization"
				value="${order.organization}" />
			<g:set var="addressInstance"
				value="${Address.findByAddressTypeAndParty('BILLING',organization) }" />
			<g:set var="eventInstance"
				value="${Event.findByRelatedToAndRelatedToValue('ORDER',order?.orderNumber) }" />	
			<tr>
				<td>
					<g:link controller="organization" action="show" id="${organization?.id}">
						${fieldValue(bean: organization, field: "name")}
					</g:link>
				</td>
				<td>
					${order?.type}
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
					${order?.assignedTo}
				</td>
				<td>
					${eventInstance?.startTime}
				</td>
				<td>
					${eventInstance?.endTime}
				</td>
				<td>
					${eventInstance?.status}
				</td>
				<td class="link">
					<g:if test="${eventInstance}">
						<g:link controller="event" action="show" id="${eventInstance?.id}">
							Show Event &raquo;
						</g:link>
					</g:if>
					<g:else>
						No Event Created
					</g:else>
				</td>
				<td class="link"><g:link controller="order" action="show" id="${order?.id}" class="lnk ">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
			<tr>
				<th colspan="10" class="link">
					<g:link controller="order" action="list" class="lnk ">Show All &raquo;</g:link>
				</th>				
			</tr>
		</tfoot>
</table>