<g:if test="${orderInstance?.type == 'REPAIR' }">
	<g:link class="btn btn-sm btn-info" action="create" controller="event"
		params="['party.id':orderInstance?.organization.id,relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,eventType:'REPAIR WORK']">
		
		<g:message code="default.button.createRepairEvent.label"
			default="Create Repair Event" />
	</g:link>
</g:if>
<g:if test="${orderInstance?.type == 'MODERNIZATION' }">
	<g:link class="btn btn-sm btn-info" action="create" controller="event"
		params="['party.id':orderInstance?.organization.id,relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,eventType:'MODERNIZATION WORK']">
		
		<g:message code="default.button.createModernizationEvent.label"
			default="Create Modernization Event" />
	</g:link>
</g:if>
<g:if test="${orderInstance?.type == 'SERVICE' }">
	<g:link class="btn btn-sm btn-warning" action="create" controller="event"
		params="['party.id':orderInstance?.organization.id,relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,eventType:'BREAKDOWN CALL',assignedTo:orderInstance?.assignedTo]">
		
		<g:message code="default.button.createBreakdownEvent.label"
			default="Create Breakdown Event" />
	</g:link>
	
	<g:link class="btn btn-sm btn-warning" action="create" controller="event"
		params="['party.id':orderInstance?.organization.id,relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,eventType:'MAINTENANCE VISIT',assignedTo:orderInstance?.assignedTo]">
		
		<g:message code="default.button.createMaintenanceEvent.label"
			default="Create Maintenance Event" />
	</g:link>
</g:if>