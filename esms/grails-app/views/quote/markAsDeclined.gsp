<div class="page-header">
	<h1>
		Reason for Decline.
	</h1>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'declinedReason', 'error')} ">
	<div class="controls">
		<g:textArea name="description" value="${quoteInstance?.declinedReason}"
			cols="40" rows="5" maxlength="1000" style="width:80%;" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'declinedReason', 'error')}
		</span>
	</div>
</div>