<div class="page-header">
	<h3>
		Confirm Sale
	</h3>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quotedGrandTotal', 'error')} ">
	<div class="col-lg-10">
		<label for="quotedGrandTotal" class="col-lg-2 control-label"><g:message
			code="quote.quotedGrandTotal.label" default="Quoted Grand Total" />
		</label>
		<g:field type="number" name="quotedGrandTotal" required="" value="${quoteInstance.quotedGrandTotal}" readonly="readonly"/>
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quotedGrandTotal', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'negotiatedGrandTotal', 'error')} ">
	<div class="col-lg-10">
		<label for="quotedGrandTotal" class="col-lg-2 control-label"><g:message
			code="quote.negotiatedGrandTotal.label" default="Negotiated Grand Total" />
		<span
			class="required-indicator">*</span></label>
		<g:field type="number" name="negotiatedGrandTotal" required="" value="${quoteInstance.negotiatedGrandTotal}" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'negotiatedGrandTotal', 'error')}
		</span>
	</div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'notes', 'error')}">
	<label for="notes"><g:message
			code="quote.notes.label" default="Notes" /></label>
	<g:textArea name="notes" value="${quoteInstance?.notes}"
		rows="10" cols="100" />
</div>