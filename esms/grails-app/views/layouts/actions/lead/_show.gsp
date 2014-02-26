<div class="btn-group">
	<g:hiddenField name="id" value="${organizationInstance?.id}" />
	<g:if test="${organizationInstance.salesStatus == 'LEAD'}">
		<g:link class="btn btn-default btn-sm" controller="organization"
			action="convertLeadToCustomer" id="${organizationInstance?.id}"
			role="button">
								Convert Lead
							</g:link>

		<g:link class="btn btn-default btn-sm" action="disqualifyLead"
			controller="lead" id="${organizationInstance?.id}">
								Disqualify Lead
							</g:link>
	</g:if>

	<g:link class="btn btn-default btn-sm" action="edit" controller="lead"
		id="${organizationInstance?.id}">
		<g:message code="default.button.edit.label" default="Edit" />
	</g:link>

	<g:link class="btn btn-default btn-sm deleteBtn" action="delete"
		controller="lead" id="${organizationInstance?.id}">
		<g:message code="default.button.delete.label" default="Delete" />
	</g:link>

	<g:if test="${organizationInstance?.salesStatus != 'LOST' }">
		<bs3:modalLink id="lostLead"
			href="${createLink(controller:'lead',action:'lostLead',id:organizationInstance?.id)}"
			title="Mark As Lost" />
	</g:if>
	<div class="btn-group">
		<button type="button" class="btn btn-default btn-sm dropdown-toggle"
			data-toggle="dropdown">
			Create Quote <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<g:if test="${!organizationInstance?.isOneTimeCustomer}">
				<li><a
					href="<g:createLink controller="quote" action="create" params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]"/>">
						New Contract Quote </a></li>
			</g:if>
			<li><a
				href="<g:createLink controller="quote" action="create" params="[type:'REPAIR',organizationId:organizationInstance?.id]" />">
					New Repair Quote </a></li>
			<li><a
				href="<g:createLink controller="quote" action="create" params="[type:'MODERNIZATION',organizationId:organizationInstance?.id]" />">
					New Modernization Quote </a></li>
			<li><a
				href="<g:createLink controller="quote" action="create" params="[type:'INSTALLATION',organizationId:organizationInstance?.id]" />">
					New Installation Quote </a></li>
		</ul>
	</div>
</div>