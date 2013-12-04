<div class="pull-right">
	<a href="<g:createLink controller="contract" action="create"/>"
		role="button" class="btn btn-default btn-sm"> <i class="glyphicon glyphicon-plus"></i> New Contract
	</a>
</div>


<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>

			<g:sortableColumn property="contractNumber"
				title="${message(code: 'contract.contractNumber.label', default: 'Contract Number')}" />

			<g:sortableColumn property="organization.id"
				title="${message(code: 'contract.organization.id.label', default: 'Organization')}" />

			<g:sortableColumn property="status"
				title="${message(code: 'contract.status.label', default: 'Status')}" />

			<g:sortableColumn property="fromDate"
				title="${message(code: 'contract.fromDate.label', default: 'From Date')}" />

			<g:sortableColumn property="toDate"
				title="${message(code: 'contract.toDate.label', default: 'To Date')}" />

			<g:sortableColumn property="invoicingIsFixedPrice"
				title="${message(code: 'contract.invoicingIsFixedPrice.label', default: 'Invoicing Is Fixed Price')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.contracts}" var="contractInstance">
			<tr>

				<td>
					${fieldValue(bean: contractInstance, field: "contractNumber")}
				</td>

				<td>
					${fieldValue(bean: contractInstance, field: "organization.id")}
				</td>

				<td>
					${fieldValue(bean: contractInstance, field: "status")}
				</td>

				<td><g:formatDate date="${contractInstance.fromDate}" /></td>

				<td><g:formatDate date="${contractInstance.toDate}" /></td>

				<td><g:formatBoolean
						boolean="${contractInstance.invoicingIsFixedPrice}" /></td>

				<td class="link"><g:link action="show" controller="contract"
						id="${contractInstance.id}" class="btn btn-default btn-sm">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${organizationInstance?.contracts?organizationInstance?.contracts.size():0}" />
</div>