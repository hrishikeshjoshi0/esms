<head>
	<script type="text/javascript">
	$('document').ready(function(){
		$('.calc').change(function(){
			calculateLineTotalAmount();
		});


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
</head>
<div class="page-header">
	<h3>Create Quote Item</h3>
</div>

<div class="well">
	<g:form class="form-horizontal" action="createQuoteItem"
		controller="quote">
		<fieldset>
			<g:hiddenField name="quote.id" value="${quoteItemInstance?.quote?.id}" />
			<g:render template="/quoteItem/form"></g:render>
			<div class="form-group">
				<div class="col-lg-10 col-lg-offset-2">
					<button type="submit" class="btn btn-sm btn-primary">
						<g:message code="default.button.create.label" default="Create" />
					</button>
				</div>
			</div>
		</fieldset>
	</g:form>
</div>