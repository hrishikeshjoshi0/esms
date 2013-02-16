<div class="page-header">
	<h1>
		Recepient Name
	</h1>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'recepientContactName', 'error')} ">
	<div class="controls">
		<g:textField name="recepientContactName" value="${quoteInstance?.recepientContactName}"
			class="input-xlarge" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'recepientContactName', 'error')}
		</span>
	</div>
</div>