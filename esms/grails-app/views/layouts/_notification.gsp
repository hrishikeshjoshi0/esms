<div id="contentwrapper" class="">
	<!-- Row 1 -->
		<!-- 1/2 row width -->
		<g:if test="${session['expiringContracts']}">
		<div class="row">
			<div class="col-md-12">
				<h3 class='style_switcher_header'>
					Expiring Contracts
				</h3>
				<div class="dashboard-widget notification">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<g:sortableColumn property="orderNumber"
										title="${message(code: 'order.orderNumber.label', default: 'Order Number')}" />
	
									<g:sortableColumn property="organization.name"
										title="${message(code: 'quote.organization.name.label', default: 'Organization')}" />
	
									<g:sortableColumn property="status"
										title="${message(code: 'order.status.label', default: 'Status')}" />
	
									<g:sortableColumn property="openGrandTotal"
										title="${message(code: 'order.openGrandTotal.label', default: 'Open Amount')}" />
	
									<th></th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${session['expiringContracts']}" var="orderInstance">
									<tr>
										<td>
											${fieldValue(bean: orderInstance, field: "orderNumber")}
										</td>
	
										<td><g:link controller="organization" action="show"
												id="${orderInstance?.organization?.id}">
												${fieldValue(bean: orderInstance, field: "organization.name")}
											</g:link></td>
										<td>
											${fieldValue(bean: orderInstance, field: "status")}
										</td>
										<td>
											${fieldValue(bean : orderInstance, field : "openGrandTotal") }
										</td>
										<td class="link"><g:link controller="order" action="show"
												id="${orderInstance.id}">Show &raquo;</g:link></td>
									</tr>
								</g:each>
							</tbody>
						</table>
				</div>
			</div>
			</div>
		</g:if>

		<g:if test="${session['upcomingEvents']}">
			<div class="row">
			<div class="col-md-12">
				<h3 class='style_switcher_header'>
					Upcoming Events
				</h3>
				
				<div class="dashboard-widget notification">
					<table class="table table-striped table-condensed table-bordered">
						<thead>
							<tr>

								<g:sortableColumn property="title"
									title="${message(code: 'event.title.label', default: 'Title')}" />

								<g:sortableColumn property="location"
									title="${message(code: 'event.location.label', default: 'Location')}" />

								<g:sortableColumn property="startTime"
									title="${message(code: 'event.startTime.label', default: 'Starts')}" />

								<g:sortableColumn property="endTime"
									title="${message(code: 'event.endTime.label', default: 'Ends')}" />
									
								<th></th>	
							</tr>
						</thead>
						<tbody>
							<g:each in="${session['upcomingEvents']}" var="eventInstance">
								<tr>

									<td>
										${fieldValue(bean: eventInstance, field: "title")}
									</td>

									<td>
										${fieldValue(bean: eventInstance, field: "location")}
									</td>

									<td><g:formatDate date="${eventInstance.startTime}" /></td>

									<td><g:formatDate date="${eventInstance.endTime}" /></td>
									
									<td class="link"><g:link controller="event" action="show"
												id="${eventInstance.id}">Show &raquo;</g:link></td>
								</tr>
							</g:each>
						</tbody>
					</table>
				</div>
			</div>
			</div>
		</g:if>
	</div>
