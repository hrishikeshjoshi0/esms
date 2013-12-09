<%@ page import="com.esms.model.party.PhoneBook"%>

<div class="row">
	<div class="col-md-6">
		<div
			class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')} ">
			<label for="email" class="col-md-3 control-label"><g:message
					code="phoneBook.email.label" default="Primary Email" /></label>
			<div class="col-md-9">
				<g:textField name="email" value="${phoneBookInstance?.email}"
					class="form-control" />
				<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')} ">
			<label for="secondaryEmail" class="col-md-3 control-label"><g:message
					code="phoneBook.secondaryEmail.label" default="Secondary Email" /></label>
			<div class="col-md-9">
				<g:textField name="secondaryEmail" class="form-control"
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
				<g:textField name="homePhone"
					value="${phoneBookInstance?.homePhone}" class="form-control" />
				<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')}
				</span>
			</div>
		</div>

		<div
			class="form-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')} ">
			<label for="mobilePhone" class="col-md-3 control-label"><g:message
					code="phoneBook.mobilePhone.label" default="Mobile Phone" /></label>
			<div class="col-md-9">
				<g:textField name="mobilePhone" class="form-control"
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
				<g:textField name="officePhone" class="form-control"
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
				<g:textField name="otherPhone" class="form-control"
					value="${phoneBookInstance?.otherPhone}" />
				<span class="help-inline"> ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')}
				</span>
			</div>
		</div>
	</div>
</div>