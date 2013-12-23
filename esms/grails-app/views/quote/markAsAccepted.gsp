<%@ page import="com.esms.model.product.Product"%>
<div class="row">
	<div class="col-md-12">
		<g:hasErrors bean="${orderInstance}">
			<bootstrap:alert class="alert-danger">
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
			<g:form class="form-horizontal" controller="quote"
				action="markAsAccepted" id="${quoteInstance?.id}">
				<fieldset>
					<div class="row">
						<div class="col-md-6">
							<div
								class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contractFromDate', 'error')} ">
								<label for="contractFromDate"
									class="col-md-3 control-label"><g:message
										code="quote.contractFromDate.label"
										default="Contract Starts" /> </label>
								<div class="col-md-9">
									<richui:dateChooser name="contractFromDate" class="form-control"
										value="${quoteInstance?.contractFromDate}" />
									<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contractFromDate', 'error')}
									</span>
								</div>
							</div>
							
							<div
								class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contractToDate', 'error')} ">
								<label for="contractToDate"
									class="col-md-3 control-label"><g:message
										code="quote.contractToDate.label"
										default="Contract Ends" /> </label>
								<div class="col-md-9">
									<richui:dateChooser name="contractToDate" class="form-control"
										value="${quoteInstance?.contractToDate}" />
									<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contractToDate', 'error')}
									</span>
								</div>
							</div>
							
							<div
								class="form-group fieldcontain">
								<label for="selectedService"
									class="col-md-3 control-label"><g:message
										code="quote.selectService.label"
										default="Select Service" /> </label>
								<div class="col-md-9">
									<g:select name="selectedService" class="form-control"
										from="${serviceQuoteListItems}" optionKey="key"
										optionValue="value" noSelection="['': '']" />
									<span class="help-inline">
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

