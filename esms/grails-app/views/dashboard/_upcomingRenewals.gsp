<script>
	function updateDiv() {
		$('#updateDiv').html('');
		$('#updateDiv').html('Loading...');
	}
</script>
<div class="dashboard-widget-header">
	<h5>
		Upcoming Renewals for 
		<g:select name="upcomingRenewalMonthParam" from="${filteredMonthMap}"
				optionKey="key" optionValue="value"
				value="${params.upcomingRenewalMonthParam}"
				onchange="${remoteFunction(action: 'upcomingRenewals',onLoading:'updateDiv();',
                       update: [success: 'updateDiv'],method:'GET',onFailure:'alert(\'Error\');',
                       params: '\'upcomingRenewalMonthParam=\' + this.value + \'&upcomingRenewalYearParam=\' + document.getElementById(\'upcomingRenewalYearParam\').value')}"/>
						
		<g:select name="upcomingRenewalYearParam" from="${years}" 
				value="${params.upcomingRenewalYearParam}"
				onchange="${remoteFunction(action: 'upcomingRenewals',onLoading:'updateDiv();',
                       update: [success: 'updateDiv'],method:'GET',onFailure:'alert(\'Error\');',
                       params: '\'upcomingRenewalMonthParam=\' + document.getElementById(\'upcomingRenewalMonthParam\').value + \'&upcomingRenewalYearParam=\' + this.value')}"/>                       
	</h5>
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

			<th></th>
			
			<th></th>
			
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
					${fieldValue(bean: orderInstance, field: "type")}
				</td>

				<td><g:formatDate date="${orderInstance.contractFromDate}" /></td>

				<td><g:formatDate date="${orderInstance.contractToDate}" /></td>

				<td>
					${orderInstance?.grandTotal}
				</td>
							
				<td>
					${orderInstance?.invoicedGrandTotal}
				</td>
							
				<td>
					${orderInstance?.getReceivedAmount()}
				</td>
							
				<td>
					${fieldValue(bean : orderInstance, field : "pendingInvoiceGrandTotal") }
				</td>
				
				<td>
					<g:if test="${orderInstance?.taggedForRenewal == true}">
						<g:if test="${orderInstance?.renewalStage == 'RENEWAL_LETTER_SENT'}">
							<span class="badge badge-warning">
								
								Renewal Letter Sent
							</span>
						</g:if>
						<g:elseif test="${orderInstance?.renewalStage == 'RENEWAL_WON'}">
							<span class="badge badge-success">
								
								Renewal Won
							</span>
						</g:elseif>
						<g:elseif test="${orderInstance?.renewalStage == 'RENEWAL_LOST'}">
							<span class="badge badge-warning">
								
								Renewal Lost
							</span>
						</g:elseif>
						<g:else>
							<span class="badge badge-info">
								
								Tagged For Renewal
							</span>
						</g:else>				
					</g:if>
				</td>

				<td class="link"><g:link action="show" id="${orderInstance.id}" controller="order"
						class="btn btn-default btn-sm">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th class="link" colspan="10">
				<g:link controller="report" action="upcomingRenewals">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
<div class="pagination">
	<bootstrap:paginate params="${filterParams}"
		total="${upcomingRenewals?.size()}" />
</div>