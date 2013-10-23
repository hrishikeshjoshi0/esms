<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'order.label', default: 'Order')}" />
<title>
	Renew Service Contract
</title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
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
				<h1>
					Renewal Won
				</h1>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="renewalWon" id="${orderInstance?.id}">
					<fieldset>
						<div
							class="control-group fieldcontain required">
							<label for="renewedContractFromDate" class="control-label"><g:message
									code="order.renewedContractFromDate.label" default="From Date" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:datePicker name="renewedContractFromDate" precision="day" value="${params.renewedContractFromDate}" />
							</div>
						</div>
						
						<div
							class="control-group fieldcontain required">
							<label for="renewedContractToDate" class="control-label"><g:message
									code="order.renewedContractToDate.label" default="To Date" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:datePicker name="renewedContractToDate" precision="day" value="${params.renewedContractToDate}" />
							</div>
						</div>
						
						<div
							class="control-group fieldcontain required">
							<label for="grandTotal" class="control-label"><g:message
									code="order.grandTotal.label" default="Grand Total" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:field type="number" name="renewedGrandTotal" step="any" required=""
										value="${params.renewedGrandTotal}" />
							</div>
						</div>
												
						<div class="form-actions">
							<button type="submit" class="btn btn-primary">
								<i class="icon-ok icon-white"></i>
								Save
							</button>
						</div>
					</fieldset>
				</g:form>
			</fieldset>
		</div>
	</div>
</body>
</html>
