<!-- Quotes -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="eventType"
				title="${message(code: 'event.eventType.label', default: 'Event Type')}" />
				
			<g:sortableColumn property="title"
				title="${message(code: 'event.title.label', default: 'Title')}" />
				
			<g:sortableColumn property="startTime"
				title="${message(code: 'event.startTime.label', default: 'Start Date Time')}" />
				
			<g:sortableColumn property="endTime"
				title="${message(code: 'event.endTime.label', default: 'End Date Time')}" />	
				
			<g:sortableColumn property="status"
				title="${message(code: 'event.assignedTo.label', default: 'Assigned To')}" />
				
			<g:sortableColumn property="description"
				title="${message(code: 'event.description.label', default: 'Description')}" />	

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${events}" var="eventInstance">
			<tr>
			
				<td>
					${fieldValue(bean: eventInstance, field: "eventType")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "title")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "startTime")}
				</td>
				
				<td>
					${fieldValue(bean: eventInstance, field: "endTime")}
				</td>
				
				<td>
					${fieldValue(bean: eventInstance, field: "assignedTo")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "description")}
				</td>

				<td class="link"><g:link controller="event" action="show"
						id="${eventInstance.id}" class="btn btn-default btn-sm">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${events?events.size():0}" />
</div>
