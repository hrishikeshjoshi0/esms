<g:each in="${upcomingRenewals}" var="orderInstance">
	<tr class="${orderInstance?.isRenewed()?'sucess':''}">
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

		<td>
			<g:if test="${orderInstance?.taggedForRenewal == true}">
				${orderInstance?.getRenewalState()}			
			</g:if>
		</td>

		<td class="link"><g:link action="show" id="${orderInstance.id}"
				controller="order" class="lnk ">Show &raquo;</g:link></td>
	</tr>
</g:each>