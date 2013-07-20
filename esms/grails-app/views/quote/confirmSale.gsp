<div class="page-header">
	<h1>
		Confirm Sale
	</h1>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quotedGrandTotal', 'error')} ">
	<div class="controls">
		<label for="quotedGrandTotal" class="control-label"><g:message
			code="quote.quotedGrandTotal.label" default="Quoted Grand Total" />
		</label>
		<g:field type="number" name="quotedGrandTotal" required="" value="${quoteInstance.quotedGrandTotal}" readonly="readonly"/>
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quotedGrandTotal', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'negotiatedGrandTotal', 'error')} ">
	<div class="controls">
		<label for="quotedGrandTotal" class="control-label"><g:message
			code="quote.negotiatedGrandTotal.label" default="Negotiated Grand Total" />
		<span
			class="required-indicator">*</span></label>
		<g:field type="number" name="negotiatedGrandTotal" required="" value="${quoteInstance.negotiatedGrandTotal}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'negotiatedGrandTotal', 'error')}
		</span>
	</div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: eventInstance, field: 'notes', 'error')}">
	<label for="notes"><g:message
			code="event.notes.label" default="Notes" /></label>
	<g:textArea name="notes" value="${eventInstance?.notes}"
		rows="10" cols="100" />
</div>