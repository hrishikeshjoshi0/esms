<div class="page-header">
	<h1>
		Mark As Sent
	</h1>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'recepientContactName', 'error')} ">
	<label for="recepientContactName" class="control-label"><g:message
			code="quote.recepientContactName.label" default="Recepient Contact Name" />
	</label>		
	<span>
		<div class="controls" >
			<g:textField name="recepientContactName" value="${orderInstance?.recepientContactName}"
				class="input-xlarge" />
			<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'recepientContactName', 'error')}
			</span>
		</div>
	</span>		
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'recepientContactNumber', 'error')} ">
	<label for="recepientContactNumber" class="control-label"><g:message
			code="quote.recepientContactNumber.label" default="Recepient Contact Number" />
	</label>		
	<div class="controls">
		<g:textField name="recepientContactNumber" value="${orderInstance?.recepientContactNumber}"
			class="input-xlarge" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'recepientContactNumber', 'error')}
		</span>
	</div>
</div>


<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'receivedDateTime', 'error')} " style="width:500px;">
	<label for="receivedDateTime" class="control-label"><g:message
			code="order.receivedDateTime.label" default="Received Date & Time (24 hr format)" />
	</label>		
	<div class="controls">
		<richui:dateChooser name="receivedDateTime" value="${orderInstance?.receivedDateTime}" time="true" hourClass="input-mini" minuteClass="input-mini"/>
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'receivedDateTime', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'handedOveryBy', 'error')} ">
	<label for="handedOveryBy" class="control-label"><g:message
			code="quote.handedOveryBy.label" default="Handed Overy By" />
	</label>
	<div class="controls">
		<g:textField name="handedOveryBy" value="${orderInstance?.handedOveryBy}"
			class="input-xlarge" />
		<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'handedOveryBy', 'error')}
		</span>
	</div>
</div>