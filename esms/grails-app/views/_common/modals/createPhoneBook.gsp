<div class="page-header">
	<h3>
		Create Phone
	</h3>
</div>

<div class="well">
	<g:form class="form-horizontal" action="create">
		<fieldset>
			<g:hiddenField name="party.id" value="${phoneBookInstance?.party?.id}"/>
			<g:render template="/phoneBook/form"></g:render>
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