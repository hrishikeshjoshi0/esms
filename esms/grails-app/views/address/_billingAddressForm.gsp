<%@ page import="com.esms.model.party.Address"%>
<g:hiddenField name="billing.addressType" value="BILLING"/>
<%--<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'addressType', 'error')} ">
	<label for="addressType" class="col-lg-2 control-label"><g:message
			code="address.addressType.label" default="Address Type" /></label>
	<div class="col-lg-10">
		<g:select name="addressType"
			from="${Address.constraints.addressType.inList}"
			value="${addressInstance?.addressType}"
			valueMessagePrefix="address.addressType" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'addressType', 'error')}
		</span>
	</div>
</div>
--%>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'address1', 'error')} required">
	<label for="address1" class="col-lg-2 control-label"><g:message
			code="address.address1.label" default="Address1" /><span
		class="required-indicator">*</span></label>
	<div class="col-lg-10">
		<g:textField id="billingAddress1" name="billing.address1" required=""
			value="${addressInstance?.address1}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'address1', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'address2', 'error')} ">
	<label for="address2" class="col-lg-2 control-label"><g:message
			code="billing.address2.label" default="Address2" /></label>
	<div class="col-lg-10">
		<g:textField id="billingAddress2" name="billing.address2" value="${addressInstance?.address2}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'address2', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'buildingName', 'error')} ">
	<label for="buildingName" class="col-lg-2 control-label"><g:message
			code="address.buildingName.label" default="Building Name" /></label>
	<div class="col-lg-10">
		<g:textField id="billingBuildingName" name="billing.buildingName"
			value="${addressInstance?.buildingName}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'buildingName', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} ">
	<label for="city" class="col-lg-2 control-label"><g:message
			code="address.city.label" default="City" /></label>
	<div class="col-lg-10">
		<g:textField id="billingCity" name="billing.city" value="${addressInstance?.city}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'city', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} ">
	<label for="state" class="col-lg-2 control-label"><g:message
			code="address.state.label" default="State" /></label>
	<div class="col-lg-10">
		<g:textField id="billingState" name="billing.state" value="${addressInstance?.state}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'state', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} ">
	<label for="country" class="col-lg-2 control-label"><g:message
			code="address.country.label" default="Country" /></label>
	<div class="col-lg-10">
		<g:textField id="billingCountry" name="billing.country" value="${addressInstance?.country}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'country', 'error')}
		</span>
	</div>
</div>

<div
	class="form-group fieldcontain ${hasErrors(bean: addressInstance, field: 'postalCode', 'error')} ">
	<label for="postalCode" class="col-lg-2 control-label"><g:message
			code="address.postalCode.label" default="Postal Code" /></label>
	<div class="col-lg-10">
		<g:textField id="billingPostalCode" name="billing.postalCode" value="${addressInstance?.postalCode}" />
		<span class="help-inline">
			${hasErrors(bean: addressInstance, field: 'postalCode', 'error')}
		</span>
	</div>
</div>