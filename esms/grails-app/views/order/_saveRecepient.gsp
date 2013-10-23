<div id="markAsSent" class="modal hide fade" tabindex="-1" role="dialog"
	data-remote="<g:createLink controller="order" action="renewalLetterSent" params="['id':orderInstance?.id]"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">Save Recipient Information</h3>
	</div>
	<g:form controller="order" action="renewalLetterSent" method="POST" style="width:400px;">
		<g:hiddenField name="id" value="${orderInstance?.id}" />
		<div class="modal-body" style="width:500px;">
			Loading...
		</div>
		<div class="modal-footer">
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">
					<i class="icon-ok icon-white"></i>
					<g:message code="default.button.save.label" default="Save" />
				</button>
			</div>
		</div>
	</g:form>
</div>