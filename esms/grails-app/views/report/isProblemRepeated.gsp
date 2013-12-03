
<%@page import="com.esms.model.order.Order"%>
<%@ page import="com.esms.model.calendar.EventLog"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'eventLog.label', default: 'Is Problem Repeated')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:message code="default.list.label" args="[entityName]" />
				</h3>
			</div>
			
			<table class="table table-striped table-condensed table-bordered">
				<thead>
					<tr>
						<th>
							Customer
						</th>
							
						<g:sortableColumn property="event.relatedToValue"
							title="${message(code: 'eventLog.event.relatedToValue.label', default: 'Related Order Number')}" />
						
						<g:sortableColumn property="loggedDate"
							title="${message(code: 'eventLog.loggedDate.label', default: 'Logged Date')}" />

						<g:sortableColumn property="workDoneBy"
							title="${message(code: 'eventLog.workDoneBy.label', default: 'Work Done By')}" />

						<g:sortableColumn property="reviewedBy"
							title="${message(code: 'eventLog.reviewedBy.label', default: 'Reviewed By')}" />

						<g:sortableColumn property="comments"
							title="${message(code: 'eventLog.comments.label', default: 'Comments')}" />

						<g:sortableColumn property="urgency"
							title="${message(code: 'eventLog.urgency.label', default: 'Urgency')}" />

						<th></th>
						
						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${eventLogInstanceList}" var="eventLogInstance">
						<g:if test="${eventLogInstance?.event?.relatedTo == 'ORDER' }">
							<g:set var="order" value="${Order.findByOrderNumber(eventLogInstance?.event?.relatedToValue)}" />
						</g:if>
						<tr>
							<td>
								<g:if test="${eventLogInstance?.event?.relatedTo == 'ORDER' }">
									${order?.organization?.name}
								</g:if>
							</td>
							
							<td>
								${eventLogInstance?.event?.relatedToValue}
							</td>

							<td><g:formatDate date="${eventLogInstance.loggedDate}" /></td>

							<td>
								${fieldValue(bean: eventLogInstance, field: "workDoneBy")}
							</td>

							<td>
								${fieldValue(bean: eventLogInstance, field: "reviewedBy")}
							</td>

							<td>
								${fieldValue(bean: eventLogInstance, field: "comments")}
							</td>

							<td>
								${fieldValue(bean: eventLogInstance, field: "urgency")}
							</td>
							
							<td class="link"><g:link action="show" controller="event"
									id="${eventLogInstance.event?.id}">Show Event &raquo;</g:link>
							</td>

							<td class="link">
								<g:if test="${eventLogInstance?.event?.relatedTo == 'ORDER' }">
									<g:link action="show" controller="order" 
									id="${order?.id}">Show Order &raquo;</g:link>
								</g:if>
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			
			<div class="pagination">
				<bootstrap:paginate total="${eventLogInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
