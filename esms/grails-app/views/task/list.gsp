<%@ page import="com.esms.model.calendar.Task"%>
<%@page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.order.Order"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'task.label', default: 'Task')}" />
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
			
			<filterpane:filterPane domain="com.esms.model.calendar.Task"
						filterProperties="${['taskName', 'relatedTo','relatedToValue','dateTime','dueDateTime','status','priority','assignedToValue']}"
						titleKey="default.filterPane.header" dialog="yes" visible="n"
										showSortPanel="y" showTitle="y" showButtons="y"
										fullAssociationPathFieldNames="false" />

			<table class="table table-striped table-bordered mediaTable">
				<thead>
					<tr>

						<th>
							${message(code: 'task.taskName.label', default: 'Task Name')}
						</th>
						
						<th>
							${message(code: 'task.relatedTo.label', default: 'Related To')}
						</th>

						<th>
							${message(code: 'task.relatedToValue.label', default: 'Related To Value')}
						</th>

						<th>
							${message(code: 'task.organization.label', default: 'Building Name')}
						</th>

						<th>
							${message(code: 'task.dateTime.label', default: 'Date')}
						</th>

						<th>
							${message(code: 'task.dueDateTime.label', default: 'Due Date')}
						</th>

						<th>
							${message(code: 'task.status.label', default: 'Status')}
						</th>

						<th>
							${message(code: 'task.priority.label', default: 'Priority')}
						</th>

						<th>
							${message(code: 'task.assignedToValue.label', default: 'Assigned To Value')}
						</th>

						<th></th>
					</tr>
				</thead>
				<tbody id="upcomingTasks">
					<g:each in="${taskInstanceList}" var="taskInstance">
						<g:set var="order"
								value="${Order.findByOrderNumber(taskInstance.relatedToValue?taskInstance.relatedToValue:'')}" />
						<tr>

							<td>
								${fieldValue(bean: taskInstance, field: "taskName")}
							</td>
							
							<td>
								${taskInstance.relatedTo}
							</td>

							<td>
								${taskInstance.relatedToValue}
							</td>

							<td>
								${order?.organization?.name}
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "dateTime")}
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "dueDateTime")}
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "status")}
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "priority")}
							</td>

							<td>
								${fieldValue(bean: taskInstance, field: "assignedToValue")}
							</td>

							<td class="link"><g:link action="show"
									id="${taskInstance.id}" controller="task" class="lnk ">Show &raquo;</g:link></td>
						</tr>
					</g:each>
				</tbody>
			</table>

			<div class="pgn">
				<bootstrap:paginate total="${taskInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
