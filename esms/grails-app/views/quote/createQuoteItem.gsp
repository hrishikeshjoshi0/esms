<div class="col-md-12">
	<g:hasErrors bean="${quoteItemInstance}">
		<bootstrap:alert class="alert-danger">
			<ul>
				<g:eachError bean="${quoteItemInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</bootstrap:alert>
	</g:hasErrors>

	<div class="well">
		<g:form class="form-horizontal" action="createQuoteItem"
			controller="quote">
			<fieldset>
				<g:hiddenField name="quote.id"
					value="${quoteItemInstance?.quote?.id}" />
				<g:render template="/quoteItem/form"></g:render>
				<div class="form-group">
					<div class="col-md-10 col-md-offset-2">
						<button type="submit" class="btn btn-sm btn-primary">
							<g:message code="default.button.create.label" default="Create" />
						</button>
					</div>
				</div>
			</fieldset>
		</g:form>
	</div>
</div>

<script type="text/javascript">
	$('document').ready(function(){
		$('.calc').change(function(){
			calculateLineTotalAmount();
		});

		configureDropdowns();
		
		$(".create").attr("disabled", "disabled");
	});

    function calculateLineTotalAmount() {
    	var lineTotal = (parseFloat($("#unitPrice").val()) * parseFloat($("#quantity").val())) + parseFloat($("#tax").val()) - parseFloat($("#discount").val());
		$("#lineTotalAmount").val(lineTotal);
    }
    
	function fetchUnitPriceForProduct(id) {
		if(id == 'null') {
			$(".create").attr("disabled", "disabled");
		} else {
			var url = "${createLink(controller:'product', action:'getPrice')}" + "/" + id;
			$.ajax({
				url : url,
				dataType : 'xml',
				success : function(data) {
					$(data).find("unitPrice").each(function() {
						//find each instance of loc in xml file and wrap it in a link  
						$("#unitPrice").val($(this).text());
						calculateLineTotalAmount();
					});
				},
				error : function(request, status, error) {
					alert(error)
				},
				complete : function() {
				}
			});

			$(".create").removeAttr("disabled");
		}
	}
</script>
