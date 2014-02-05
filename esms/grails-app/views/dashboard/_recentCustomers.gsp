<%@page import="com.esms.model.product.Product"%>
<%@ page import="com.esms.model.party.*"%>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'order.orderNumber.label', default: 'Order Number')}
			</th>

			<th>
				${message(code: 'quote.organization.name.label', default: 'Organization')}
			</th>

			<th>
				${message(code: 'order.type.label', default: 'Contract Type')}
			</th>

			<th>
				${message(code: 'order.contractFromDate.label', default: 'From Date')}
			</th>

			<th>
				${message(code: 'order.contractToDate.label', default: 'To Date')}
			</th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentOrders?.sort{a,b -> a.orderNumber <=> b.orderNumber}}" var="orderInstance">
			<g:set var="organization"
				value="${orderInstance.organization}" />
			<g:set var="addressInstance"
				value="${Address.findByAddressTypeAndParty('BILLING',organization) }" />
			<tr>
				<td>
					<g:link action="show" id="${orderInstance.id}" controller="order"
								class="lnk ">
						${fieldValue(bean: orderInstance, field: "orderNumber")}
					</g:link>
				</td>

				<td><g:link controller="organization" action="show"
						id="${orderInstance?.organization?.id}">
						${fieldValue(bean: orderInstance, field: "organization.name")}
					</g:link></td>

				<td>
					${orderInstance?.organization?.activeServiceContract()}
				</td>

				<td><g:formatDate date="${orderInstance.contractFromDate}" /></td>

				<td><g:formatDate date="${orderInstance.contractToDate}" /></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
			<tr>
				<th colspan="5" class="link">
					<g:link controller="order" action="list" class="lnk ">Show All Orders &raquo;</g:link>
				</th>				
			</tr>
		</tfoot>
</table>