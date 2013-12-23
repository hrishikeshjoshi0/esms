<!-- Create Events -->
<div class="btn-group">
	<button type="button" class="btn btn-primary btn-sm dropdown-toggle"
		data-toggle="dropdown">
		Create Associated Event <span class="caret"></span>
	</button>
	<ul class="dropdown-menu" role="menu">
		<li><g:if test="${sourceEvent?.eventType == 'REPAIR WORK' }">
				<g:link action="create" controller="event"
					params="[isAssociatedEvent:true,'sourceEvent.id':sourceEvent?.id,'party.id':sourceEvent?.party?.id,relatedTo:'EVENT',relatedToValue:sourceEvent?.relatedToValue,eventType:'REPAIR WORK']">
					<g:message code="default.button.createRepairEvent.label"
						default="Create Repair Event" />
				</g:link>
			</g:if></li>
		<li><g:if test="${sourceEvent?.eventType == 'MODERNIZATION WORK' }">
				<g:link action="create" controller="event"
					params="[isAssociatedEvent:true,'sourceEvent.id':sourceEvent?.id,'party.id':sourceEvent?.party?.id,relatedTo:'EVENT',relatedToValue:sourceEvent?.relatedToValue,eventType:'MODERNIZATION WORK']">
					<g:message code="default.button.createModernizationEvent.label"
						default="Create Modernization Event" />
				</g:link>
			</g:if></li>
		<li><g:if test="${sourceEvent?.eventType == 'BREAKDOWN CALL' || sourceEvent?.eventType == 'MAINTENANCE VISIT' }">
				<g:link action="create" controller="event"
					params="[isAssociatedEvent:true,'sourceEvent.id':sourceEvent?.id,'party.id':sourceEvent?.party?.id,relatedTo:'EVENT',relatedToValue:sourceEvent?.relatedToValue,eventType:'BREAKDOWN CALL',assignedTo:sourceEvent?.assignedTo]">
					<g:message code="default.button.createBreakdownEvent.label"
						default="Create Breakdown Event" />
				</g:link>

				<g:link action="create" controller="event"
					params="[isAssociatedEvent:true,'sourceEvent.id':sourceEvent?.id,'party.id':sourceEvent?.party?.id,relatedTo:'EVENT',relatedToValue:sourceEvent?.relatedToValue,eventType:'MAINTENANCE VISIT',assignedTo:sourceEvent?.assignedTo]">
					<g:message code="default.button.createMaintenanceEvent.label"
						default="Create Maintenance Event" />
				</g:link>
			</g:if></li>
	</ul>
</div>
<!-- Create Events Ends -->