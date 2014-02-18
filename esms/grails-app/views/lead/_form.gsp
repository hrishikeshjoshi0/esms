<%@ page import="com.esms.model.party.Organization"%>

<g:hiddenField name="salesStatus" value="LEAD" />
<div class="row">
	<div class="col-md-6">
			<!-- External Id -->
			<div
				class="form-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'externalId', 'error')} required">
				<label for="externalId" class="col-md-3 control-label"> <g:message
						code="organization.externalId.label" default="External Id" /> <span
					class="required-indicator">*</span>
				</label>
				<div class="col-md-9">
					<g:textField name="externalId" required="" readOnly="readOnly"
						class="form-control" value="${organizationInstance?.externalId}" />
					<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'externalId', 'error')}
					</span>
				</div>
			</div>

			<div
				class="form-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'name', 'error')} ">
				<label for="name" class="col-md-3 control-label"><g:message
						code="organization.name.label" default="Name" /></label>
				<div class="col-md-9">
					<g:textField name="name" value="${organizationInstance?.name}"
						class="form-control" />
					<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'name', 'error')}
					</span>
				</div>
			</div>

			<div
				class="form-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'assignedTo', 'error')} ">
				<label for="assignedTo" class="col-md-3 control-label"><g:message
						code="organization.assignedTo.label" default="Assigned To" /></label>
				<div class="col-md-9">
					<g:textField name="assignedTo" class="form-control"
						value="${organizationInstance?.assignedTo}" />
					<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'assignedTo', 'error')}
					</span>
				</div>
			</div>
	</div>
	
	<div class="col-md-6">
		<div class="checkbox">
			<label for="isOneTimeCustomer" class="col-md-12 control-label">
				<g:checkBox name="isOneTimeCustomer"
					value="${organizationInstance?.isOneTimeCustomer}" /> <g:message
					code="organization.isOneTimeCustomer.label" default="Is One Time ?" />
			</label> <span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'isOneTimeCustomer', 'error')}
			</span>
		</div>
	</div>
</div>

<g:if test="${params.action == 'edit' }">
	
</g:if>
<g:else>
	<div class="row">
		<div class="col-md-6">
			<div class="page-header">
				<h5>Primary Contact</h5>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'designation', 'error')} ">
				<label for="primary.designation" class="col-md-3 control-label"><g:message
						code="contact.designation.label" default="Designation" /></label>
				<div class="col-md-9">
					<g:select name="primary.designation" class="form-control"
						from="${contactInstance.constraints.designation.inList}"
						value="${contactInstance?.designation}"
						valueMessagePrefix="primary.designation" noSelection="['': '']" />
					<span class="help-inline"> ${hasErrors(bean: contactInstance, field: 'designation', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'firstName', 'error')} required">
				<label for="firstName" class="col-md-3 control-label"><g:message
						code="contact.firstName.label" default="First Name" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:textField name="primary.firstName" required="" class="form-control"
						value="${contactInstance?.firstName}" />
					<span class="help-inline"> ${hasErrors(bean: contactInstance, field: 'firstName', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'middleName', 'error')} ">
				<label for="middleName" class="col-md-3 control-label"><g:message
						code="contact.middleName.label" default="Middle Name" /></label>
				<div class="col-md-9">
					<g:textField name="primary.middleName" class="form-control"
						value="${contactInstance?.middleName}" />
					<span class="help-inline"> ${hasErrors(bean: contactInstance, field: 'middleName', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'lastName', 'error')} ">
				<label for="lastName" class="col-md-3 control-label"><g:message
						code="contact.lastName.label" default="Last Name" /></label>
				<div class="col-md-9">
					<g:textField name="primary.lastName" class="form-control"
						value="${contactInstance?.lastName}" />
					<span class="help-inline"> ${hasErrors(bean: contactInstance, field: 'lastName', 'error')}
					</span>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<!-- PhoneBook -->
			<div class="page-header">
				<h5>Phones, Emails etc.</h5>
			</div>
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')} ">
				<label for="email" class="col-md-3 control-label"><g:message
						code="phoneBook.email.label" default="Primary Email" /></label>
				<div class="col-md-9">
					<g:textField name="primary.email" class="form-control"
						value="${phoneBookInstance?.email}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')} ">
				<label for="secondaryEmail" class="col-md-3 control-label"><g:message
						code="phoneBook.secondaryEmail.label" default="Secondary Email" /></label>
				<div class="col-md-9">
					<g:textField name="primary.secondaryEmail" class="form-control"
						value="${phoneBookInstance?.secondaryEmail}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')} ">
				<label for="homePhone" class="col-md-3 control-label"><g:message
						code="phoneBook.homePhone.label" default="Home Phone" /></label>
				<div class="col-md-9">
					<g:textField name="primary.homePhone" class="form-control"
						value="${phoneBookInstance?.homePhone}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')} ">
				<label for="mobilePhone" class="col-md-3 control-label"><g:message
						code="phoneBook.mobilePhone.label" default="Mobile Phone" /></label>
				<div class="col-md-9">
					<g:textField name="primary.mobilePhone" class="form-control"
						value="${phoneBookInstance?.mobilePhone}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')} ">
				<label for="officePhone" class="col-md-3 control-label"><g:message
						code="phoneBook.officePhone.label" default="Office Phone" /></label>
				<div class="col-md-9">
					<g:textField name="primary.officePhone" class="form-control"
						value="${phoneBookInstance?.officePhone}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')} ">
				<label for="otherPhone" class="col-md-3 control-label"><g:message
						code="phoneBook.otherPhone.label" default="Other Phone" /></label>
				<div class="col-md-9">
					<g:textField name="primary.otherPhone" class="form-control"
						value="${phoneBookInstance?.otherPhone}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')}
					</span>
				</div>
			</div>
		</div>
	</div>
	
	<%--
	<div class="row">
		<div class="col-md-6">
			<div class="page-header">
				<h5>Secondary Contact</h5>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'designation', 'error')} ">
				<label for="secondary.designation" class="col-md-3 control-label"><g:message
						code="contact.designation.label" default="Designation" /></label>
				<div class="col-md-9">
					<g:select name="secondary.designation" class="form-control"
						from="${contactInstance.constraints.designation.inList}"
						value="${contactInstance?.designation}"
						valueMessagePrefix="secondary.designation" noSelection="['': '']" />
					<span class="help-inline"> ${hasErrors(bean: contactInstance, field: 'designation', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'firstName', 'error')} required">
				<label for="firstName" class="col-md-3 control-label"><g:message
						code="contact.firstName.label" default="First Name" /><span
					class="required-indicator">*</span></label>
				<div class="col-md-9">
					<g:textField name="secondary.firstName" required="" class="form-control"
						value="${contactInstance?.firstName}" />
					<span class="help-inline"> ${hasErrors(bean: contactInstance, field: 'firstName', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'middleName', 'error')} ">
				<label for="middleName" class="col-md-3 control-label"><g:message
						code="contact.middleName.label" default="Middle Name" /></label>
				<div class="col-md-9">
					<g:textField name="secondary.middleName" class="form-control"
						value="${contactInstance?.middleName}" />
					<span class="help-inline"> ${hasErrors(bean: contactInstance, field: 'middleName', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: contactInstance, field: 'lastName', 'error')} ">
				<label for="lastName" class="col-md-3 control-label"><g:message
						code="contact.lastName.label" default="Last Name" /></label>
				<div class="col-md-9">
					<g:textField name="secondary.lastName" class="form-control"
						value="${contactInstance?.lastName}" />
					<span class="help-inline"> ${hasErrors(bean: contactInstance, field: 'lastName', 'error')}
					</span>
				</div>
			</div>
		</div>
	
		<div class="col-md-6">
			<!-- PhoneBook -->
			<div class="page-header">
				<h5>Phones, Emails etc.</h5>
			</div>
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')} ">
				<label for="email" class="col-md-3 control-label"><g:message
						code="phoneBook.email.label" default="Primary Email" /></label>
				<div class="col-md-9">
					<g:textField name="secondary.email" class="form-control"
						value="${phoneBookInstance?.email}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')} ">
				<label for="secondaryEmail" class="col-md-3 control-label"><g:message
						code="phoneBook.secondaryEmail.label" default="Secondary Email" /></label>
				<div class="col-md-9">
					<g:textField name="secondary.secondaryEmail" class="form-control"
						value="${phoneBookInstance?.secondaryEmail}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')} ">
				<label for="homePhone" class="col-md-3 control-label"><g:message
						code="phoneBook.homePhone.label" default="Home Phone" /></label>
				<div class="col-md-9">
					<g:textField name="secondary.homePhone" class="form-control"
						value="${phoneBookInstance?.homePhone}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')} ">
				<label for="mobilePhone" class="col-md-3 control-label"><g:message
						code="phoneBook.mobilePhone.label" default="Mobile Phone" /></label>
				<div class="col-md-9">
					<g:textField name="secondary.mobilePhone" class="form-control"
						value="${phoneBookInstance?.mobilePhone}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')} ">
				<label for="officePhone" class="col-md-3 control-label"><g:message
						code="phoneBook.officePhone.label" default="Office Phone" /></label>
				<div class="col-md-9">
					<g:textField name="secondary.officePhone" class="form-control"
						value="${phoneBookInstance?.officePhone}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')}
					</span>
				</div>
			</div>
	
			<div
				class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')} ">
				<label for="otherPhone" class="col-md-3 control-label"><g:message
						code="phoneBook.otherPhone.label" default="Other Phone" /></label>
				<div class="col-md-9">
					<g:textField name="secondary.otherPhone" class="form-control"
						value="${phoneBookInstance?.otherPhone}" />
					<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')}
					</span>
				</div>
			</div>
		</div>
	</div>
	--%>
	
	<div class="page-header">
		<h5>Address</h5>
	</div>
	<div class="row">
		<div class="col-md-6">
			<h5>
				Site Address (<small><a id="copyToBillingAddressLink"
					href="#">Copy To Billing Address</a></small>)
			</h5>
			<g:render template="/address/shippingAddressForm"></g:render>
		</div>
	
		<div class="col-md-6">
			<div class="billingAddress">
				<h5>Billing Address</h5>
				<g:render template="/address/billingAddressForm"></g:render>
			</div>
		</div>
	</div>
	
	<%--
	<div class="page-header">
		<h5>About the Lift</h5>
	</div>
	<g:render template="/liftInfo/form"></g:render>
	--%>
</g:else>

<%--<div class="page-header">
	<h5>Reason for Change</h5>
</div>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'description', 'error')}">
			<label for="description" class="col-md-3 control-label"><g:message
					code="liftInfo.description.label" default="Description" /></label>
			<div class="col-md-9">
				<g:textArea name="description" rows="5" maxlength="1000" class="form-control"
					value="${organizationInstance?.description}" />
				<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'description', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>	
--%>
<script>
	$('document').ready(function() {
		$("#copyToBillingAddressLink").click(function() {
			$('#billingAddress1').val($('#shippingAddress1').val());
			$('#billingAddress2').val($('#shippingAddress2').val());
			$('#billingBuildingName').val($('#shippingBuildingName').val());
			$('#billingCity').val($('#shippingCity').val());
			$('#billingState').val($('#shippingState').val());
			$('#billingCountry').val($('#shippingCountry').val());
			$('#billingPostalCode').val($('#shippingPostalCode').val());
			return false;
		});
	});
</script>