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
			<g:form class="form-horizontal" controller="quote"
				action="convertToSalesOrder">
				<g:hiddenField name="id" value="${quoteInstance?.id}" />
				<fieldset>
					<div class="row">
						<div class="col-md-6">
							<div
								class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quotedGrandTotal', 'error')} ">
								<label for="quotedGrandTotal" class="col-md-3 control-label"><g:message
											code="quote.quotedGrandTotal.label"
											default="Quoted Grand Total" /> </label>
								<div class="col-md-9">
									<g:field type="number" name="quotedGrandTotal" required=""
										class="form-control" value="${quoteInstance.quotedGrandTotal}"
										readonly="readonly" />
									<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quotedGrandTotal', 'error')}
									</span>
								</div>
							</div>
							
							<div
								class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'negotiatedGrandTotal', 'error')} ">
								<label for="negotiatedGrandTotal" class="col-md-3 control-label"><g:message
											code="quote.negotiatedGrandTotal.label"
											default="Quoted Grand Total" /> </label>
								<div class="col-md-9">
									<g:field type="number" name="negotiatedGrandTotal" required=""
										class="form-control" value="${quoteInstance.negotiatedGrandTotal}"
										 />
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
						</div>
					</div>
				</fieldset>
			</g:form>
		</div>
	</div>
</div>