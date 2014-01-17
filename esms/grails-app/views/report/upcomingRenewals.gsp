
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
			<script>
				function updateDiv() {
					$('#updateDiv').html('');
					$('#updateDiv').showSpinner();
				}
			</script>
			<div class="page-header">
				<h3>
					Upcoming Renewals for 
					<g:select name="upcomingRenewalMonthParam" from="${filteredMonthMap}"
							optionKey="key" optionValue="value"
							value="${params.upcomingRenewalMonthParam}"
							onchange="${remoteFunction(action: 'upcomingRenewals',onLoading:'updateDiv();',
			                       update: [success: 'updateDiv'],method:'GET',onFailure:'$.growl.error({ title: "Error!", message: "There was some technical error." });',
			                       params: '\'upcomingRenewalMonthParam=\' + this.value + \'&upcomingRenewalYearParam=\' + document.getElementById(\'upcomingRenewalYearParam\').value')}"/>
									
					<g:select name="upcomingRenewalYearParam" from="${years}" 
							value="${params.upcomingRenewalYearParam}"
							onchange="${remoteFunction(action: 'upcomingRenewals',onLoading:'updateDiv();',
			                       update: [success: 'updateDiv'],method:'GET',onFailure:'$.growl.error({ title: "Error!", message: "There was some technical error." });',
			                       params: '\'upcomingRenewalMonthParam=\' + document.getElementById(\'upcomingRenewalMonthParam\').value + \'&upcomingRenewalYearParam=\' + this.value')}"/>                       
				</h3>
			</div>

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
							${message(code: 'order.type.label', default: 'Contract Type')}
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
			
							<td><g:formatNumber type="number" number="${orderInstance?.grandTotal}" /></td>
			
							<td><g:formatNumber type="number" number="${orderInstance?.invoicedGrandTotal}" />
							</td>
					
							<td><g:formatNumber type="number"
									number="${orderInstance?.getReceivedAmount()}" /></td>
					
							<td>
								<g:formatNumber type="number"
									number="${orderInstance?.pendingInvoiceGrandTotal}" />
							</td>
					
							<td>
								<g:if test="${orderInstance?.taggedForRenewal == true}">
											${orderInstance?.getRenewalState()}			
								</g:if>
							</td>
							
							<td class="link"><g:link action="show" id="${orderInstance.id}" controller="order"
									class="lnk ">Show &raquo;</g:link></td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pgn">
				<bootstrap:paginate params="${filterParams}"
					total="${upcomingRenewalsTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
