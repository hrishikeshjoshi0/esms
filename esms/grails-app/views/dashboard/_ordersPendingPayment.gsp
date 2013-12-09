<%@ page import="com.esms.model.order.*"%>
<%@page import="com.esms.model.calendar.Event"%>

<div class="page-header">
	<h3>Invoices Pending Payments</h3>
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
				${message(code: 'invoice.openGrandTotal.label', default: 'Pending Amount')}
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
			
			<th>
				Assigned To
			</th>
			<th>
				Starts
			</th>
			<th>
				Ends
			</th>
			<th>
				Status
			</th>	

			<th></th>
			
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:if
			test="${openInvoices != null && openInvoices.size() != 0}">
				<g:each in="${openInvoices}" var="invoiceInstance">
				<g:set var="eventInstance" value="${Event.findByRelatedToAndRelatedToValue('ORDER',invoiceInstance?.referenceOrderNumber) }" />	
				<tr>
					<td>
						${fieldValue(bean: invoiceInstance, field: "invoiceNumber")}
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
					
					<td>
						${order?.assignedTo}
					</td>
					<td>
						${eventInstance?.startTime}
					</td>
					<td>
						${eventInstance?.endTime}
					</td>
					<td>
						${eventInstance?.status}
					</td>
					<td class="link">
						<g:if test="${eventInstance}">
							<g:link controller="event" action="show" id="${eventInstance?.id}">
								Show Event &raquo;
							</g:link>
						</g:if>
						<g:else>
							No Event Created
						</g:else>
					</td>
					
					<td class="link"><g:link controller="invoice" action="show" class="lnk "
							id="${invoiceInstance.id}">Show &raquo;</g:link></td>
				</tr>
			</g:each>
		</g:if>
		<g:else>
			<tr>
				<th colspan="13">
					<h5>No Records Found !</h5>
				</th>
			</tr>
		</g:else>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="13" class="link">
				<g:link class="lnk " controller="invoice" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
