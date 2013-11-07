<g:if test="${orderInstance?.type == 'REPAIR' }">
	<g:link class="btn btn-info" action="create" controller="event"
		params="['party.id':orderInstance?.organization.id,relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,eventType:'REPAIR WORK']">
		<i class="icon-calendar icon-white"></i>
		<g:message code="default.button.createRepairEvent.label"
			default="Create Repair Event" />
	</g:link>
</g:if>
<g:if test="${orderInstance?.type == 'MODERNIZATION' }">
	<g:link class="btn btn-info" action="create" controller="event"
		params="['party.id':orderInstance?.organization.id,relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,eventType:'MODERNIZATION WORK']">
		<i class="icon-calendar icon-white"></i>
		<g:message code="default.button.createModernizationEvent.label"
			default="Create Modernization Event" />
	</g:link>
</g:if>
<g:if test="${orderInstance?.type == 'SERVICE' }">
	<g:link class="btn btn-warning" action="create" controller="event"
		params="['party.id':orderInstance?.organization.id,relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,eventType:'BREAKDOWN CALL',assignedTo:orderInstance?.assignedTo]">
		<i class="icon-calendar icon-white"></i>
		<g:message code="default.button.createBreakdownEvent.label"
			default="Create Breakdown Event" />
	</g:link>
	
	<g:link class="btn btn-warning" action="create" controller="event"
		params="['party.id':orderInstance?.organization.id,relatedTo:'ORDER',relatedToValue:orderInstance?.orderNumber,eventType:'MAINTENANCE VISIT',assignedTo:orderInstance?.assignedTo]">
		<i class="icon-calendar icon-white"></i>
		<g:message code="default.button.createMaintenanceEvent.label"
			default="Create Maintenance Event" />
	</g:link>
</g:if>