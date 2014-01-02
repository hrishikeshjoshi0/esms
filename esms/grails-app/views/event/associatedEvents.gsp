<%@ page import="com.esms.model.calendar.Event"%>
<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'event.sourceEvent.label', default: 'Source Event')}
			</th>
			
			<th>
				${message(code: 'event.title.label', default: 'Title')}
			</th>

			<th>
				${message(code: 'event.eventType.label', default: 'Event Type')}
			</th>

			<th>
				${message(code: 'event.startTime.label', default: 'Start Time')}
			</th>
			
			<th>
				${message(code: 'event.endTime.label', default: 'End Time')}
			</th>

			<th>
				${message(code: 'event.assignedTo.label', default: 'Assigned To')}
			</th>

			<th>
				${message(code: 'event.status.label', default: 'Status')}
			</th>

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:if
			test="${eventInstance?.associatedEvents() != null && eventInstance?.associatedEvents().size() != 0}">
			<g:each in="${eventInstance?.associatedEvents()}" var="associatedEvent">
				<tr>

					<td>
						<g:link controller="event" action="show" id="${eventInstance?.sourceEvent?.id}">
								${associatedEvent?.sourceEvent?.title}
						</g:link>
					</td>
					
					<td>
						${fieldValue(bean: associatedEvent, field: "title")}
					</td>

					<td>
						${fieldValue(bean: associatedEvent, field: "eventType")}
					</td>
					
					<td>
						<g:formatDate date="${associatedEvent?.startTime}"/>
					</td>
					
					<td>
						<g:formatDate date="${associatedEvent?.endTime}"/>
					</td>

					<td>
						${fieldValue(bean: associatedEvent, field: "assignedTo")}
					</td>

					<td>
						${fieldValue(bean: associatedEvent, field: "status")}
					</td>

					<td class="link">
						<g:link action="show" controller="event"
							class="lnk " id="${associatedEvent.id}">Show &raquo;</g:link>
						/
						<g:link class="lnk" action="edit" id="${eventInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" /> &raquo;
						</g:link>							
					</td>
				</tr>
			</g:each>
		</g:if>
	</tbody>
</table>
