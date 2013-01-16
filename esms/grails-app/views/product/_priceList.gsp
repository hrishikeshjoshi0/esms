<div class="pull-right">
	<a data-toggle="modal" href="#" data-target="#priceModal" role="button" class="btn"> 
		<i class="icon-plus"></i> New Price
	</a>
</div>

<!-- Contacts -->
<table class="table table-striped table-hover">
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
	<bootstrap:paginate total="${productInstanceInstance?.prices?.size()?productInstanceInstance?.prices?.size():0}" />
</div>

<!-- Add New Contact -->
<!-- Modal -->
<div id="priceModal" class="modal hide fade" tabindex="-1" role="dialog" 
	data-remote="<g:createLink controller="product" action="createPrice"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Price</h3>
	</div>
	<g:form controller="product" action="createPrice" method="POST">
		<g:hiddenField name="product.id" value="${productInstance?.id}" />
		<div class="modal-body">
			
		</div>
		<div class="modal-footer">
			<div class="form-actions">
				<button type="submit" class="btn btn-primary">
					<i class="icon-ok icon-white"></i>
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>