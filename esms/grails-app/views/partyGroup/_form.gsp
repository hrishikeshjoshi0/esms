<%@ page import="com.esms.model.party.PartyGroup" %>



			<div class="form-group fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'description', 'error')} ">
				<label for="description" class="col-md-2 control-label"><g:message code="partyGroup.description.label" default="Description" /></label>
				<div class="col-md-10">
					<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${partyGroupInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: partyGroupInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'partyType', 'error')} ">
				<label for="partyType" class="col-md-2 control-label"><g:message code="partyGroup.partyType.label" default="Party Type" /></label>
				<div class="col-md-10">
					<g:select name="partyType" from="${partyGroupInstance.constraints.partyType.inList}" value="${partyGroupInstance?.partyType}" valueMessagePrefix="partyGroup.partyType" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: partyGroupInstance, field: 'partyType', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'status', 'error')} ">
				<label for="status" class="col-md-2 control-label"><g:message code="partyGroup.status.label" default="Status" /></label>
				<div class="col-md-10">
					<g:select name="status" from="${partyGroupInstance.constraints.status.inList}" value="${partyGroupInstance?.status}" valueMessagePrefix="partyGroup.status" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: partyGroupInstance, field: 'status', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'relationshipType', 'error')} ">
				<label for="relationshipType" class="col-md-2 control-label"><g:message code="partyGroup.relationshipType.label" default="Relationship Type" /></label>
				<div class="col-md-10">
					<g:select name="relationshipType" from="${partyGroupInstance.constraints.relationshipType.inList}" value="${partyGroupInstance?.relationshipType}" valueMessagePrefix="partyGroup.relationshipType" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: partyGroupInstance, field: 'relationshipType', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'groupName', 'error')} required">
				<label for="groupName" class="col-md-2 control-label"><g:message code="partyGroup.groupName.label" default="Group Name" /><span class="required-indicator">*</span></label>
				<div class="col-md-10">
					<g:textField name="groupName" required="" value="${partyGroupInstance?.groupName}"/>
					<span class="help-inline">${hasErrors(bean: partyGroupInstance, field: 'groupName', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'addresses', 'error')} ">
				<label for="addresses" class="col-md-2 control-label"><g:message code="partyGroup.addresses.label" default="Addresses" /></label>
				<div class="col-md-10">
					
<ul class="one-to-many">
<g:each in="${partyGroupInstance?.addresses?}" var="a">
    <li><g:link controller="address" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="address" action="create" params="['partyGroup.id': partyGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: partyGroupInstance, field: 'addresses', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'contactMechs', 'error')} ">
				<label for="contactMechs" class="col-md-2 control-label"><g:message code="partyGroup.contactMechs.label" default="Contact Mechs" /></label>
				<div class="col-md-10">
					
<ul class="one-to-many">
<g:each in="${partyGroupInstance?.contactMechs?}" var="c">
    <li><g:link controller="contactMech" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="contactMech" action="create" params="['partyGroup.id': partyGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'contactMech.label', default: 'ContactMech')])}</g:link>
</li>
</ul>

					<span class="help-inline">${hasErrors(bean: partyGroupInstance, field: 'contactMechs', 'error')}</span>
				</div>
			</div>

			<div class="form-group fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'externalId', 'error')} ">
				<label for="externalId" class="col-md-2 control-label"><g:message code="partyGroup.externalId.label" default="External Id" /></label>
				<div class="col-md-10">
					<g:textField name="externalId" value="${partyGroupInstance?.externalId}"/>
					<span class="help-inline">${hasErrors(bean: partyGroupInstance, field: 'externalId', 'error')}</span>
				</div>
			</div>

