<%@ page import="com.esms.model.party.Address"%>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'addressType', 'error')} ">
	<label for="addressType" class="col-md-3 control-label"><g:message
			code="address.addressType.label" default="Address Type" /></label>
	<div class="col-md-9">
		<g:select name="addressType" class="form-control"
			from="${Address.constraints.addressType.inList}"
			value="${addressInstance?.addressType}"
			valueMessagePrefix="address.addressType" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'addressType', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'address1', 'error')} required">
	<label for="address1" class="col-md-3 control-label"><g:message
			code="address.address1.label" default="Address1" /><span
		class="required-indicator">*</span></label>
	<div class="col-md-9">
		<g:textField name="address1" required="" class="form-control"
			value="${addressInstance?.address1}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'address1', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'address2', 'error')} ">
	<label for="address2" class="col-md-3 control-label"><g:message
			code="address.address2.label" default="Address2" /></label>
	<div class="col-md-9">
		<g:textField name="address2" value="${addressInstance?.address2}" class="form-control" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'address2', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'buildingName', 'error')} ">
	<label for="buildingName" class="col-md-3 control-label"><g:message
			code="address.buildingName.label" default="Building Name" /></label>
	<div class="col-md-9">
		<g:textField name="buildingName" class="form-control"
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
		<g:textField name="city" value="${addressInstance?.city}" class="form-control" />
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
		<g:textField name="state" value="${addressInstance?.state}" class="form-control" />
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
		<g:textField name="country" value="${addressInstance?.country}" class="form-control" />
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
		<g:textField name="postalCode" value="${addressInstance?.postalCode}" class="form-control" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'postalCode', 'error')}
		</span>
	</div>
</div>