<%@ page import="com.esms.model.product.Product"%>
<div class="row">
	<div class="col-md-12">
		<g:hasErrors bean="${orderInstance}">
			<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${orderInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</bootstrap:alert>
		</g:hasErrors>

		<div class="page-header">
			<h3>
				Reason for Decline.
			</h3>
		</div>

		<div class="well">
			<g:form class="form-horizontal" action="create">
				<fieldset>
					<div
						class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'declinedReason', 'error')} ">
						<div class="col-lg-10">
							<g:textArea name="description"
								value="${quoteInstance?.declinedReason}" cols="40" rows="5"
								maxlength="1000" style="width:80%;" />
							<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'declinedReason', 'error')}
							</span>
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
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