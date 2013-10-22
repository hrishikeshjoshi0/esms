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
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'orderNumber', 'error')} required">
	<label for="orderNumber" class="control-label"><g:message
			code="order.orderNumber.label" default="Order Number" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="orderNumber" required="" readOnly="readOnly"
			value="${orderInstance?.orderNumber}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'orderNumber', 'error')}
		</span>
	</div>
</div>

<g:if test="${orderInstance?.referenceQuoteNumber}">
<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'referenceQuoteNumber', 'error')} required">
	<label for="orderNumber" class="control-label"><g:message
			code="order.referenceQuoteNumber.label"
			default="Reference Quote Number" /><span class="required-indicator"> </span></label>
	<div class="controls">
		<g:textField name="referenceQuoteNumber" required=""
			readOnly="readOnly" value="${orderInstance?.referenceQuoteNumber}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'referenceQuoteNumber', 'error')}
		</span>
	</div>
</div>
</g:if>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'organization', 'error')} required">
	<label for="organization" class="control-label"><g:message
			code="order.organization.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select name="organization.id" from="${Organization.list()}"
			optionKey="id" optionValue="name" class="input-xxlarge"
			onchange="fetchInfo(this.value);"
			value="${quoteInstance?.organization?.id}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'status', 'error')} ">
	<label for="status" class="control-label"><g:message
			code="order.status.label" default="Status" /></label>
	<div class="controls">
		<g:select name="status" readonly="readOnly"
			from="${orderInstance.constraints.status.inList}"
			value="${orderInstance?.status}" valueMessagePrefix="order.status"
			noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'type', 'error')} ">
	<label for="type" class="control-label"><g:message
			code="order.type.label" default="Type" /></label>
	<div class="controls">
		<g:select name="type" from="${orderInstance.constraints.type.inList}"
			value="${orderInstance?.type}" valueMessagePrefix="order.type"
			noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'type', 'error')}
		</span>
	</div>
</div>

<g:if test="${orderInstance?.type = 'SERVICE' }">
	<div
		class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'contractFromDate', 'error')} ">
		<label for="contractFromDate" class="control-label"><g:message
				code="order.contractFromDate.label" default="From Date" /><span
			class="required-indicator">*</span></label>
		<div class="controls">
			<richui:dateChooser name="contractFromDate" value="${orderInstance?.contractFromDate}" />
			<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'contractFromDate', 'error')}
			</span>
		</div>
	</div>

	<div
		class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'contractToDate', 'error')} ">
		<label for="contractToDate" class="control-label"><g:message
				code="order.expiryDate.label" default="To Date" /></label>
		<div class="controls">
			<richui:dateChooser name="contractToDate" value="${orderInstance?.contractToDate}" />
			<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'contractToDate', 'error')}
			</span>
		</div>
	</div>
</g:if>
<%--<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'issueDate', 'error')} required">
	<label for="issueDate" class="control-label"><g:message
			code="order.issueDate.label" default="Issue Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:datePicker name="issueDate" precision="day"
			value="${orderInstance?.issueDate}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'issueDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'expiryDate', 'error')} ">
	<label for="expiryDate" class="control-label"><g:message
			code="order.expiryDate.label" default="Expiry Date" /></label>
	<div class="controls">
		<g:datePicker name="expiryDate" precision="day"
			value="${orderInstance?.expiryDate}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'expiryDate', 'error')}
		</span>
	</div>
</div>
--%>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'contactName', 'error')} ">
	<label for="contactName" class="control-label"><g:message
			code="order.contactName.label" default="Contact Name" /></label>
	<div class="controls">
		<g:textField name="contactName" value="${orderInstance?.contactName}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'contactName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'relatedTo', 'error')} ">
	<label for="type" class="control-label"><g:message
			code="order.relatedTo.label" default="Related To" /></label>
	<div class="controls">
		<g:select name="relatedTo"
			from="${orderInstance.constraints.relatedTo.inList}"
			value="${orderInstance?.relatedTo}"
			valueMessagePrefix="order.relatedTo" noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'relatedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'relatedToValue', 'error')} ">
	<label for="relatedToValue" class="control-label"><g:message
			code="order.relatedToValue.label" default="Value" /></label>
	<div class="controls">
		<g:textField name="relatedToValue"
			value="${orderInstance?.relatedToValue}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'relatedToValue', 'error')}
		</span>
	</div>
</div>

<%--<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'totalAmount', 'error')} required">
	<label for="totalAmount" class="control-label"><g:message
			code="order.totalAmount.label" default="Total Amount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="totalAmount" step="any" required=""
			value="${orderInstance.totalAmount}" />
		<span class="help-inline">
			${hasErrors(bean: orderInstance, field: 'totalAmount', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'totalTax', 'error')} required">
	<label for="totalTax" class="control-label"><g:message
			code="order.totalTax.label" default="Total Tax" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="totalTax" step="any" required=""
			value="${orderInstance.totalTax}" />
		<span class="help-inline">
			${hasErrors(bean: orderInstance, field: 'totalTax', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'totalDiscount', 'error')} required">
	<label for="totalDiscount" class="control-label"><g:message
			code="order.totalDiscount.label" default="Total Discount" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="totalDiscount" step="any" required=""
			value="${orderInstance.totalDiscount}" />
		<span class="help-inline">
			${hasErrors(bean: orderInstance, field: 'totalDiscount', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'grandTotal', 'error')} required">
	<label for="grandTotal" class="control-label"><g:message
			code="order.grandTotal.label" default="Grand Total" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="grandTotal" step="any" required=""
			value="${orderInstance.grandTotal}" />
		<span class="help-inline">
			${hasErrors(bean: orderInstance, field: 'grandTotal', 'error')}
		</span>
	</div>
</div>

--%>
<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'description', 'error')} ">
	<label for="description" class="control-label"><g:message
			code="order.description.label" default="Description" /></label>
	<div class="controls">
		<g:textField name="description" value="${orderInstance?.description}" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'description', 'error')}
		</span>
	</div>
</div>