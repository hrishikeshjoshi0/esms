<div class="page-header">
	<h1>
		Mark As Sent
	</h1>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'recepientContactName', 'error')} ">
	<label for="recepientContactName" class="control-label"><g:message
			code="quote.recepientContactName.label" default="Recepient Contact Name" />
	</label>		
	<span>
		<div class="controls" >
			<g:textField name="recepientContactName" value="${quoteInstance?.recepientContactName}"
				class="input-xlarge" />
			<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'recepientContactName', 'error')}
			</span>
		</div>
	</span>		
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'recepientContactNumber', 'error')} ">
	<label for="recepientContactNumber" class="control-label"><g:message
			code="quote.recepientContactNumber.label" default="Recepient Contact Number" />
	</label>		
	<div class="controls">
		<g:textField name="recepientContactNumber" value="${quoteInstance?.recepientContactNumber}"
			class="input-xlarge" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'recepientContactNumber', 'error')}
		</span>
	</div>
</div>


<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'receivedDateTime', 'error')} " style="width:500px;">
	<label for="receivedDateTime" class="control-label"><g:message
			code="quote.receivedDateTime.label" default="Received Date & Time (24 hr format)" />
	</label>		
	<div class="controls">
		<richui:dateChooser name="receivedDateTime" value="${quoteInstance?.receivedDateTime}" time="true" hourClass="input-mini" minuteClass="input-mini"/>
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'receivedDateTime', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'handedOveryBy', 'error')} ">
	<label for="handedOveryBy" class="control-label"><g:message
			code="quote.handedOveryBy.label" default="Handed Overy By" />
	</label>
	<div class="controls">
		<g:textField name="handedOveryBy" value="${quoteInstance?.handedOveryBy}"
			class="input-xlarge" />
		<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'handedOveryBy', 'error')}
		</span>
	</div>
</div>