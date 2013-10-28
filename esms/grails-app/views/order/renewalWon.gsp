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
								<richui:dateChooser name="renewedContractFromDate" value="${params.renewedContractFromDate}" />
							</div>
						</div>
						
						<div
							class="control-group fieldcontain required">
							<label for="renewedContractToDate" class="control-label"><g:message
									code="order.renewedContractToDate.label" default="To Date" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<richui:dateChooser name="renewedContractToDate" value="${params.renewedContractToDate}" />
							</div>
						</div>
						
						<div
							class="control-group fieldcontain">
							<label for="selectedService" class="control-label">
								Select Service
							</label>
							<div class="controls">
								<g:select class="calc" name="selectedService"
									from="${serviceListItemsMap}"
									optionKey="key"
									optionValue="value"
									noSelection="['': '']" />
								<span class="help-inline">
								</span>
							</div>
						</div>
						
						<div
							class="control-group fieldcontain required">
							<label for="unitPrice" class="control-label"><g:message
									code="order.productAmount.label" default="Unit Price" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:field type="number" name="unitPrice" step="any" required="" class="calc"
										value="${params.unitPrice}" />
							</div>
						</div>
						
						<div
							class="control-group fieldcontain required">
							<label for="tax" class="control-label"><g:message
									code="order.tax.label" default="Tax" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:field type="number" name="tax" step="any" required="" class="calc"
										value="${params.tax}" />
							</div>
						</div>
						
						<div
							class="control-group fieldcontain required">
							<label for="discount" class="control-label"><g:message
									code="order.discount.label" default="Discount" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:field type="number" name="discount" step="any" required="" class="calc"
										value="${params.discount}" />
							</div>
						</div>
						
						<div
							class="control-group fieldcontain required">
							<label for="grandTotal" class="control-label"><g:message
									code="order.grandTotal.label" default="Grand Total" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:field type="number" name="renewedGrandTotal" step="any" required="" readonly="readonly"
										value="${params.renewedGrandTotal}" />
							</div>
						</div>
						
						<div
							class="control-group fieldcontain ${hasErrors(bean: orderInstance, field: 'description', 'error')} ">
							<label for="description" class="control-label"><g:message
									code="order.description.label" default="Description" /><span
								class="required-indicator">*</span></label>
							<div class="controls">
								<g:textArea name="description" value="${orderInstance?.description}"
									cols="40" rows="5" maxlength="1000" style="width:80%;" />
								<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'description', 'error')}
								</span>
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
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('.calc').change(function(){
				calculateLineTotalAmount();
			});

			$('#selectedService').change(function(){
				fetchUnitPriceForProduct($('#selectedService').val());
				calculateLineTotalAmount();
			});

			calculateLineTotalAmount();
		
			$(".create").attr("disabled", "disabled");
 	    });
	
		function calculateLineTotalAmount() {
			var renewedGrandTotal = (parseFloat($("#unitPrice").val())) + parseFloat($("#tax").val()) - parseFloat($("#discount").val());
			$("#renewedGrandTotal").val(renewedGrandTotal);
		}
		
		function fetchUnitPriceForProduct(id) {
			if(id == 'null') {
				$(".create").attr("disabled", "disabled");
			} else {
				var url = "${createLink(controller:'product', action:'getPrice')}" + "/" + id;
				$.ajax({
				    url:url,
				    dataType: 'xml',	
				    success: function(data) {
				    	$(data).find("unitPrice").each(function() {  
				    		//find each instance of loc in xml file and wrap it in a link  
				    		$("#unitPrice").val($(this).text());
		
				    		calculateLineTotalAmount();
				    	});  
				    },
				    error: function(request, status, error) {
				      alert(error)
				    },
				    complete: function() {
				    }
				});
		
				$(".create").removeAttr("disabled");
			}
		}
	</script>
</body>
</html>
