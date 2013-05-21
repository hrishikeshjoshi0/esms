<%@ page import="com.esms.model.quote.*"%>

<div class="heading clearfix">
	<h3 class="pull-left">Recent Quotes</h3>
	<span class="pull-right label label-important"> ${recentQuotes?.size()}
		Quotes
	</span>
</div>

<table class="table table-striped table-bordered mediaTable">
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

			<g:sortableColumn property="salesChannel"
				title="${message(code: 'quote.salesChannel.label', default: 'Sales Channel')}" />

			<g:sortableColumn property="description"
				title="${message(code: 'quote.description.label', default: 'Description')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentQuotes}" var="quoteInstance">
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
					${fieldValue(bean: quoteInstance, field: "salesChannel")}
				</td>

				<td>
					${fieldValue(bean: quoteInstance, field: "description")}
				</td>

				<td class="link"><g:link controller="quote" action="show" id="${quoteInstance.id}">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>