<%@ page import="com.esms.model.product.Product"%>
<div class="row">
	<div class="col-md-12">
		<g:hasErrors bean="${orderInstance}">
			<bootstrap:alert class="alert-danger">
				<ul>
					<g:eachError bean="${orderInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</bootstrap:alert>
		</g:hasErrors>

		<div class="well">
			<g:form class="form-horizontal" controller="order"
				action="assignOrderItem">
				<fieldset>
					<div class="row">
						<div class="col-md-6">
							<g:hiddenField name="orderItemId" value="${orderItem?.id}"/>
							<div
								class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'purchaseOrderNumber', 'error')} required">
								<label for="purchaseOrderNumber" class="col-md-3 control-label"><g:message
										code="purchaseOrder.purchaseOrderNumber.label"
										default="Purchase Order Number" /><span class="required-indicator">*</span></label>
								<div class="col-md-9">
									<g:textField name="purchaseOrderNumber" required="" readOnly="readOnly" class="form-control"
										value="${purchaseOrderInstance?.purchaseOrderNumber}" />
									<span class="help-inline">
										${hasErrors(bean: purchaseOrderInstance, field: 'purchaseOrderNumber', 'error')}
									</span>
								</div>
							</div>
							
							<%--<div
								class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'status', 'error')} ">
								<label for="status" class="col-md-3 control-label"><g:message
										code="purchaseOrder.status.label" default="Status" /></label>
								<div class="col-md-9">
									<g:select name="status" class="form-control"
										from="${purchaseOrderInstance.constraints.status.inList}"
										value="${purchaseOrderInstance?.status}"
										valueMessagePrefix="purchaseOrder.status" noSelection="['': '']" />
									<span class="help-inline">
										${hasErrors(bean: purchaseOrderInstance, field: 'status', 'error')}
									</span>
								</div>
							</div>
							--%>
							
							<div
								class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'vendorName', 'error')} ">
								<label for="vendorName" class="col-md-3 control-label"><g:message
										code="purchaseOrder.vendorName.label" default="Vendor Name" /></label>
								<div class="col-md-9">
									<g:textField name="vendorName" class="form-control"
										value="${purchaseOrderInstance?.vendorName}" />
									<span class="help-inline">
										${hasErrors(bean: purchaseOrderInstance, field: 'vendorName', 'error')}
									</span>
								</div>
							</div>
							
							<%--<div
								class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'contactName', 'error')} ">
								<label for="contactName" class="col-md-3 control-label"><g:message
										code="purchaseOrder.contactName.label" default="Contact Name" /></label>
								<div class="col-md-9">
									<g:textField name="contactName" class="form-control"
										value="${purchaseOrderInstance?.contactName}" />
									<span class="help-inline">
										${hasErrors(bean: purchaseOrderInstance, field: 'contactName', 'error')}
									</span>
								</div>
							</div>
							
							<div
								class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'workCompleted', 'error')} ">
								<label for="workCompleted" class="col-md-3 control-label"><g:message
										code="purchaseOrder.workCompleted.label" default="Work Completed" /></label>
								<div class="col-md-9">
									<g:field type="number" name="workCompleted" class="form-control" min="0" max="100"
										value="${purchaseOrderInstance?.workCompleted}" />
									<span class="help-inline">
										${hasErrors(bean: purchaseOrderInstance, field: 'workCompleted', 'error')}
									</span>
								</div>
							</div>
							--%>
							
							<div
								class="form-group fieldcontain ${hasErrors(bean: purchaseOrderInstance, field: 'description', 'error')} ">
								<label for="description" class="col-md-3 control-label"><g:message
										code="purchaseOrder.description.label" default="Description" /></label>
								<div class="col-md-9">
									<g:textArea name="description" class="form-control"
										value="${purchaseOrderInstance?.description}" />
									<span class="help-inline">
										${hasErrors(bean: purchaseOrderInstance, field: 'description', 'error')}
									</span>
								</div>
							</div>
							
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-md-10 col-md-offset-2">
							<button type="submit" class="btn btn-sm btn-primary">
								<g:message code="default.button.save.label" default="Save" />
							</button>
						</div>
					</div>
				</fieldset>
			</g:form>
		</div>
	</div>
</div>
