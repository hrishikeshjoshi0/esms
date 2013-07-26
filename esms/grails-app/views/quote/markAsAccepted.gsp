<div class="page-header">
	<h1>
		Mark As Accepted
	</h1>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contractFromDate', 'error')} ">
	<label for="contractFromDate" class="control-label"><g:message
			code="quote.contractFromDate.label" default="Contract Starts" />
	<div class="controls">
		<g:datePicker name="contractFromDate" value="${quoteInstance?.contractFromDate}" precision="day"/>
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contractFromDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contractToDate', 'error')} ">
	<label for="contractToDate" class="control-label"><g:message
			code="quote.contractToDate.label" default="Contract Ends" />
	<div class="controls">
		<g:datePicker name="contractToDate" value="${quoteInstance?.contractToDate}" precision="day"/>
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contractToDate', 'error')}
		</span>
	</div>
</div>