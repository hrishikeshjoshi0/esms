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
			<g:sortableColumn property="status"
				title="${message(code: 'event.status.label', default: 'Status')}" />
				
			<g:sortableColumn property="title"
				title="${message(code: 'event.title.label', default: 'Title')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.events}" var="eventInstance">
			<tr>
				<td>
					${fieldValue(bean: eventInstance, field: "status")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "title")}
					<br/>
					<g:if test="${eventInstance.eventType == 'CALL' }">
						${eventInstance.description}
					</g:if>
					<g:elseif test="${eventInstance.eventType == 'MEETING' }">
						${eventInstance.meetingNotes}
					</g:elseif>
					<g:elseif test="${eventInstance.eventType == 'MAINTENANCE VISIT' }">
						${eventInstance.maintenanceVisitTechnicianNotes}
					</g:elseif>
					<g:elseif test="${eventInstance.eventType == 'BREAKDOWN CALL' }">
						${eventInstance.breakdownVisitTechnicianNotes}
					</g:elseif>
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
