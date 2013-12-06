<%@ page import="com.esms.model.order.Order" %>
<!doctype html>
<html>
<head>
	<meta name="layout" content="bootstrap3">
	<g:set var="entityName"
		value="${message(code: 'order.label', default: 'Order')}" />
	<title>
		Renew Service Contract
	</title>
</head>
<body>
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
					Renewal Won
				</h3>
			</div>

			<fieldset>
				<g:form class="form-horizontal" action="renewalWon" id="${orderInstance?.id}">
					<fieldset>
						<div
							class="form-group fieldcontain required">
							<label for="renewedContractFromDate" class="col-md-2 control-label"><g:message
									code="order.renewedContractFromDate.label" default="From Date" /><span
								class="required-indicator">*</span></label>
							<div class="col-md-10">
								<richui:dateChooser name="renewedContractFromDate" value="${params.renewedContractFromDate}" />
							</div>
						</div>
						
						<div
							class="form-group fieldcontain required">
							<label for="renewedContractToDate" class="col-md-2 control-label"><g:message
									code="order.renewedContractToDate.label" default="To Date" /><span
								class="required-indicator">*</span></label>
							<div class="col-md-10">
								<richui:dateChooser name="renewedContractToDate" value="${params.renewedContractToDate}" />
							</div>
						</div>
						
						<div
							class="form-group fieldcontain">
							<label for="selectedService" class="col-md-2 control-label">
								Select Service
							</label>
							<div class="col-md-10">
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
							class="form-group fieldcontain required">
							<label for="unitPrice" class="col-md-2 control-label"><g:message
									code="order.productAmount.label" default="Unit Price" /><span
								class="required-indicator">*</span></label>
							<div class="col-md-10">
								<g:field type="number" name="unitPrice" step="any" required="" class="calc"
										value="${params.unitPrice}" />
							</div>
						</div>
						
						<div
							class="form-group fieldcontain required">
							<label for="tax" class="col-md-2 control-label"><g:message
									code="order.tax.label" default="Tax" /><span
								class="required-indicator">*</span></label>
							<div class="col-md-10">
								<g:field type="number" name="tax" step="any" required="" class="calc"
										value="${params.tax}" />
							</div>
						</div>
						
						<div
							class="form-group fieldcontain required">
							<label for="discount" class="col-md-2 control-label"><g:message
									code="order.discount.label" default="Discount" /><span
								class="required-indicator">*</span></label>
							<div class="col-md-10">
								<g:field type="number" name="discount" step="any" required="" class="calc"
										value="${params.discount}" />
							</div>
						</div>
						
						<div
							class="form-group fieldcontain required">
							<label for="grandTotal" class="col-md-2 control-label"><g:message
									code="order.grandTotal.label" default="Grand Total" /><span
								class="required-indicator">*</span></label>
							<div class="col-md-10">
								<g:field type="number" name="renewedGrandTotal" step="any" required="" readonly="readonly"
										value="${params.renewedGrandTotal}" />
							</div>
						</div>
						
						<div
							class="form-group fieldcontain ${hasErrors(bean: orderInstance, field: 'description', 'error')} ">
							<label for="description" class="col-md-2 control-label"><g:message
									code="order.description.label" default="Description" /><span
								class="required-indicator">*</span></label>
							<div class="col-md-10">
								<g:textArea name="description" value="${orderInstance?.description}"
									cols="40" rows="5" maxlength="1000" style="width:80%;" />
								<span class="help-inline"> ${hasErrors(bean: orderInstance, field: 'description', 'error')}
								</span>
							</div>
						</div>
						
						<div class="form-group">
							<button type="submit" class="btn btn-primary">
								
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
