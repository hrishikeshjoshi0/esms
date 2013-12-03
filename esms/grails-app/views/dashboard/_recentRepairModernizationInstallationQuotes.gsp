<%@ page import="com.esms.model.quote.*"%>

<table class="table table-striped table-bordered table-compact mediaTable">
	<thead>
		<tr>

			<g:sortableColumn property="quoteName"
				title="${message(code: 'quote.quoteName.label', default: 'Quote Name')}" />

			<g:sortableColumn property="organization.name"
				title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />

			<g:sortableColumn property="status"
				title="${message(code: 'quote.status.label', default: 'Status')}" />

			<g:sortableColumn property="type"
				title="${message(code: 'quote.type.label', default: 'Type')}" />
			
			<g:sortableColumn property="assignedTo"
				title="${message(code: 'quote.assignedTo.label', default: 'Assigned To')}" />	

			<th>Disqualify</th>	

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentRepairsModernizationAndInstallationQuotes}" var="quoteInstance">
			<tr>
				<td>
					${fieldValue(bean: quoteInstance, field: "quoteName")}
				</td>

				<td><g:link controller="organization" action="show"
						id="${quoteInstance?.organization?.id}">
						${fieldValue(bean: quoteInstance, field: "organization.name")}
					</g:link></td>

				<td>
					${fieldValue(bean: quoteInstance, field: "status")}
				</td>

				<td>
					${fieldValue(bean: quoteInstance, field: "type")}
				</td>
				
				<td>
					${fieldValue(bean: quoteInstance, field: "assignedTo")}
				</td>

				<td class="link"><g:link action="markAsDisqualified" controller="quote"	id="${quoteInstance?.id}" >
						<i class="glyphicon glyphicon-trash"></i>
						Disqualify
					</g:link>
				</td>

				<td class="link"><g:link controller="quote" action="show" id="${quoteInstance.id}">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="7" class="link">
				<g:link controller="quote" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>