<%@ page import="com.esms.model.calendar.Event"%>
<div class="col-md-12">
	<div class="page-header">
		<h3>Overdue Events</h3>
	</div>

	<table class="table table-striped table-bordered mediaTable">
		<thead>
			<tr>
				<th>
					${message(code: 'event.party.label', default: 'Building Name')}
				</th>
			
				<th>
					${message(code: 'event.eventType.label', default: 'Event Type')}
				</th>
				
				<th>
					${message(code: 'event.startTime.label', default: 'Time')}
				</th>
			
				<th>
					${message(code: 'event.assignedTo.label', default: 'Assigned To')}
				</th>

			<th></th>
			</tr>
		</thead>
		<tbody>
			<g:if test="${overdueEvents != null && overdueEvents.size() != 0}">
				<g:each in="${overdueEvents?.sort{a,b -> a.startTime <=> b.startTime}}" var="eventInstance">
					<tr>

						<td>
							${eventInstance.party?.name}
						</td>

						<td>
							${fieldValue(bean: eventInstance, field: "eventType")}
						</td>

						<td>
							${fieldValue(bean: eventInstance, field: "startTime")}
						</td>

						<td>
							${fieldValue(bean: eventInstance, field: "assignedTo")}
						</td>

						<td class="link"><g:link action="show" controller="event" class="lnk "
								id="${eventInstance.id}">Show &raquo;</g:link></td>
					</tr>
				</g:each>
			</g:if>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="5" class="link">
					<g:link class="lnk " controller="event" action="overdueEvents">Show All &raquo;</g:link>
				</th>				
			</tr>
		</tfoot>
	</table>
</div>