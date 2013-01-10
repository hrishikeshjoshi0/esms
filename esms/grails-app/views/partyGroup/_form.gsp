<%@ page import="com.esms.party.PartyGroup" %>



<div class="fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="partyGroup.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${partyGroupInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'partyType', 'error')} ">
	<label for="partyType">
		<g:message code="partyGroup.partyType.label" default="Party Type" />
		
	</label>
	<g:select name="partyType" from="${partyGroupInstance.constraints.partyType.inList}" value="${partyGroupInstance?.partyType}" valueMessagePrefix="partyGroup.partyType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="partyGroup.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${partyGroupInstance.constraints.status.inList}" value="${partyGroupInstance?.status}" valueMessagePrefix="partyGroup.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'relationshipType', 'error')} ">
	<label for="relationshipType">
		<g:message code="partyGroup.relationshipType.label" default="Relationship Type" />
		
	</label>
	<g:select name="relationshipType" from="${partyGroupInstance.constraints.relationshipType.inList}" value="${partyGroupInstance?.relationshipType}" valueMessagePrefix="partyGroup.relationshipType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="partyGroup.comments.label" default="Comments" />
		
	</label>
	<g:textArea name="comments" cols="40" rows="5" maxlength="1000" value="${partyGroupInstance?.comments}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'groupName', 'error')} required">
	<label for="groupName">
		<g:message code="partyGroup.groupName.label" default="Group Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="groupName" required="" value="${partyGroupInstance?.groupName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'externalId', 'error')} ">
	<label for="externalId">
		<g:message code="partyGroup.externalId.label" default="External Id" />
		
	</label>
	<g:textField name="externalId" value="${partyGroupInstance?.externalId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: partyGroupInstance, field: 'partyId', 'error')} required">
	<label for="partyId">
		<g:message code="partyGroup.partyId.label" default="Party Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="partyId" type="number" value="${partyGroupInstance.partyId}" required=""/>
</div>

