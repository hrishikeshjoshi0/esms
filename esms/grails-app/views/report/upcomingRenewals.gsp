
<%@ page import="com.esms.model.order.Order"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName" value="Upcoming Renewals" />
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

						<th>Total Amount</th>

						<th>Invoiced Amount</th>

						<th>Received Amount</th>

						<th>Pending Invoice Amount</th>

						<th>Renewal Process</th>

						<th></th>
					</tr>
				</thead>
				<tbody id="updateDiv">
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
								${orderInstance?.organization?.activeServiceContract()}
							</td>

							<td><g:formatDate date="${orderInstance.contractFromDate}" /></td>

							<td><g:formatDate date="${orderInstance.contractToDate}" /></td>

							<td><g:formatNumber type="number"
									number="${orderInstance?.grandTotal}" /></td>

							<td><g:formatNumber type="number"
									number="${orderInstance?.invoicedGrandTotal}" /></td>

							<td><g:formatNumber type="number"
									number="${orderInstance?.getReceivedAmount()}" /></td>

							<td><g:formatNumber type="number"
									number="${orderInstance?.pendingInvoiceGrandTotal}" /></td>

							<td><g:if test="${orderInstance?.taggedForRenewal == true}">
									${orderInstance?.getRenewalState()}
								</g:if></td>

							<td class="link"><g:link action="show"
									id="${orderInstance.id}" controller="order" class="lnk ">Show &raquo;</g:link></td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pgn">
				<bootstrap:paginate params="${filterParams}"
					total="${orderInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
