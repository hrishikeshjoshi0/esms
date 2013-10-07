<div class="page-header">
	<h1>Upcoming Events</h1>
</div>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th>
				${message(code: 'event.startTime.label', default: 'Start Time')}
			</th>	

			<th>
				${message(code: 'event.title.label', default: 'Title')}
			</th>
			
			<th>
				${message(code: 'event.location.label', default: 'Location')}
			</th>
			
			<th>
				${message(code: 'event.status.label', default: 'Status')}
			</th>

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${upcomingEvents != null && upcomingEvents.size() != 0}">
			<g:each in="${upcomingEvents}" var="eventInstance">
				<tr>
					<td>
						${fieldValue(bean: eventInstance, field: "startTime")}
					</td>

					<td>
						${fieldValue(bean: eventInstance, field: "title")}
					</td>

					<td>
						${fieldValue(bean: eventInstance, field: "location")}
					</td>

					<td>
						${fieldValue(bean: eventInstance, field: "status")}
					</td>

					<td class="link"><g:link action="show" controller="event"
							id="${eventInstance.id}" class="btn btn-small">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
		</g:if>
		<g:else>
			<tr>
				<th colspan="5">
					<h4 style="color: red;">No Records Found !</h4>
				</th>
			</tr>
		</g:else>
	</tbody>
	<tfoot>
		<tr>
			<th class="link" colspan="5">
				<g:link controller="event" action="listView">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
<div class="pagination">
	<bootstrap:paginate params="${filterParams}"
		total="${upcomingEvents?.size()}" />
</div>