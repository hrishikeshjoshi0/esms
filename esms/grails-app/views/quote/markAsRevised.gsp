<div class="page-header">
	<h3>
		Reason for Revision.
	</h3>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'revisedReason', 'error')} ">
	<div class="controls">
		<g:textArea name="description" value="${quoteInstance?.revisedReason}"
			cols="40" rows="5" maxlength="1000" style="width:80%;" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'revisedReason', 'error')}
		</span>
	</div>
</div>