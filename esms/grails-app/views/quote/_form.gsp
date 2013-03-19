<%@page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.quote.Quote"%>

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
	    		$("#contactName").val($(this).text());
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
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'organization', 'error')} required">
	<label for="organization" class="control-label"><g:message
			code="quote.organization.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select name="organization.id" from="${Organization.list()}"
			optionKey="id" optionValue="name" class="input-xxlarge" onchange="fetchInfo(this.value);"
			value="${quoteInstance?.organization?.id}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteNumber', 'error')} required">
	<label for="quoteNumber" class="control-label"><g:message
			code="quote.quoteNumber.label" default="Quote Number" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="quoteNumber" required="" readonly="readonly"
			value="${quoteInstance?.quoteNumber}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quoteNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteName', 'error')} required">
	<label for="quoteName" class="control-label"><g:message
			code="quote.quoteName.label" default="Quote Name" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="quoteName" required="" class="input-xxlarge"
			value="${quoteInstance?.quoteName}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quoteName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'status', 'error')} ">
	<label for="status" class="control-label"><g:message
			code="quote.status.label" default="Status" /></label>
	<div class="controls">
		<%--<g:select name="status" readOnly="readOnly"
			from="${quoteInstance.constraints.status.inList}"
			value="${quoteInstance?.status}" valueMessagePrefix="quote.status"
			noSelection="['': '']" />
		--%>
		<g:hiddenField name="status" value="${quoteInstance?.status}"/>
		${quoteInstance?.status}"
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'type', 'error')} required">
	<label for="type" class="control-label"><g:message
			code="quote.type.label" default="Type" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select name="type" from="${quoteInstance.constraints.type.inList}"
			value="${quoteInstance?.type}" valueMessagePrefix="quote.type"
			noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'type', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'salesChannel', 'error')} required">
	<label for="salesChannel" class="control-label"><g:message
			code="quote.salesChannel.label" default="Sales Channel" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="salesChannel" required=""
			value="${quoteInstance?.salesChannel}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'salesChannel', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contactName', 'error')} ">
	<label for="contactName" class="control-label"><g:message
			code="quote.contactName.label" default="Contact Name" /></label>
	<div class="controls">
		<g:textField name="contactName" value="${quoteInstance?.contactName}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contactName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo" class="control-label"><g:message
			code="contract.assignedTo.label" default="Assigned To" /></label>
	<div class="controls">
		<g:textField name="assignedTo" value="${quoteInstance?.assignedTo}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'assignedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'relatedTo', 'error')} ">
	<label for="relatedTo" class="control-label"><g:message
			code="contract.relatedTo.label" default="Related To" /></label>
	<div class="controls">
		<g:select name="relatedTo"
			from="${quoteInstance.constraints.relatedTo.inList}"
			value="${quoteInstance?.relatedTo}"
			valueMessagePrefix="contract.relatedTo" noSelection="['': '']" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'relatedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'relatedToValue', 'error')} ">
	<label for="relatedToValue" class="control-label"><g:message
			code="contract.relatedToValue.label" default="Related To Value" /></label>
	<div class="controls">
		<g:textField name="relatedToValue" value="${quoteInstance?.relatedToValue}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'relatedToValue', 'error')}
		</span>
	</div>
</div>

<g:if test="${params.contractQuote}">
	<div class="page-header">
		<h1>
			Invoicing
		</h1>
	</div>
	<div
		class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'invoicingIsFixedPrice', 'error')} ">
		<label for="invoicingIsFixedPrice" class="control-label"><g:message
				code="contract.invoicingIsFixedPrice.label"
				default="Is Fixed Price" /></label>
		<div class="controls">
			<g:checkBox name="invoicingIsFixedPrice"
				value="${quoteInstance?.invoicingIsFixedPrice}" />
			<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'invoicingIsFixedPrice', 'error')}
			</span>
		</div>
	</div>

	<div
		class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'invoicingIsTimesheets', 'error')} ">
		<label for="invoicingIsTimesheets" class="control-label"><g:message
				code="contract.invoicingIsTimesheets.label"
				default="Is Timesheets" /></label>
		<div class="controls">
			<g:checkBox name="invoicingIsTimesheets"
				value="${quoteInstance?.invoicingIsTimesheets}" />
			<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'invoicingIsTimesheets', 'error')}
			</span>
		</div>
	</div>

	<div
		class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'invoicingIsExpenses', 'error')} ">
		<label for="invoicingIsExpenses" class="control-label"><g:message
				code="contract.invoicingIsExpenses.label"
				default="Is Expenses" /></label>
		<div class="controls">
			<g:checkBox name="invoicingIsExpenses"
				value="${quoteInstance?.invoicingIsExpenses}" />
			<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'invoicingIsExpenses', 'error')}
			</span>
		</div>
	</div>
</g:if>

<div class="page-header">
	<h1>
		Description
	</h1>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'description', 'error')} ">
	<div class="controls">
		<g:textArea name="description" value="${quoteInstance?.description}"
			cols="40" rows="5" maxlength="1000" style="width:80%;" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'description', 'error')}
		</span>
	</div>
</div>