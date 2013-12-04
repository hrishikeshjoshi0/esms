<%--<div class="pull-right">
	<a data-toggle="modal" data-target="#addressModal" role="button"
		href="<g:createLink controller="lead" action="createAddress" params="['party.id':organizationInstance?.id]" />" 
		class="btn btn-default btn-sm"> <i class="glyphicon glyphicon-plus"></i> New
		Address
	</a>
</div>
--%>
<div class="table-responsive">
	<table class="table table-striped table-condensed table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="address1"
					title="${message(code: 'address.address1.label', default: 'Address1')}" />

				<g:sortableColumn property="address2"
					title="${message(code: 'address.address2.label', default: 'Address2')}" />

				<g:sortableColumn property="buildingName"
					title="${message(code: 'address.buildingName.label', default: 'Building Name')}" />

				<g:sortableColumn property="city"
					title="${message(code: 'address.city.label', default: 'City')}" />

				<g:sortableColumn property="country"
					title="${message(code: 'address.country.label', default: 'Country')}" />

				<g:sortableColumn property="addressType"
					title="${message(code: 'address.addressType.label', default: 'Address Type')}" />

				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${organizationInstance?.addresses}" var="addressInstance">
				<tr>

					<td>
						${fieldValue(bean: addressInstance, field: "address1")}
					</td>

					<td>
						${fieldValue(bean: addressInstance, field: "address2")}
					</td>

					<td>
						${fieldValue(bean: addressInstance, field: "buildingName")}
					</td>

					<td>
						${fieldValue(bean: addressInstance, field: "city")}
					</td>

					<td>
						${fieldValue(bean: addressInstance, field: "country")}
					</td>

					<td>
						${fieldValue(bean: addressInstance, field: "addressType")}
					</td>

					<td class="link"><g:link action="show" controller="address"
							id="${addressInstance.id}" class="btn btn-default btn-sm">Show &raquo;</g:link>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bootstrap:paginate total="${organizationInstance?.addresses?.size()}" />
	</div>
</div>

<!-- Modal -->
<div class="modal" id="addressModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">Create New Address</h4>
			</div>

			<div class="well">
				<g:form controller="organization" action="createAddress" method="POST">
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

<div id="addressModal" class="modal" tabindex="-1" role="dialog" 
	data-remote="<g:createLink controller="lead" action="createAddress"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Address</h3>
	</div>
	<g:form controller="organization" action="createAddress" method="POST">
		<g:hiddenField name="party.id" value="${organizationInstance?.id}" />
		<g:hiddenField name="createdFromOrganizationDetailView" value="true" />
		<div class="modal-body">
			
		</div>
		<div class="modal-footer">
			<div class="form-group">
				<button type="submit" class="btn btn-primary">
					
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>