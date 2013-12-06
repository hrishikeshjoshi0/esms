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
			<h3>Mark As Accepted</h3>
		</div>

		<div class="well">
			<g:form class="form-horizontal" controller="quote" action="markAsAccepted" id="${quoteInstance?.id}">
				<fieldset>
					<div
						class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contractFromDate', 'error')} ">
						<label for="contractFromDate" class="col-md-2 control-label"><g:message
								code="quote.contractFromDate.label" default="Contract Starts" />
						</label>		
							<div class="controls" style="width: 100%;">
								<richui:dateChooser name="contractFromDate"
									value="${quoteInstance?.contractFromDate}" />
								<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contractFromDate', 'error')}
								</span>
							</div>
					</div>

					<div
						class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contractToDate', 'error')} "
						style="width: 500px;">
						<label for="contractToDate" class="col-md-2 control-label"><g:message
								code="quote.contractToDate.label" default="Contract Ends" />
						</label>	
							<div class="controls" style="width: 100%;">
								<richui:dateChooser name="contractToDate"
									value="${quoteInstance?.contractToDate}" />
								<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contractToDate', 'error')}
								</span>
							</div>
					</div>

					<div class="form-group fieldcontain">
						<label for="selectService" class="col-md-2 control-label">
							Select Service </label>
						<div class="col-md-10">
							<g:select name="selectedService" from="${serviceQuoteListItems}"
								optionKey="key" optionValue="value" noSelection="['': '']" />
							<span class="help-inline"> </span>
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

