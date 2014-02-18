<%@page import="com.esms.model.order.Order"%>
<%@ page import="com.esms.model.calendar.Event"%>
<%@ page import="com.esms.model.invoice.Invoice"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'invoice.label', default: 'Invoice')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<filterpane:filterPane domain="com.esms.model.invoice.Invoice"
				filterProperties="${['invoiceNumber', 'status','type','contactName']}"
				associatedProperties="${['organization.name']}"
				titleKey="default.filterPane.header" dialog="y" visible="n"
				showSortPanel="y" showTitle="y" showButtons="y"
				fullAssociationPathFieldNames="false" />

			<table class="table table-striped table-bordered mediaTable">
				<thead>
					<tr>
						<th>
							${message(code: 'invoice.invoiceNumber.label', default: 'Invoice Number')}
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

						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:if test="${invoiceInstanceList != null && invoiceInstanceList.size() != 0}">
						<g:each
							in="${invoiceInstanceList?.sort{a,b -> a.invoiceNumber <=> b.invoiceNumber}}"
							var="invoiceInstance">
							<g:if test="${invoiceInstance?.referenceOrderNumber}">
								<g:set var="eventInstance"
									value="${Event.findByRelatedToAndRelatedToValue('ORDER',invoiceInstance?.referenceOrderNumber) }" />
							</g:if>
							<g:if test="${eventInstance?.status != 'CLOSED'}">
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

									<td>
										${fieldValue(bean: invoiceInstance, field: "referenceOrderNumber")}
									</td>

									<td class="link"><g:link controller="invoice"
											action="show" class="lnk " id="${invoiceInstance.id}">Show &raquo;</g:link></td>
								</tr>

							</g:if>
						</g:each>
					</g:if>
				</tbody>
			</table>
			<div class="pgn">
				<bootstrap:paginate total="${invoiceInstanceTotal}" />
			</div>
		</div>
	</div>
</body>
</html>
