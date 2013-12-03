<div class="pull-right">
	<a data-toggle="modal" data-target="#priceModal" role="button"
		href="<g:createLink controller="product" action="createPrice" id="${productInstance?.id}" />" 
		class="btn btn-default btn-xs"> <i class="glyphicon glyphicon-plus"></i> New
		Price
	</a>
</div>

<table
	class="table table-striped table-hover table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="fromDate"
				title="${message(code: 'product.fromDate.label', default: 'From Date')}" />
			<g:sortableColumn property="toDate"
				title="${message(code: 'product.toDate.label', default: 'To Date')}" />
			<g:sortableColumn property="price"
				title="${message(code: 'product.price.label', default: 'Price')}" />
		</tr>
	</thead>
	<tbody>
		<g:each in="${productInstance.prices}" var="p">
			<tr>
				<td>
					${fieldValue(bean: p, field: "fromDate")}
				</td>
				<td>
					${fieldValue(bean: p, field: "toDate")}
				</td>
				<td>
					${fieldValue(bean: p, field: "price")}
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate
		total="${productInstanceInstance?.prices?.size()?productInstanceInstance?.prices?.size():0}" />
</div>

<!-- Add New Contact -->
<!-- Modal -->
<div class="modal" id="priceModal">
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
							${message(code: 'default.ajax.loading.message', default: 'Loading')}
						</div>
						<div class="modal-footer">
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
