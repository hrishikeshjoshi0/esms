<%@page import="com.esms.model.calendar.Event"%>
<%@ page import="com.esms.model.party.*"%>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'order.orderNumber.label', default: 'Order Number')}
			</th>
			<th>
				${message(code: 'organization.name.label', default: 'Name')}
			</th>
			<th>
				Type
			</th>	
			<th>
				Assigned To
			</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentRepairsModernizationAndInstallationOrders?.sort{a,b -> a.orderNumber <=> b.orderNumber}}" var="order">
			<g:set var="organization"
				value="${order.organization}" />
			<tr>
				<td>
					<g:link action="show" id="${order.id}" controller="order"
								class="lnk ">
						${fieldValue(bean: order, field: "orderNumber")}		
					</g:link>
				</td>
				<td>
					<g:link controller="organization" action="show" id="${organization?.id}">
						${fieldValue(bean: organization, field: "name")}
					</g:link>
				</td>
				<td>
					${order?.type}
				</td>
				<td>
					${order?.assignedTo}
				</td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
			<tr>
				<th colspan="4" class="link">
					<g:link controller="order" action="list" class="lnk ">Show All Orders &raquo;</g:link>
				</th>				
			</tr>
		</tfoot>
</table>