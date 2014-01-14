<%@ page import="com.esms.model.quote.Quote"%>
<div class="pull-right">
	<a href="<g:createLink controller="quote" action="create" params="[type:'REPAIR',organizationId:organizationInstance?.id]" />" 
		role="button" class="btn btn-default btn-sm">  New Repair Quote
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
		<g:each in="${Quote.findAllWhere(organization:organizationInstance,type:'REPAIR')}" var="quoteInstance">
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

<!-- Modal -->
<div id="quoteModal" class="modal hide fade" tabindex="-1"
	role="dialog"
	data-remote="<g:createLink controller="organization" action="createQuote"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Quote</h3>
	</div>
	<g:form controller="organization" action="createQuote"
		method="POST">
		<g:hiddenField name="organization.id" value="${organizationInstance?.id}" />
		<g:hiddenField name="createdFromOrganizationDetailView" value="true" />
		<div class="modal-body"></div>
		<div class="modal-footer">
			<div class="form-group">
				<button type="submit" class="btn btn-primary">
					
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>