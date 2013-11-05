<%@ page import="com.esms.model.order.*"%>

<div class="dashboard-widget-header">
	<h1>Invoices Pending Payments</h1>
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

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:if
			test="${openInvoices != null && openInvoices.size() != 0}">
			<g:each in="${openInvoices}" var="invoiceInstance">
				<tr>
					<td>
						${fieldValue(bean: invoiceInstance, field: "invoiceNumber")}
					</td>

					<td><g:link controller="organization" action="show"
							id="${invoiceInstance?.organization?.id}">
							${fieldValue(bean: invoiceInstance, field: "organization.name")}
						</g:link></td>

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
					<td class="link"><g:link controller="invoice" action="show"
							id="${invoiceInstance.id}">Show &raquo;</g:link></td>
				</tr>
			</g:each>
		</g:if>
		<g:else>
			<tr>
				<th colspan="8">
					<h4 style="color: red;">No Records Found !</h4>
				</th>
			</tr>
		</g:else>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="8" class="link">
				<g:link controller="invoice" action="list">Show All &raquo;</g:link>
			</th>				
		</tr>
	</tfoot>
</table>
