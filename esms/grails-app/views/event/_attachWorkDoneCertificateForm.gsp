<div id="attachWorkDoneCertificate" class="modal hide fade" tabindex="-1" role="dialog"  style="width:90%;"
	data-remote="<g:createLink controller="event" action="attachWorkDoneCertificate" params="[id:eventInstance?.id]"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">Attach Work Done Certificate</h3>
	</div>
	<g:form controller="event" action="attachWorkDoneCertificate" method="POST">
		<g:hiddenField name="event.id" value="${eventInstance?.id}" />
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