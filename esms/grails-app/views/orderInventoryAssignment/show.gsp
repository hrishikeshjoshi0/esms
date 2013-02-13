

<%@ page import="com.esms.model.order.OrderInventoryAssignment" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'orderInventoryAssignment.label', default: 'OrderInventoryAssignment')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>
			
			<g:form>
				<g:hiddenField name="id" value="${orderInventoryAssignmentInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${orderInventoryAssignmentInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>

			<dl class="dl-horizontal">
				
							<dt><g:message code="orderInventoryAssignment.status.label" default="Status" /></dt>
						
							<dd><g:fieldValue bean="${orderInventoryAssignmentInstance}" field="status"/></dd>
						
				
							<dt><g:message code="orderInventoryAssignment.quantity.label" default="Quantity" /></dt>
						
							<dd><g:fieldValue bean="${orderInventoryAssignmentInstance}" field="quantity"/></dd>
						
				
							<dt><g:message code="orderInventoryAssignment.isPosted.label" default="Is Posted" /></dt>
						
							<dd><g:formatBoolean boolean="${orderInventoryAssignmentInstance?.isPosted}" /></dd>
						
				
							<dt><g:message code="orderInventoryAssignment.order.label" default="Order" /></dt>
						
							<dd>
								<g:link controller="order" action="show" id="${orderInventoryAssignmentInstance?.order?.id}">
									${orderInventoryAssignmentInstance?.order?.orderNumber}
								</g:link>
							</dd>
						
				
							<dt><g:message code="orderInventoryAssignment.productInventory.label" default="Product Inventory" /></dt>
						
							<dd>
								<g:link controller="productInventory" action="show" id="${orderInventoryAssignmentInstance?.productInventory?.id}">
									${orderInventoryAssignmentInstance?.productInventory?.product.productName}
								</g:link>
							</dd>
						
				
			</dl>
		</div>
	</div>
</body>
</html>
