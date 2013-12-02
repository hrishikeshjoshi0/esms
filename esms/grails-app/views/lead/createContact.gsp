<div id="contactModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">Create New Contact</h4>
			</div>

			<div class="well">
				<g:form controller="lead" action="createContact" method="POST">
					<fieldset>
						<g:hiddenField name="party.id" value="${organizationInstance?.id}" />
						<g:hiddenField name="createdFromOrganizationDetailView" value="true" />
						<div class="modal-body">
							<g:render template="/contact/form"></g:render>
						</div>
						<div class="modal-footer">
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-sm btn-primary">
										<g:message code="default.button.create.label" default="Create" />
									</button>
								</div>
							</div>							
						</div>
					</fieldset>
				</g:form>				
			</div>			
		</div>
	</div>
</div>