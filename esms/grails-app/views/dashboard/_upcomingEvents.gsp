<div class="page-header">
	<h3>Upcoming Events</h3>
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
		<g:if test="${upcomingEvents != null && upcomingEvents.size() != 0}">
			<g:each in="${upcomingEvents}" var="eventInstance">
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
							id="${eventInstance.id}">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
		</g:if>
		<g:else>
			<tr>
				<th colspan="7">
					<h5 style="color: red;">No Records Found !</h5>
				</th>
			</tr>
		</g:else>
	</tbody>
	<tfoot>
		<tr>
			<th class="link" colspan="7">
				<g:link controller="event" action="listView" class="lnk ">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
<div class="pgn">
	<bootstrap:paginate params="${filterParams}"
		total="${upcomingEvents?.size()}" />
</div>