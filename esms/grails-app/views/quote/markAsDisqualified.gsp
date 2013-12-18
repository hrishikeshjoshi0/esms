<%@ page import="com.esms.model.product.Product"%>
<div class="row">
	<div class="col-md-12">
		<g:hasErrors bean="${quoteInstance}">
			<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${quoteInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</bootstrap:alert>
		</g:hasErrors>

		<div class="well">
			<g:form class="form-horizontal" controller="quote" action="markAsDisqualified" id="${quoteInstance?.id}">
				<fieldset>
					<div
						class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'declinedReason', 'error')} ">
						<label for="disqualificationReason" class="col-md-3 control-label"><g:message
								code="quote.disqualificationReason.label" default="Disqualification Reason" />
						</label>
						<div class="col-md-9">
							<g:textArea name="disqualificationReason"
								value="${quoteInstance?.disqualificationReason}" cols="40"
								rows="5" maxlength="1000" style="width:80%;" />
							<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'notes', 'error')}
							</span>
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


