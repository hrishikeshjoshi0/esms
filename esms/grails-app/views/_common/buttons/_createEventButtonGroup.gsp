<%@page import="com.esms.model.quote.Quote"%>
<!-- 
	pass the order instance to the template.
-->
<!-- Create Events -->
<g:if test="${order}">
	<g:if test="${order?.referenceQuoteNumber}">
		<g:set var="quote" value="${Quote.findByQuoteNumber(order?.referenceQuoteNumber)}"/>
	</g:if>
	<div class="btn-group">
		<button type="button" class="btn btn-primary btn-sm dropdown-toggle"
			data-toggle="dropdown">
			Create Event <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<g:if test="${order?.type == 'REPAIR' }">
				<li>
					<g:link  action="create"
						controller="event"
						params="['party.id':order?.organization.id,relatedTo:'ORDER',relatedToValue:order?.orderNumber,eventType:'REPAIR WORK',assignedTo:order?.assignedTo,title:quote?.quoteName]">
						<g:message code="default.button.createRepairEvent.label"
							default="Create Repair Event" />
					</g:link>
				</li>
			</g:if>
			<g:elseif test="${order?.type == 'MODERNIZATION' }">
				<li>
					<g:link  action="create"
						controller="event"
						params="['party.id':order?.organization.id,relatedTo:'ORDER',relatedToValue:order?.orderNumber,eventType:'MODERNIZATION WORK',assignedTo:order?.assignedTo,title:quote?.quoteName]">
						<g:message code="default.button.createModernizationEvent.label"
							default="Create Modernization Event" />
					</g:link>
				</li>
			</g:elseif>
			<g:elseif test="${order?.type == 'SERVICE' }">
				<li>
					<g:link  action="create"
						controller="event"
						params="['party.id':order?.organization.id,relatedTo:'ORDER',relatedToValue:order?.orderNumber,eventType:'BREAKDOWN CALL',assignedTo:order?.assignedTo,title:quote?.quoteName]">
						<g:message code="default.button.createBreakdownEvent.label"
							default="Create Breakdown Event" />
					</g:link>
				</li>
				<li>
					<g:link  action="create"
						controller="event"
						params="['party.id':order?.organization.id,relatedTo:'ORDER',relatedToValue:order?.orderNumber,eventType:'MAINTENANCE VISIT',assignedTo:order?.assignedTo,title:quote?.quoteName]">
						<g:message code="default.button.createMaintenanceEvent.label"
							default="Create Maintenance Event" />
					</g:link>
				</li>	
			</g:elseif>
			<g:elseif test="${order?.type == 'INSTALLATION' }">
				<li>
					<g:link  action="create"
						controller="event"
						params="['party.id':order?.organization.id,relatedTo:'ORDER',relatedToValue:order?.orderNumber,eventType:'INSTALLATION WORK',assignedTo:order?.assignedTo,title:quote?.quoteName]">
						<g:message code="default.button.createInstallationEvent.label"
							default="Create Installation Event" />
					</g:link>
				</li>
			</g:elseif>
			<g:else>
				<li>
					<g:link  action="create"
						controller="event"
						params="['party.id':order?.organization.id,relatedTo:'ORDER',relatedToValue:order?.orderNumber,assignedTo:order?.assignedTo,title:quote?.quoteName]">
						<g:message code="default.button.createEvent.label"
							default="Create Event" />
					</g:link>
				</li>
			</g:else>			
		</ul>
	</div>

</g:if>
<!-- Create Events Ends -->