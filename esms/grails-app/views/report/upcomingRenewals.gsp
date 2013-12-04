
<%@ page import="com.esms.model.order.Order"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="Upcoming Renewals" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>Upcoming Renewals</h3>
			</div>
			
			<filterpane:filterPane domain="com.esms.model.order.Order"
						filterProperties="${['orderNumber', 'status','type','contactName']}"
						titleKey="default.filterPane.header" dialog="y" visible="n"
						 showSortPanel="y" showTitle="y" showButtons="y"
						 fullAssociationPathFieldNames="false" />

			<table class="table table-striped table-condensed table-bordered">
				<thead>
					<tr>
						<th>
							${message(code: 'order.orderNumber.label', default: 'Order Number')}
						</th>

						<th>
							${message(code: 'quote.organization.name.label', default: 'Organization')}
						</th>

						<th>
							${message(code: 'order.type.label', default: 'Type')}
						</th>

						<th>
							${message(code: 'order.contractFromDate.label', default: 'From Date')}
						</th>

						<th>
							${message(code: 'order.contractToDate.label', default: 'To Date')}
						</th>

						<th>
							${message(code: 'order.grandTotal.label', default: 'Grand Total')}
						</th>

						<th>
							${message(code: 'order.receviedGrandTotal.label', default: 'Received Amount')}
						</th>

						<th>
							${message(code: 'order.openGrandTotal.label', default: 'Open Amount')}
						</th>

						<th></th>

						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${upcomingRenewals}" var="orderInstance">
						<tr>
							<td>
								${fieldValue(bean: orderInstance, field: "orderNumber")}
							</td>

							<td><g:link controller="organization" action="show"
									id="${orderInstance?.organization?.id}">
									${fieldValue(bean: orderInstance, field: "organization.name")}
								</g:link></td>

							<td>
								${fieldValue(bean: orderInstance, field: "type")}
							</td>

							<td><g:formatDate date="${orderInstance.contractFromDate}" /></td>

							<td><g:formatDate date="${orderInstance.contractToDate}" /></td>

							<td>
								${fieldValue(bean : orderInstance, field : "grandTotal") }
							</td>

							<td>
								${fieldValue(bean : orderInstance, field : "receviedGrandTotal") }
							</td>

							<td>
								${fieldValue(bean : orderInstance, field : "openGrandTotal") }
							</td>

							<td><g:if test="${orderInstance?.taggedForRenewal == true}">
									<g:if
										test="${orderInstance?.renewalStage == 'RENEWAL_LETTER_SENT'}">
										<span class="badge badge-warning"> <i
											class="glyphicon glyphicon-tag glyphicon glyphicon-white"></i> Renewal Letter Sent
										</span>
									</g:if>
									<g:elseif
										test="${orderInstance?.renewalStage == 'RENEWAL_WON'}">
										<span class="badge badge-success"> <i
											class="glyphicon glyphicon-tag glyphicon glyphicon-white"></i> Renewal Won
										</span>
									</g:elseif>
									<g:elseif
										test="${orderInstance?.renewalStage == 'RENEWAL_LOST'}">
										<span class="badge badge-warning"> <i
											class="glyphicon glyphicon-tag glyphicon glyphicon-white"></i> Renewal Lost
										</span>
									</g:elseif>
									<g:else>
										<span class="badge badge-info"> <i
											class="glyphicon glyphicon-tag glyphicon glyphicon-white"></i> Tagged For Renewal
										</span>
									</g:else>
								</g:if></td>

							<td class="link"><g:link action="show"
									id="${orderInstance.id}" controller="order"
									class="btn btn-default btn-xs">Show &raquo;</g:link></td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<bootstrap:paginate params="${filterParams}"
					total="${orderInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
