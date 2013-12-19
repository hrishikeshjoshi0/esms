<%@ page import="com.esms.model.calendar.Event"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'event.label', default: 'Event')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
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
						<g:each in="${overdueEvents}" var="eventInstance">
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

								<td class="link"><g:link action="show" controller="event"
										class="lnk " id="${eventInstance.id}">Show &raquo;</g:link></td>
							</tr>
						</g:each>
					</g:if>
				</tbody>
			</table>
			<div class="pgn">
				<bootstrap:paginate params="${filterParams}"
					total="${overdueEventsCount}" />
			</div>
		</div>
	</div>
</body>
</html>