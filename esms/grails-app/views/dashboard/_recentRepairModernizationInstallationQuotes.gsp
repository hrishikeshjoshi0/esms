<%@ page import="com.esms.model.quote.*"%>

<table class="table table-striped table-bordered table-compact mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'quote.quoteNumber.label', default: 'Quote Number')}
			</th>
			
			<th>${message(code: 'quote.organization.name.label', default: 'Organization')} </th>

			<th>
				${message(code: 'quote.type.label', default: 'Type')}
			</th>	
				
			<th>
				${message(code: 'quote.assignedTo.label', default: 'Assigned To')}
			</th>		

			<th>
				${message(code: 'quote.status.label', default: 'Status')}
			</th>
			
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentRepairsModernizationAndInstallationQuotes?.sort{a,b -> a.quoteNumber <=> b.quoteNumber}}" var="quoteInstance">
			<g:set var="organization" value="${quoteInstance?.organization}"/>
			<g:if test="${!organization?.contacts?.isEmpty()}">
				<g:set var="contact" value="${organization?.contacts?.first()}"/>
			</g:if>
			<tr>
				<td>
					<g:link controller="quote" action="show" id="${quoteInstance.id}" class="lnk ">
						${fieldValue(bean: quoteInstance, field: "quoteNumber")}
					</g:link>
				</td>
				
				<td><g:link controller="organization" action="show"
						id="${quoteInstance?.organization?.id}">
						${fieldValue(bean: quoteInstance, field: "organization.name")}
					</g:link>
				</td>
				
				<td>
					${fieldValue(bean: quoteInstance, field: "type")}
				</td>

				<td>
					${fieldValue(bean: quoteInstance, field: "assignedTo")}
				</td>
				
				<td>
					${fieldValue(bean: quoteInstance, field: "status")}
				</td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="5" class="link">
				<g:link controller="quote" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>