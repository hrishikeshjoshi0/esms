<div id="markAsAccepted" class="modal hide fade" tabindex="-1" role="dialog"
	data-remote="<g:createLink controller="quote" action="markAsAccepted" params="['quote.id':quoteInstance?.id]"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">Mark As Accepted</h3>
	</div>
	<g:form controller="quote" action="markAsAccepted" method="POST">
		<g:hiddenField name="id" value="${quoteInstance?.id}" />
		<div class="modal-body"></div>
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