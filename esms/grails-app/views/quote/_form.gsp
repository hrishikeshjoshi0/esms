<%@page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.quote.Quote"%>

<script>
	function fetchInfo(id) {
		var url = "${createLink(controller:'organization', action:'fetchInfo')}" + "/" + id;
		$.ajax({
			url : url,
			dataType : 'xml',
			success : function(data) {
				//alert(data);
				$(data).find("contactName").each(function() {
					//find each instance of loc in xml file and wrap it in a link  
					$("#contactName").val($(this).text());
				});

				$(data).find("assignedTo").each(function() {
					//find each instance of loc in xml file and wrap it in a link  
					$("#assignedTo").val($(this).text());
				});

				$(data).find("liftInfo.typeOfEnquiry").each(function() {
					//find each instance of loc in xml file and wrap it in a link  
					$("#type").val($(this).text());
				});
			},
			error : function(request, status, error) {
				alert(error);
			},
			complete : function() {
			}
		});
	}

	function updateTotals(elem) {
		var idx = $(elem).data("index");
		var unitPrice = $('#' + 'unitPrice' + idx).val();
		var quantity = $('#' + 'quantity' + idx).val();
		var tax = $('#' + 'tax' + idx).val();
		var discount = $('#' + 'discount' + idx).val();
		//Line Total	
		var lineTotal = (parseFloat(unitPrice) * parseFloat(quantity)
				+ parseFloat(tax) - parseFloat(discount));
		$("#" + "lineTotalAmount" + idx).val(lineTotal);
	}

	$('document').ready(function() {
		$('.calc').change(function() {
			updateTotals($(this));
		});
	});
</script>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'organization', 'has-error')} required">
			<label for="organization" class="col-md-3 control-label"><g:message
					code="quote.organization.label" default="Organization" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:select name="organization.id" from="${Organization.list()}"
					optionKey="id" optionValue="name" class="form-control"
					onchange="fetchInfo(this.value);"
					value="${quoteInstance?.organization?.id}" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'organization', 'has-error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteNumber', 'has-error')} required">
			<label for="quoteNumber" class="col-md-3 control-label"><g:message
					code="quote.quoteNumber.label" default="Quote Number" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:textField name="quoteNumber" required="" readonly="readonly" class="form-control"
					value="${quoteInstance?.quoteNumber}" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quoteNumber', 'has-error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'quoteName', 'has-error')} required">
			<label for="quoteName" class="col-md-3 control-label"><g:message
					code="quote.quoteName.label" default="Quote Name" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:textField name="quoteName" required="" class="form-control"
					value="${quoteInstance?.quoteName}" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'quoteName', 'has-error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'status', 'has-error')} ">
			<label for="status" class="col-md-3 control-label"><g:message
					code="quote.status.label" default="Status" /></label>
			<div class="col-md-9">
				<g:hiddenField name="status" value="${quoteInstance?.status}" />
				${quoteInstance?.status} <span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'status', 'has-error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'type', 'has-error')} required">
			<label for="type" class="col-md-3 control-label"><g:message
					code="quote.type.label" default="Type" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:select name="type" class="form-control"
					from="${quoteInstance.constraints.type.inList}"
					value="${quoteInstance?.type}" valueMessagePrefix="quote.type"
					noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'type', 'has-error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'salesChannel', 'has-error')} required">
			<label for="salesChannel" class="col-md-3 control-label"><g:message
					code="quote.salesChannel.label" default="Sales Channel" /><span
				class="required-indicator">*</span></label>
			<div class="col-md-9">
				<g:textField name="salesChannel" required="" class="form-control"
					value="${quoteInstance?.salesChannel}" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'salesChannel', 'has-error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'contactName', 'has-error')} ">
			<label for="contactName" class="col-md-3 control-label"><g:message
					code="quote.contactName.label" default="Contact Name" /></label>
			<div class="col-md-9">
				<g:textField name="contactName" class="form-control"
					value="${quoteInstance?.contactName}" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'contactName', 'has-error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'assignedTo', 'has-error')} ">
			<label for="assignedTo" class="col-md-3 control-label"><g:message
					code="contract.assignedTo.label" default="Assigned To" /></label>
			<div class="col-md-9">
				<g:textField name="assignedTo" value="${quoteInstance?.assignedTo}" class="form-control" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'assignedTo', 'has-error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'relatedTo', 'has-error')} ">
			<label for="relatedTo" class="col-md-3 control-label"><g:message
					code="contract.relatedTo.label" default="Related To" /></label>
			<div class="col-md-9">
				<g:select name="relatedTo" class="form-control" 
					from="${quoteInstance.constraints.relatedTo.inList}"
					value="${quoteInstance?.relatedTo}"
					valueMessagePrefix="contract.relatedTo" noSelection="['': '']" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'relatedTo', 'has-error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'relatedToValue', 'has-error')} ">
			<label for="relatedToValue" class="col-md-3 control-label"><g:message
					code="contract.relatedToValue.label" default="Related To Value" /></label>
			<div class="col-md-9">
				<g:textField name="relatedToValue" class="form-control"
					value="${quoteInstance?.relatedToValue}" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'relatedToValue', 'has-error')}
				</span>
			</div>
		</div>

		<div class="form-group">
			<label for="description" class="col-md-3 control-label"><g:message
						code="contract.description.label" default="Description" /></label>
			<div class="col-md-9">
				<g:textArea name="description" value="${quoteInstance?.description}"
					class="form-control" rows="5" maxlength="1000" />
				<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'description', 'has-error')}
				</span>
			</div>
		</div>

		<!-- No Business Case required. -->
		<%--
		<g:if test="${params.contractQuote}">
			<div class="page-header">
				<h5>Invoicing</h5>
			</div>
			
			<div
				class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'invoicingIsFixedPrice', 'has-error')} ">
				<label for="invoicingIsFixedPrice" class="col-md-3 control-label"><g:message
						code="contract.invoicingIsFixedPrice.label"
						default="Is Fixed Price" /></label>
				<div class="checkbox">
					<g:checkBox name="invoicingIsFixedPrice"
						value="${quoteInstance?.invoicingIsFixedPrice}" />
					<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'invoicingIsFixedPrice', 'has-error')}
					</span>
				</div>
			</div>

			<div
				class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'invoicingIsTimesheets', 'has-error')} ">
				<label for="invoicingIsTimesheets" class="col-md-3 control-label"><g:message
						code="contract.invoicingIsTimesheets.label"
						default="Is Timesheets" /></label>
				<div class="checkbox">
					<g:checkBox name="invoicingIsTimesheets" 
						value="${quoteInstance?.invoicingIsTimesheets}" />
					<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'invoicingIsTimesheets', 'has-error')}
					</span>
				</div>
			</div>

			<div
				class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'invoicingIsExpenses', 'has-error')} ">
				<label for="invoicingIsExpenses" class="col-md-3 control-label"><g:message
						code="contract.invoicingIsExpenses.label" default="Is Expenses" /></label>
				<div class="checkbox">
					<g:checkBox name="invoicingIsExpenses"
						value="${quoteInstance?.invoicingIsExpenses}" />
					<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'invoicingIsExpenses', 'has-error')}
					</span>
				</div>
			</div>
		</g:if>
		--%>
	</div>
</div>