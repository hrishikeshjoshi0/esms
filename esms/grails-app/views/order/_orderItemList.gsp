<%@page import="com.esms.model.calendar.Event"%>
<%@ page import="com.esms.model.order.PurchaseOrder"%>
<%@ page import="com.esms.model.product.Product"%>

<div class="pull-right">
	<g:if test="${orderInstance?.status != 'INVOICED' && orderInstance?.status != 'PAID'}">
		<bs3:modalLink href="${createLink(controller:'order',action:'createOrderItem',params:['order.id':orderInstance?.id])}"
			id="createOrderItem" title="Create Order Item"/>
	</g:if>
</div>

<!-- Quotes -->
<table class="table table-striped table-condensed table-bordered ">
	<thead>
		<tr>
			<g:sortableColumn property="lineNumber"
				title="${message(code: 'orderItem.lineNumber.label', default: 'Line Number')}" />
			<g:sortableColumn property="productNumber"
				title="${message(code: 'orderItem.productNumber.label', default: 'Product Number')}" />
			<g:sortableColumn property="quantity"
				title="${message(code: 'orderItem.quantity.label', default: 'Quantity')}" />
			<g:sortableColumn property="unitPrice"
				title="${message(code: 'orderItem.unitPrice.label', default: 'Unit Price')}" />
			<g:sortableColumn property="tax"
				title="${message(code: 'orderItem.tax.label', default: 'Tax')}" />
			<g:sortableColumn property="discount"
				title="${message(code: 'orderItem.discount.label', default: 'Discount')}" />
			<g:sortableColumn property="lineTotalAmount"
				title="${message(code: 'orderItem.lineTotalAmount.label', default: 'Line Total Amount')}" />
			<g:sortableColumn property="percentageInvoiced"
				title="${message(code: 'orderItem.percentageInvoiced.label', default: 'Invoiced Amount (%)')}" />
			<g:sortableColumn property="amountInvoiced"
				title="${message(code: 'orderItem.amountInvoiced.label', default: 'Invoiced Amount')}" />
			<th>
				Assigned To (Vendor)
			</th>
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${orderInstance?.orderItems?.sort{a,b -> a.lineNumber <=> b.lineNumber}}" var="orderItemInstance" status="stat">
			<g:set var="product" value="${Product.findByProductNumber(orderItemInstance.productNumber)}"/>
			<g:set var="eventInstance"
				value="${Event.findByRelatedToAndRelatedToValue('ORDER',orderInstance?.orderNumber) }" />
			<tr>
				<td>
					${fieldValue(bean: orderItemInstance, field: "lineNumber")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "productNumber")} <br/>
					${product?.productName}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "quantity")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "unitPrice")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "tax")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "discount")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "lineTotalAmount")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "percentageInvoiced")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "amountInvoiced")}
				</td>
				<g:if test="${orderItemInstance.relatedOrderNumber}">
					<g:set var="purchaseOrder" value="${PurchaseOrder.findByPurchaseOrderNumber(orderItemInstance.relatedOrderNumber)}"/>
					<td>
						${purchaseOrder?.vendorName}
					</td>
				</g:if>
				<g:else>
					<td></td>
				</g:else>
				<td>
					<g:if test="${product?.productName != 'DISCOUNT' }">
						<bs3:modalLink href="${createLink(controller:'order',action:'assignOrderItem',params:['id':orderItemInstance?.id])}"
								id="assignOrderItem${stat}" title="Assignment"/>
					</g:if>
				</td>
				<td class="link">
					<g:link action="show" controller="orderItem" id="${orderItemInstance.id}" class="lnk">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pgn">
	<bootstrap:paginate total="${orderInstance?.orderItems?orderInstance?.orderItems.size():0}" />
</div>