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

		<td class="link"><g:link action="show" id="${orderInstance.id}"
				controller="order" class="lnk ">Show &raquo;</g:link></td>
	</tr>
</g:each>