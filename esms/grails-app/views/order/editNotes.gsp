<%@ page import="com.esms.model.product.Product"%>
<div class="row">
	<div class="col-md-12">
		<div class="well">
			<g:form class="form-horizontal" controller="order"
				action="editNotes">
				<g:hiddenField name="id" value="${orderInstance?.id}" />
				<fieldset>
					<div class="col-md-6">
						<div
							class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'notes', 'error')} ">
							<label for="notes" class="col-md-3 control-label"><g:message
									code="order.notes.label" default="Notes" /> </label>
							<div class="col-md-9">
								<g:textArea name="notes" class="form-control"
									value="${orderInstance.notes}" />
								<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'notes', 'error')}
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-10 col-md-offset-2">
							<button type="submit" class="btn btn-sm btn-primary">
								<g:message code="default.button.save.label" default="Save" />
							</button>
						</div>
					</div>
				</fieldset>
			</g:form>
		</div>
	</div>
</div>