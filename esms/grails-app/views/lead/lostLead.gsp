<div class="well">
	<g:form class="form-horizontal" action="lostLead" controller="lead">
		<fieldset>
			<div class="row">
				<div class="col-md-6">
					<g:hiddenField name="id" value="${organizationInsance?.id}"/>
					<div
						class="form-group fieldcontain ${hasErrors(bean: organizationInsance, field: 'lostReason', 'error')} ">
						<label for="lostReason" class="col-md-3 control-label"><g:message
								code="organization.lostReason.label" default="Reason" /></label>
						<div class="col-md-9">
							<g:textField name="lostReason" class="form-control"
								value="${organizationInsance?.lostReason}"/>
							<span class="help-inline">
								${hasErrors(bean: organizationInsance, field: 'lostReason', 'error')}
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-10 col-md-offset-2">
					<button type="submit" class="btn btn-sm btn-primary">Save
					</button>
				</div>
			</div>
		</fieldset>
	</g:form>
</div>