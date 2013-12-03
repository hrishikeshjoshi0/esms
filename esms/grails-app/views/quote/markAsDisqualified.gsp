<div class="page-header">
	<h3>
		Reason for Disqualification.
	</h3>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'disqualificationReason', 'error')} ">
	<div class="controls">
		<g:textArea name="disqualificationReason" value="${quoteInstance?.disqualificationReason}"
			cols="40" rows="5" maxlength="1000" style="width:80%;" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'notes', 'error')}
		</span>
	</div>
</div>