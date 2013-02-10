<div class="pull-right">
	<a
		href="<g:createLink controller="event" action="create" params="['party.id':organizationInstance.id]" />"
		role="button" class="btn"> <i class="icon-plus"></i> New Event
	</a>
</div>


<!-- Quotes -->
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<g:sortableColumn property="title"
				title="${message(code: 'event.title.label', default: 'Title')}" />

			<g:sortableColumn property="location"
				title="${message(code: 'event.location.label', default: 'Location')}" />

			<g:sortableColumn property="description"
				title="${message(code: 'event.description.label', default: 'Description')}" />
				
			<g:sortableColumn property="status"
				title="${message(code: 'event.status.label', default: 'Status')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.events}" var="eventInstance">
			<tr>

				<td>
					${fieldValue(bean: eventInstance, field: "title")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "location")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "description")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "status")}
				</td>

				<td class="link"><g:link controller="event" action="show"
						id="${eventInstance.id}" class="btn btn-small">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate
		total="${organizationInstance?.events?organizationInstance?.events.size():0}" />
</div>
