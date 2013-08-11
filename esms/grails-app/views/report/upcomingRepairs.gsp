<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'report.label', default: 'Report')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid" style="margin-top: -15px;">
		<div class="span12">
			<div class="page-header">
				<h1>Upcoming Repairs</h1>
			</div>

			<div class="span12">
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}"
						total="${eventInstanceTotal}" />
				</div>
				<br />
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<g:sortableColumn property="startTime"
								title="${message(code: 'event.startTime.label', default: 'Start Date')}" />
								
							<g:sortableColumn property="endTime"
								title="${message(code: 'event.endTime.label', default: 'End Date')}" />
							
							<g:sortableColumn property="priority"
								title="${message(code: 'event.priority.label', default: 'Priority')}" />
								
							<g:sortableColumn property="title"
								title="${message(code: 'event.title.label', default: 'Title')}" />

							<g:sortableColumn property="location"
								title="${message(code: 'event.location.label', default: 'Location')}" />
								
							<g:sortableColumn property="location"
								title="${message(code: 'event.party.organization.label', default: 'Customer')}" />	

							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${eventInstanceList}" var="eventInstance">
							<tr>
								<td>
									<g:formatDate date="${eventInstance?.startTime}"  type="datetime"/>
								</td>
								
								<td>
									<g:formatDate date="${eventInstance?.endTime}"  type="datetime"/>
								</td>
								
								<td>
									${fieldValue(bean: eventInstance, field: "priority")}
								</td>
								
								<td>
									${fieldValue(bean: eventInstance, field: "title")}
								</td>

								<td>
									${fieldValue(bean: eventInstance, field: "location")}
								</td>
								
								<td>
									${eventInstance?.party?.name}
								</td>

								<td class="link"><g:link action="show" controller="event"
										id="${eventInstance.id}" class="btn btn-small">Show &raquo;</g:link>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}"
						total="${eventInstanceList.size()}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
