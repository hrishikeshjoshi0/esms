<%@ page import="com.esms.model.calendar.Event"%>
<div class="span12">
	<div class="dashboard-widget-header">
		<h1>Overdue Events</h1>
	</div>

	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>
				${message(code: 'event.startTime.label', default: 'Start Time')}
			</th>	

			<th>
				${message(code: 'event.eventType.label', default: 'Event Type')}
			</th>
			
			<th>
				${message(code: 'event.party.label', default: 'Organization')}
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
			<g:if test="${overdueEvents != null && overdueEvents.size() != 0}">
				<g:each in="${overdueEvents}" var="eventInstance">
					<tr>
						<td>
						${fieldValue(bean: eventInstance, field: "startTime")}
					</td>

					<td>
						${fieldValue(bean: eventInstance, field: "eventType")}
					</td>
					
					<td>
						${eventInstance.party?.name}
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
					<th colspan="7">
						<h4 style="color: red;">No Records Found !</h4>
					</th>
				</tr>
			</g:else>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="7" class="link">
					<g:link controller="event" action="listView">Show All &raquo;</g:link>
				</th>				
			</tr>
		</tfoot>
	</table>
	<div class="pagination">
		<bootstrap:paginate params="${filterParams}"
			total="${overdueEvents?.size()}" />
	</div>
	<br />
</div>