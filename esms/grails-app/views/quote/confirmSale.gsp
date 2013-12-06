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

		<div class="well">
			<g:form class="form-horizontal" controller="quote" action="confirmSale" id="${quoteInstance?.id}">
				<fieldset>
					<div
						class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quotedGrandTotal', 'error')} ">
						<div class="col-md-10">
							<label for="quotedGrandTotal" class="col-md-2 control-label"><g:message
									code="quote.quotedGrandTotal.label"
									default="Quoted Grand Total" /> </label>
							<g:field type="number" name="quotedGrandTotal" required="" class="col-md-8 form-control"
								value="${quoteInstance.quotedGrandTotal}" readonly="readonly" />
							<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quotedGrandTotal', 'error')}
							</span>
						</div>
					</div>

					<div
						class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'negotiatedGrandTotal', 'error')} ">
						<div class="col-md-10">
							<label for="quotedGrandTotal" class="col-md-2 control-label"><g:message
									code="quote.negotiatedGrandTotal.label"
									default="Negotiated Grand Total" /> <span
								class="required-indicator">*</span></label>
							<g:field type="number" name="negotiatedGrandTotal" required="" class="col-md-8 form-control"
								value="${quoteInstance.negotiatedGrandTotal}" />
							<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'negotiatedGrandTotal', 'error')}
							</span>
						</div>
					</div>
					
					<div
						class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'negotiatedGrandTotal', 'error')} ">
						<div class="col-md-10">
							<label for="notes"><g:message code="quote.notes.label"
								default="Notes" /></label>
							<g:textArea name="notes" value="${quoteInstance?.notes}" rows="10" class="col-md-8 form-control"
							cols="100" />
							<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'negotiatedGrandTotal', 'error')}
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