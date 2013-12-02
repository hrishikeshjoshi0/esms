<div id="priceModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">Create New Price</h4>
			</div>

			<div class="well">
				<g:form controller="product" action="createPrice" method="POST">
					<fieldset>
						<div class="modal-body">
							<g:hiddenField name="product.id" value="${productInstance?.id}" />
							<g:render template="/productPrice/form"></g:render>
						</div>
						<div class="modal-footer">
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<a href="#" class="btn">Close</a>
									<button type="submit" class="btn btn-sm btn-primary">
										<g:message code="default.button.create.label" default="Create" />
									</button>
								</div>
							</div>							
						</div>
					</fieldset>
				</g:form>				
			</div>			
		</div>
	</div>
</div>