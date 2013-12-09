

<%@ page import="com.esms.model.order.OrderItem"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'orderItem.label', default: 'OrderItem')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Order Line # ${orderItemInstance?.lineNumber}
					|
					${orderItemInstance?.order?.orderNumber}
				</h3>
			</div>
			
			<g:form>
				<g:hiddenField name="id" value="${orderItemInstance?.id}" />
				<div class="form-group">
					<g:link class="btn btn-default btn-sm" action="edit" id="${orderItemInstance?.id}">
						
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-sm btn-default" type="submit" name="_action_delete">
						
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="orderItem.lineNumber.label" default="Line Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderItemInstance}" field="lineNumber" />
				</dd>


				<dt>
					<g:message code="orderItem.quantity.label" default="Quantity" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderItemInstance}" field="quantity" />
				</dd>


				<dt>
					<g:message code="orderItem.unitPrice.label" default="Unit Price" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderItemInstance}" field="unitPrice" />
				</dd>


				<dt>
					<g:message code="orderItem.tax.label" default="Tax" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderItemInstance}" field="tax" />
				</dd>


				<dt>
					<g:message code="orderItem.lineTotalAmount.label"
						default="Line Total Amount" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderItemInstance}" field="lineTotalAmount" />
				</dd>


				<dt>
					<g:message code="orderItem.discount.label" default="Discount" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderItemInstance}" field="discount" />
				</dd>


				<dt>
					<g:message code="orderItem.productNumber.label"
						default="Product Number" />
				</dt>

				<dd>
					<g:fieldValue bean="${orderItemInstance}" field="productNumber" />
				</dd>


				<dt>
					<g:message code="orderItem.order.label" default="Order" />
				</dt>

				<dd>
					<g:link controller="order" action="show"
						id="${orderItemInstance?.order?.id}">
						${orderItemInstance?.order?.orderNumber}
					</g:link>
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>
