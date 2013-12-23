<div class="col-md-12">
	<g:hasErrors bean="${quoteItemInstance}">
		<bootstrap:alert class="alert-danger">
			<ul>
				<g:eachError bean="${quoteItemInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</bootstrap:alert>
	</g:hasErrors>

	<div class="well">
		<g:form class="form-horizontal" action="createEventLog"
			controller="event">
			<fieldset>
				<g:hiddenField name="event.id"
					value="${eventInstance?.id}" />
				
				<g:render template="/eventLog/form"/>
				
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
</div>