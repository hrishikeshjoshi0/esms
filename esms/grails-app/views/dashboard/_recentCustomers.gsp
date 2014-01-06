<%@page import="com.esms.model.product.Product"%>
<%@ page import="com.esms.model.party.*"%>

<div class="page-header">
	<h3>Recent Service Contracts</h3>
</div>


<table class="table table-striped table-bordered mediaTable">
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
	<tbody>
		<g:each in="${recentOrders?.sort{a,b -> a.orderNumber <=> b.orderNumber}}" var="orderInstance">
			<g:set var="organization"
				value="${orderInstance.organization}" />
			<g:set var="addressInstance"
				value="${Address.findByAddressTypeAndParty('BILLING',organization) }" />
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
				
				<td class="link">
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
			</tr>
		</g:each>
	</tbody>
	<tfoot>
			<tr>
				<th colspan="12" class="link">
					<g:link controller="order" action="list" class="lnk ">Show All Orders &raquo;</g:link>
				</th>				
			</tr>
		</tfoot>
</table>