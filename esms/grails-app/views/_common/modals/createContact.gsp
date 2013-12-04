<div class="page-header">
	<h3>
		Create Contact
	</h3>
</div>

<div class="well">
	<g:form class="form-horizontal" action="create">
		<fieldset>
			<g:hiddenField name="organization.id" value="${contactInstance?.organization?.id}"/>
			<g:render template="/contact/form"></g:render>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" class="btn btn-sm btn-primary">
						<g:message code="default.button.create.label" default="Create" />
					</button>
				</div>
			</div>
		</fieldset>
	</g:form>
</div>