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
				action="markAsSent" id="${quoteInstance?.id}">
				<fieldset>
					<div class="row">
						<div class="col-md-6">
							<div
								class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'recepientContactName', 'error')} ">
								<label for="recepientContactName" class="col-md-3 control-label"><g:message
										code="quote.recepientContactName.label"
										default="Recepient Contact Name" /> </label>
								<div class="col-md-9">
									<g:textField name="recepientContactName" class="form-control"
										value="${quoteInstance?.recepientContactName}" />
									<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'recepientContactName', 'error')}
									</span>
								</div>
							</div>

							<div
								class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'recepientContactNumber', 'error')} ">
								<label for="recepientContactNumber"
									class="col-md-3 control-label"><g:message
										code="quote.recepientContactNumber.label"
										default="Recepient Contact Number" /> </label>
								<div class="col-md-9">
									<g:textField name="recepientContactNumber" class="form-control"
										value="${quoteInstance?.recepientContactNumber}" />
									<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'recepientContactNumber', 'error')}
									</span>
								</div>
							</div>

							<div
								class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'receivedDateTime', 'error')} ">
								<label for="receivedDateTime" class="col-md-3 control-label"><g:message
										code="quote.receivedDateTime.label"
										default="Received Date & Time (24 hr format)" /> </label>
								<div class="col-md-9">
									<richui:dateChooser name="receivedDateTime"
										value="${quoteInstance?.receivedDateTime}" time="true"
										class="col-md-6" hourClass="col-md-2" minuteClass="col-md-2" />
									<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'receivedDateTime', 'error')}
									</span>
								</div>
							</div>

							<div
								class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'handedOveryBy', 'error')} ">
								<label for="handedOveryBy" class="col-md-3 control-label"><g:message
										code="quote.handedOveryBy.label" default="Handed Overy By" />
								</label>
								<div class="col-md-9">
									<g:textField name="handedOveryBy" class="form-control"
										value="${quoteInstance?.handedOveryBy}" /> 
									<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'handedOveryBy', 'error')}
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