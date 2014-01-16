<div class="well">
	<g:form class="form-horizontal" action="createAddress" controller="organization">
		<fieldset>
			<g:hiddenField name="party.id" value="${addressInstance?.party?.id}"/>
			<g:render template="/address/form"></g:render>
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