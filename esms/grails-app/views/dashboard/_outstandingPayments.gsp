<%@ page import="com.esms.model.order.*"%>
<%@page import="com.esms.model.calendar.Event"%>

<div class="page-header">
	<h3>Outstanding Payments</h3>
</div>

<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'invoice.orderNumber.label', default: 'Invoice Number')}
			</th>	

			<th>
				${message(code: 'quote.organization.name.label', default: 'Organization')}
			</th>	

			<th>
				${message(code: 'invoice.grandTotal.label', default: 'Grand Total')}
			</th>
			
			<th>
				${message(code: 'invoice.openGrandTotal.label', default: 'Outstanding Amount')}
			</th>
			
			<th>
				${message(code: 'invoice.receviedGrandTotal.label', default: 'Received Amount')}
			</th>	

			<th>
				${message(code: 'invoice.type.label', default: 'Type')}
			</th>
			
			<th>
				${message(code: 'invoice.referenceOrderNumber.label', default: 'Order Number')}
			</th>

		</tr>
	</thead>
	<tbody>
		<g:if
			test="${openInvoices != null && openInvoices.size() != 0}">
				<g:each in="${openInvoices?.sort{a,b -> a.invoiceNumber <=> b.invoiceNumber}}" var="invoiceInstance">
				<g:if test="${eventInstance?.status != 'CLOSED'}">
					<tr>
						<td>
							<g:link controller="invoice" action="show" class="lnk "
								id="${invoiceInstance.id}">
								${fieldValue(bean: invoiceInstance, field: "invoiceNumber")}
							</g:link>
						</td>
	
						<td><g:link controller="organization" action="show"
								id="${invoiceInstance?.organization?.id}">
								${fieldValue(bean: invoiceInstance, field: "organization.name")}
							</g:link>
						</td>
	
						<td>
							${fieldValue(bean : invoiceInstance, field : "grandTotal") }
						</td>
						
						<td>
							${fieldValue(bean : invoiceInstance, field : "openGrandTotal") }
						</td>
						
						<td>
							${fieldValue(bean : invoiceInstance, field : "receviedGrandTotal") }
						</td>
						
						<td>
							${fieldValue(bean: invoiceInstance, field: "type")}
						</td>
						
						<td>
							${fieldValue(bean: invoiceInstance, field: "referenceOrderNumber")}
						</td>
					</tr>
					
				</g:if>	
			</g:each>
		</g:if>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="7" class="link">
				<g:link class="lnk " controller="invoice" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
