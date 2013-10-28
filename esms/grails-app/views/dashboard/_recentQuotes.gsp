<%@ page import="com.esms.model.quote.*"%>

<div class="page-header">
	<h1>
		Top Active Quotes
	</h1>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>${message(code: 'quote.organization.name.label', default: 'Organization')} </th>

			<th>
				${message(code: 'quote.type.label', default: 'Type')}
			</th>	
				
			<th>
				Contact Person
			</th>
			
			<th>
				Contact Number
			</th>
			
			<th>
				${message(code: 'quote.assignedTo.label', default: 'Assigned To')}
			</th>		

			<th>
				${message(code: 'quote.status.label', default: 'Status')}
			</th>	
				
			<th>Disqualify</th>	

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentQuotes}" var="quoteInstance">
			<tr>
				<td><g:link controller="organization" action="show"
						id="${quoteInstance?.organization?.id}">
						${fieldValue(bean: quoteInstance, field: "organization.name")}
					</g:link>
				</td>
				
				<td>
					${fieldValue(bean: quoteInstance, field: "type")}
				</td>
				
				<td>
					<%
						if(!quoteInstance?.organization?.contacts?.isEmpty()) {
							def contact = quoteInstance?.organization?.contacts.first()
							println contact?.firstName
						}
					 %>
				</td>
				
				<td>
					<%
						if(!organization?.contacts?.isEmpty()) {
							def contact = organization?.contacts?.first()
							println contact?.phoneBooks?.first()?.mobilePhone
						}
					 %>
				</td>

				<td>
					${fieldValue(bean: quoteInstance, field: "assignedTo")}
				</td>
				
				<td>
					${fieldValue(bean: quoteInstance, field: "status")}
				</td>
				
				<td class="link"><g:link action="markAsDisqualified" controller="quote"	id="${quoteInstance?.id}" >
						<i class="icon-trash"></i>Disqualify
					</g:link>
				</td>

				<td class="link"><g:link controller="quote" action="show" id="${quoteInstance.id}">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="8" class="link">
				<g:link controller="quote" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>