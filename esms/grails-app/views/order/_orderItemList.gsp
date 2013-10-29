<%@ page import="com.esms.model.order.PurchaseOrder"%>
<%@ page import="com.esms.model.product.Product"%>

<div class="pull-right">
	<g:if test="${orderInstance?.status != 'INVOICED' && orderInstance?.status != 'PAID'}">
		<a data-toggle="modal" href="#" data-target="#orderItemModal"
			role="button" class="btn"> <i class="icon-plus"></i> New Item
		</a>
	</g:if>
</div>

<!-- Quotes -->
<table class="table table-striped table-hover">
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
				<a ref="#">
					Assigned To (Vendor)
				</a>
			</th>
			<th>
				<a ref="#">
					Status
				</a>
			</th>		
			<th></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${orderInstance?.orderItems}" var="orderItemInstance">
			<tr>
				<td>
					${fieldValue(bean: orderItemInstance, field: "lineNumber")}
				</td>
				<td>
					${fieldValue(bean: orderItemInstance, field: "productNumber")} <br/>
					${Product.findByProductNumber(orderItemInstance.productNumber)?.productName}
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
					<td>
						${purchaseOrder?.status}
					</td>
				</g:if>
				<g:else>
					<td></td>
					<td></td>
				</g:else>
				<td>
					<a href="#" class="btn open-AssignOrderItem" data-id="${orderItemInstance?.id}"
						role="button" class="btn">Assign
					</a>
				</td>
				<td class="link"><g:link action="show" controller="orderItem"
						id="${orderItemInstance.id}" class="btn btn-small">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${orderInstance?.orderItems?orderInstance?.orderItems.size():0}" />
</div>

<!-- Modal -->
<div id="orderItemModal" class="modal hide fade" tabindex="-1" style="width:70%;top:50%;left:40%;"
	role="dialog"
	data-remote="<g:createLink controller="order" action="createOrderItem" params="[orderId:orderInstance?.id]"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Order Item</h3>
	</div>
	<g:form controller="order" action="createOrderItem" method="POST">
		<g:hiddenField name="order.id" value="${orderInstance?.id}" />
		<div class="modal-body"></div>
		<div class="modal-footer">
			<div class="form-actions">
				<button type="submit" class="btn btn-primary create">
					<i class="icon-ok icon-white"></i>
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>

<div id="purchaseOrderModal" class="modal hide fade" tabindex="-1" style="width:70%;top:50%;left:40%;"
	role="dialog"
	data-remote="<g:createLink controller="order" action="assignOrderItem" params="[orderId:orderInstance?.id]"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">Assign Order Item</h3>
	</div>
	<g:form controller="order" action="assignOrderItem" method="POST">
		<g:hiddenField name="order.id" value="${orderInstance?.id}" />
		<g:hiddenField name="orderItemInstanceId" value=""/>
		<div class="modal-body"></div>
		<div class="modal-footer">
			<div class="form-actions">
				<button type="submit" class="btn btn-primary create">
					<i class="icon-ok icon-white"></i>
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>

<script>
	$(document).on("click", ".open-AssignOrderItem", function () {
	    var orderItemId = $(this).data('id');
	    $("#orderItemInstanceId").attr('value',orderItemId);
	    //alert($("#orderItemInstanceId").val());	    
	    $('#purchaseOrderModal').modal('show');
	});
</script>