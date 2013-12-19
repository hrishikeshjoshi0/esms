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
			<th></th>	
		</tr>
	</thead>
	<tbody>
		<g:each in="${productInstance.prices}" var="p" status="i">
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
				<td>
					<bs3:modalLink id="createPrice${i}"
						href="${createLink(controller:'product',action:'editPrice',params:['id':p?.id])}"
						title="Edit" />
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pgn">
	<bootstrap:paginate
		total="${productInstanceInstance?.prices?.size()?productInstanceInstance?.prices?.size():0}" />
</div>