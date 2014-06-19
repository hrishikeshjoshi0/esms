<%@ page import="com.esms.model.party.Address"%>
<g:hiddenField name="shipping.addressType" value="SHIPPING"/>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'address1', 'error')} required">
	<label for="address1" class="col-md-3 control-label"><g:message
			code="address.address1.label" default="Address1" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:textField id="shippingAddress1" name="shipping.address1" required="" class="form-control"
			value="${addressInstance?.address1}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'address1', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'address2', 'error')} ">
	<label for="address2" class="col-md-3 control-label"><g:message
			code="shipping.address2.label" default="Address2" /></label>
	<div class="col-md-9">
		<g:textField id="shippingAddress2" name="shipping.address2" value="${addressInstance?.address2}" class="form-control"/>
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'address2', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'buildingName', 'error')} required">
	<label for="buildingName" class="col-md-3 control-label"><g:message
			code="address.buildingName.label" default="Building Name" />
			<span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:textField id="shippingBuildingName" name="shipping.buildingName" required="" class="form-control"
			value="${addressInstance?.buildingName}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'buildingName', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} ">
	<label for="city" class="col-md-3 control-label"><g:message
			code="address.city.label" default="City" /></label>
	<div class="col-md-9">
		<g:textField id="shippingCity" name="shipping.city" value="${addressInstance?.city}" class="form-control" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'city', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} ">
	<label for="state" class="col-md-3 control-label"><g:message
			code="address.state.label" default="State" /></label>
	<div class="col-md-9">
		<g:textField id="shippingState" name="shipping.state" value="${addressInstance?.state}" class="form-control" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'state', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} ">
	<label for="country" class="col-md-3 control-label"><g:message
			code="address.country.label" default="Country" /></label>
	<div class="col-md-9">
		<g:textField id="shippingCountry" name="shipping.country" value="${addressInstance?.country}" class="form-control" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'country', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'postalCode', 'error')} ">
	<label for="postalCode" class="col-md-3 control-label"><g:message
			code="address.postalCode.label" default="Postal Code" /></label>
	<div class="col-md-9">
		<g:textField id="shippingPostalCode" name="shipping.postalCode" value="${addressInstance?.postalCode}" class="form-control" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'postalCode', 'error')}
		</span>
	</div>
</div>