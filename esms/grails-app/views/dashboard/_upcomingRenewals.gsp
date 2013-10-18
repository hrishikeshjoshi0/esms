<div class="page-header">
	<h1>
		Upcoming Renewals in the next 
		<g:if test="${params.upcomingRenewalDaysParam}">${params.upcomingRenewalDaysParam}</g:if>
		<g:else>60</g:else>
		days
	</h1>
</div>

<div class="pagination">
	<bootstrap:paginate params="${filterParams}"
		total="${orderInstanceTotal?orderInstanceTotal:upcomingRenewals.size()}" />
</div>
<br />
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th>
				${message(code: 'order.orderNumber.label', default: 'Order Number')}
			</th>

			<th>
				${message(code: 'quote.organization.name.label', default: 'Organization')}
			</th>

			<th>
				${message(code: 'order.status.label', default: 'Status')}
			</th>

			<th>
				${message(code: 'order.type.label', default: 'Type')}
			</th>

			<th>
				${message(code: 'order.issueDate.label', default: 'Issue Date')}
			</th>

			<th>
				${message(code: 'order.contractFromDate.label', default: 'From Date')}
			</th>

			<th>
				${message(code: 'order.contractToDate.label', default: 'To Date')}
			</th>

			<th>
				${message(code: 'order.grandTotal.label', default: 'Grand Total')}
			</th>

			<th>
				${message(code: 'order.receviedGrandTotal.label', default: 'Received Amount')}
			</th>

			<th>
				${message(code: 'order.openGrandTotal.label', default: 'Open Amount')}
			</th>

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${upcomingRenewals}" var="orderInstance">
			<tr>
				<td>
					${fieldValue(bean: orderInstance, field: "orderNumber")}
				</td>

				<td><g:link controller="organization" action="show"
						id="${orderInstance?.organization?.id}">
						${fieldValue(bean: orderInstance, field: "organization.name")}
					</g:link></td>

				<td>
					${fieldValue(bean: orderInstance, field: "status")}
				</td>

				<td>
					${fieldValue(bean: orderInstance, field: "type")}
				</td>

				<td><g:formatDate date="${orderInstance.issueDate}" /></td>

				<td><g:formatDate date="${orderInstance.contractFromDate}" /></td>

				<td><g:formatDate date="${orderInstance.contractToDate}" /></td>

				<td>
					${fieldValue(bean : orderInstance, field : "grandTotal") }
				</td>

				<td>
					${fieldValue(bean : orderInstance, field : "receviedGrandTotal") }
				</td>

				<td>
					${fieldValue(bean : orderInstance, field : "openGrandTotal") }
				</td>

				<td class="link"><g:link action="show" id="${orderInstance.id}" controller="order"
						class="btn btn-small">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th class="link" colspan="5">
				<g:link controller="report" action="upcomingRenewals">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
<div class="pagination">
	<bootstrap:paginate params="${filterParams}"
		total="${upcomingRenewals?.size()}" />
</div>