<div class="well">
	<g:form class="form-horizontal" action="createContact" controller="organization">
		<fieldset>
			<g:hiddenField name="organization.id" value="${contactInstance?.organization?.id}"/>
			<g:render template="/contact/form"></g:render>
			<div class="form-group">
				<div class="col-md-10 col-md-offset-2">
					<button type="submit" class="btn btn-sm btn-primary">
						<g:message code="default.button.create.label" default="Create" />
					</button>
				</div>
			</div>
		</fieldset>
	</g:form>
</div>