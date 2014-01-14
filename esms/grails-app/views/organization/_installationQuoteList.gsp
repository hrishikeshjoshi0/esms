<%@ page import="com.esms.model.quote.Quote"%>
<div class="pull-right">
	<a href="<g:createLink controller="quote" action="create" params="[contractQuote:true,type:'INSTALLATION',organizationId:organizationInstance?.id]"/>" 
		role="button" class="btn btn-default btn-sm">  New Installation Quote
	</a>
</div>


<!-- Quotes -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>

			<g:sortableColumn property="quoteName"
				title="${message(code: 'quote.quoteName.label', default: 'Quote Name')}" />

			<g:sortableColumn property="status"
				title="${message(code: 'quote.status.label', default: 'Status')}" />

			<g:sortableColumn property="type"
				title="${message(code: 'quote.type.label', default: 'Type')}" />

			<g:sortableColumn property="salesChannel"
				title="${message(code: 'quote.salesChannel.label', default: 'Sales Channel')}" />

			<g:sortableColumn property="description"
				title="${message(code: 'quote.description.label', default: 'Description')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${Quote.findAllWhere(organization:organizationInstance,type:'INSTALLATION')}" var="quoteInstance">
			<tr>

				<td>
					${fieldValue(bean: quoteInstance, field: "quoteName")}
				</td>

				<td>
					${fieldValue(bean: quoteInstance, field: "status")}
				</td>

				<td>
					${fieldValue(bean: quoteInstance, field: "type")}
				</td>

				<td>
					${fieldValue(bean: quoteInstance, field: "salesChannel")}
				</td>

				<td>
					${fieldValue(bean: quoteInstance, field: "description")}
				</td>

				<td class="link"><g:link controller="quote" action="show" id="${quoteInstance.id}"
						class="lnk">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>