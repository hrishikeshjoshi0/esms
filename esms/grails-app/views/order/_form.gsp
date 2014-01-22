<%@ page import="com.esms.model.order.Order"%>
<%@ page import="com.esms.model.party.Organization"%>

<script>
function fetchInfo(id) {
	var url = "${createLink(controller:'organization', action:'fetchInfo')}" + "/" + id;
	$.ajax({
	    url:url,
	    dataType: 'xml',	
	    success: function(data) {
		    //alert(data);
	    	$(data).find("contactName").each(function() {  
	    		//find each instance of loc in xml file and wrap it in a link  
	    		//$("#contactName").val($(this).text());
	    		alert($(this).text());
	    	});

	    	$(data).find("assignedTo").each(function() {  
	    		//find each instance of loc in xml file and wrap it in a link  
	    		$("#assignedTo").val($(this).text());
	    	});  

	    	$(data).find("liftInfo.typeOfEnquiry").each(function() {  
	    		//find each instance of loc in xml file and wrap it in a link  
	    		$("#type").val($(this).text());
	    	});  
	    },
	    error: function(request, status, error) {
	      alert(error);
	    },
	    complete: function() {
	    }
	});
}
</script>

<div
	class="form-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'orderNumber', 'error')} required">
	<label for="orderNumber" class="col-md-3 control-label"><g:message
			code="order.orderNumber.label" default="Order Number" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:textField name="orderNumber" required="" readOnly="readOnly" class="form-control"
			value="${orderInstance?.orderNumber}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'orderNumber', 'error')}
		</span>
	</div>
</div>

<g:if test="${orderInstance?.referenceQuoteNumber}">
	<div
		class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'referenceQuoteNumber', 'error')} required">
		<label for="orderNumber" class="col-md-3 control-label"><g:message
				code="order.referenceQuoteNumber.label"
				default="Reference Quote Number" /><span class="required-indicator"> </span></label>
		<div class="col-md-9">
			<g:textField name="referenceQuoteNumber" required="" class="form-control"
				readOnly="readOnly" value="${orderInstance?.referenceQuoteNumber}" />
			<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'referenceQuoteNumber', 'error')}
			</span>
		</div>
	</div>	
</g:if>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'organization', 'error')} required">
	<label for="organization" class="col-md-3 control-label"><g:message
			code="order.organization.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:if test="${params?.action == 'edit'}">
			<g:hiddenField name="organization.id" value="${orderInstance?.organization?.id}"/>
			<g:textField name="organizationName" value="${orderInstance?.organization?.name}" readonly="readonly"/>
		</g:if>
		<g:else>
			<g:select name="organization.id" from="${Organization.list()}" class="form-control"
				optionKey="id" optionValue="name" 
				onchange="fetchInfo(this.value);"
				value="${orderInstance?.organization?.id}" />
		</g:else>
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'status', 'error')} ">
	<label for="status" class="col-md-3 control-label"><g:message
			code="order.status.label" default="Status" /></label>
	<div class="col-md-9">
		<g:if test="${params?.action == 'edit'}">
			<g:textField name="statusName" value="${orderInstance?.status}" readonly="readonly"/>
		</g:if>
		<g:else>
			<g:select name="status" readonly="readOnly" class="form-control"
				from="${orderInstance.constraints.status.inList}"
				value="${orderInstance?.status}" valueMessagePrefix="order.status"
				noSelection="['': '']" />
		</g:else>
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'type', 'error')} ">
	<label for="type" class="col-md-3 control-label"><g:message
			code="order.type.label" default="Type" /></label>
	<div class="col-md-9">
		<g:if test="${params?.action == 'edit'}">
			<g:textField name="typeName" value="${orderInstance?.type}" readonly="readonly"/>
		</g:if>
		<g:else>
			<g:select name="type" from="${orderInstance.constraints.type.inList}" class="form-control"
				value="${orderInstance?.type}" valueMessagePrefix="order.type"
				noSelection="['': '']" />
		</g:else>
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'type', 'error')}
		</span>
	</div>
</div>

<g:if test="${orderInstance?.type = 'SERVICE' }">
	<div
		class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'contractFromDate', 'error')} ">
		<label for="contractFromDate" class="col-md-3 control-label"><g:message
				code="order.contractFromDate.label" default="From Date" /><span
			class="required-indicator">*</span></label>
		<div class="col-md-9">
			<richui:dateChooser name="contractFromDate" value="${orderInstance?.contractFromDate}" class="form-control" />
			<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'contractFromDate', 'error')}
			</span>
		</div>
	</div>

	<div
		class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'contractToDate', 'error')} ">
		<label for="contractToDate" class="col-md-3 control-label"><g:message
				code="order.expiryDate.label" default="To Date" /></label>
		<div class="col-md-9">
			<richui:dateChooser name="contractToDate" value="${orderInstance?.contractToDate}" class="form-control" />
			<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'contractToDate', 'error')}
			</span>
		</div>
	</div>
</g:if>
<%--<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'issueDate', 'error')} required">
	<label for="issueDate" class="col-md-3 control-label"><g:message
			code="order.issueDate.label" default="Issue Date" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:datePicker name="issueDate" precision="day" class="form-control"
			value="${orderInstance?.issueDate}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'issueDate', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'expiryDate', 'error')} ">
	<label for="expiryDate" class="col-md-3 control-label"><g:message
			code="order.expiryDate.label" default="Expiry Date" /></label>
	<div class="col-md-9">
		<g:datePicker name="expiryDate" precision="day" class="form-control"
			value="${orderInstance?.expiryDate}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'expiryDate', 'error')}
		</span>
	</div>
</div>
--%>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'assignedTo', 'error')} ">
	<label for="contactName" class="col-md-3 control-label"><g:message
			code="order.assignedTo.label" default="Assigned To" /></label>
	<div class="col-md-9">
		<g:textField name="assignedTo" value="${orderInstance?.assignedTo}" class="form-control" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'assignedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'contactName', 'error')} ">
	<label for="contactName" class="col-md-3 control-label"><g:message
			code="order.contactName.label" default="Contact Name" /></label>
	<div class="col-md-9">
		<g:textField name="contactName" value="${orderInstance?.contactName}" class="form-control" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'contactName', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'relatedTo', 'error')} ">
	<label for="type" class="col-md-3 control-label"><g:message
			code="order.relatedTo.label" default="Related To" /></label>
	<div class="col-md-9">
		<g:select name="relatedTo" class="form-control"
			from="${orderInstance.constraints.relatedTo.inList}"
			value="${orderInstance?.relatedTo}"
			valueMessagePrefix="order.relatedTo" noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'relatedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'relatedToValue', 'error')} ">
	<label for="relatedToValue" class="col-md-3 control-label"><g:message
			code="order.relatedToValue.label" default="Related To Value" /></label>
	<div class="col-md-9">
		<g:textField name="relatedToValue" class="form-control"
			value="${orderInstance?.relatedToValue}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'relatedToValue', 'error')}
		</span>
	</div>
</div>

<%--<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'totalAmount', 'error')} required">
	<label for="totalAmount" class="col-md-3 control-label"><g:message
			code="order.totalAmount.label" default="Total Amount" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="totalAmount" step="any" required=""
			value="${orderInstance.totalAmount}" />
		<span class="help-inline">
			${hasErrors(bean: orderInstance, field: 'totalAmount', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'totalTax', 'error')} required">
	<label for="totalTax" class="col-md-3 control-label"><g:message
			code="order.totalTax.label" default="Total Tax" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="totalTax" step="any" required=""
			value="${orderInstance.totalTax}" />
		<span class="help-inline">
			${hasErrors(bean: orderInstance, field: 'totalTax', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'totalDiscount', 'error')} required">
	<label for="totalDiscount" class="col-md-3 control-label"><g:message
			code="order.totalDiscount.label" default="Total Discount" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="totalDiscount" step="any" required=""
			value="${orderInstance.totalDiscount}" />
		<span class="help-inline">
			${hasErrors(bean: orderInstance, field: 'totalDiscount', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'grandTotal', 'error')} required">
	<label for="grandTotal" class="col-md-3 control-label"><g:message
			code="order.grandTotal.label" default="Grand Total" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:field type="number" name="grandTotal" step="any" required=""
			value="${orderInstance.grandTotal}" />
		<span class="help-inline">
			${hasErrors(bean: orderInstance, field: 'grandTotal', 'error')}
		</span>
	</div>
</div>

--%>
<div
	class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'description', 'error')} ">
	<label for="description" class="col-md-3 control-label"><g:message
			code="order.description.label" default="Description" /></label>
	<div class="col-md-9">
		<g:textField name="description" value="${orderInstance?.description}" class="form-control" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'description', 'error')}
		</span>
	</div>
</div>