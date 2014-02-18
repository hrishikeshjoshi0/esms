<script>
	function updateDiv() {
		$('#updateDiv').html('');
		$('#updateDiv').showSpinner();
	}
</script>
<div class="page-header">
	<h5>
		<span style="padding:2px;">
			By month:
		</span>
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
				${message(code: 'order.type.label', default: 'Contract Type')}
			</th>

			<th>
				${message(code: 'order.contractToDate.label', default: 'To Date')}
			</th>

			<th>Total Amount</th>
							
			<th>Renewal Process</th>
			
		</tr>
	</thead>
	<tbody id="updateDiv">
		<g:each in="${upcomingRenewals}" var="orderInstance">
			<tr>
				<td>
					<g:link action="show" id="${orderInstance.id}" controller="order"
								class="lnk ">
					${fieldValue(bean: orderInstance, field: "orderNumber")}
					</g:link>
				</td>

				<td><g:link controller="organization" action="show"
						id="${orderInstance?.organization?.id}">
						${fieldValue(bean: orderInstance, field: "organization.name")}
					</g:link></td>

				<td>
					${orderInstance?.organization?.activeServiceContract()}
				</td>

				<td><g:formatDate date="${orderInstance.contractToDate}" /></td>

				<td><g:formatNumber type="number" number="${orderInstance?.grandTotal}" /></td>

				<td>
					<g:if test="${orderInstance?.taggedForRenewal == true}">
								${orderInstance?.getRenewalState()}			
					</g:if>
				</td>
				
				<%--<td class="link">
					<div class="btn-group">
						<g:link action="show" id="${orderInstance.id}" controller="order"
								class="lnk ">Show</g:link>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span></a>			
						<ul class="dropdown-menu pull-right">
							<li>
								<g:link controller="order" action="archive" id="${orderInstance.id}"
									class="lnk archiveLink">Archive</g:link>
							</li>
						</ul>
					</div>	
				</td>
			--%></tr>
		</g:each>
	</tbody>
	<tfoot>
		<tr>
			<th class="link" colspan="6">
				<g:link controller="report" action="upcomingRenewals" class="lnk ">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>