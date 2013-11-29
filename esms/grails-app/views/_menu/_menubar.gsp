<g:if test="${session.layout == null || session.layout == 'grid'}">
	<g:set var="menutype" value="nav nav-pills" />
</g:if>
<g:else>
	<g:set var="menutype" value="nav nav-tabs" />
</g:else>

<!-- position of menu: LTR (left-to-right, European) or RTL (right-to-left, Oriental) -->
<g:if
	test="${session.menuposition == 'right' && session.layout == 'grid'}">
	<g:set var="menuposition" value="pull-right" />
</g:if>
<g:elseif
	test="${session.menuposition == 'right' && session.layout == 'fluid'}">
	<g:set var="menuposition" value="tabbable tabs-right" />
	<!-- pull-right -->
</g:elseif>
<g:elseif test="${session.layout == 'fluid'}">
	<g:set var="menuposition" value="tabbable tabs-left" />
	<!-- pull-left -->
</g:elseif>
<g:else>
	<g:set var="menuposition" value="fluid" />
</g:else>

<g:if
	test="${params.controller != null
							&&	params.controller != ''
							&&	params.controller != 'home'
							&&	params.controller != 'dashboard'}">
	<ul class="nav nav-list bs-docs-sidenav" style="background: #f5f5f5;">
		<g:set var="entityName"
			value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
		<li class="nav-header">
			${entityName}
		</li>
		<li class="divider"></li>

		<g:if
			test="${params.controller != 'quote' && params.controller != 'report'
											}">
			<li class="${ params.action == "create" ? 'active' : '' }"><g:link
					action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</g:if>
		<g:elseif test="${params.controller == 'quote'}">
			<li><g:link action="create"
					params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]">
										Create Contract Quote
									</g:link></li>

			<li><g:link action="create"
					params="[type:'REPAIR',organizationId:organizationInstance?.id]">
										Create Repair Quote
									</g:link></li>
		</g:elseif>

		<g:if
			test="${params.controller != 'event' && params.controller != 'report'}">
			<li class="${ params.action == "listView" ? 'active' : '' }"><g:link
					action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
		</g:if>

		<g:if test="${ params.action == 'show' || params.action == 'edit' }">
			<!-- the item is an object (not a list) -->
			<li class="${ params.action == "edit" ? 'active' : '' }"><g:link
					action="edit" id="${params.id}">
					<g:message code="default.edit.label" args="[entityName]" />
				</g:link></li>
			<li class=""><g:render template="/_common/modals/deleteTextLink" /></li>
		</g:if>

		<g:if test="${params.controller == 'product'}">
			<g:link action="create" controller="productInventory"
				param="['product.id':productInstance?.id]">
									Add Inventory
								</g:link>
		</g:if>

		<g:if
			test="${params.controller == 'lead' || params.controller == 'organization'}">
			<li><g:link controller="quote" action="create"
					params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]">
										Create Contract Quote
									</g:link></li>
		</g:if>

		<g:if test="${params.controller == 'report'}">
			<li class="${ params.action == "upcomingRepairs" ? 'active' : '' }">
				<g:link controller="report" action="upcomingRepairs">
					<g:message code="default.button.upcomingRepairs.label"
						default="Upcoming Repairs" />
				</g:link>
			</li>

			<li class="${ params.action == "upcomingRenewals" ? 'active' : '' }">
				<g:link controller="report" action="upcomingRenewals">
					<g:message code="default.button.upcomingRenewals.label"
						default="Upcoming Renewals" />
				</g:link>
			</li>

			<li class="${ params.action == "amountReceivables" ? 'active' : '' }">
				<g:link controller="report" action="amountReceivables">
					<g:message code="default.button.amountReceivables.label"
						default="Amount Receivables" />
				</g:link>
			</li>

			<li class="${ params.action == "toBeReplaced" ? 'active' : '' }">
				<g:link controller="report" action="toBeReplaced">
					<g:message code="default.button.toBeReplaced.label"
						default="To Be Replaced" />
				</g:link>
			</li>

			<li class="${ params.action == "isProblemRepeated" ? 'active' : '' }">
				<g:link controller="report" action="isProblemRepeated">
					<g:message code="default.button.isProblemRepeated.label"
						default="Is Problem Repeated" />
				</g:link>
			</li>
		</g:if>

		<li class="divider"></li>

		<li class="nav-header">Options</li>

		<li class="divider"></li>

		<g:if test="${params.action == 'list' || params.action == 'filter' }">
			<g:if
				test="${params.controller == 'lead' || params.controller == 'organization'}">
				<!-- Filter -->
				<filterpane:currentCriteria
					domainBean="com.esms.model.party.Organization"
					removeImgDir="images" removeImgFile="skin/database_delete.png"
					fullAssociationPathFieldNames="no" />
			</g:if>
			<g:elseif test="${params.controller == 'quote'}">
				<filterpane:currentCriteria domainBean="com.esms.model.quote.Quote"
					removeImgDir="images" removeImgFile="skin/database_delete.png"
					fullAssociationPathFieldNames="no" />
			</g:elseif>
			<g:elseif test="${params.controller == 'order'}">
				<filterpane:currentCriteria domainBean="com.esms.model.order.Order"
					removeImgDir="images" removeImgFile="skin/database_delete.png"
					fullAssociationPathFieldNames="no" />
			</g:elseif>
			<g:elseif test="${params.controller == 'employee'}">
				<filterpane:currentCriteria
					domainBean="com.esms.model.party.Employee" removeImgDir="images"
					removeImgFile="skin/database_delete.png"
					fullAssociationPathFieldNames="no" />
			</g:elseif>
			<g:elseif test="${params.controller == 'employee'}">
				<filterpane:currentCriteria
					domainBean="com.esms.model.party.Employee" removeImgDir="images"
					removeImgFile="skin/database_delete.png"
					fullAssociationPathFieldNames="no" />
			</g:elseif>
			<g:elseif test="${params.controller == 'product'}">
				<filterpane:currentCriteria
					domainBean="com.esms.model.product.Product" removeImgDir="images"
					removeImgFile="skin/database_delete.png"
					fullAssociationPathFieldNames="no" />
			</g:elseif>
			<g:elseif
				test="${params.controller == 'report' && params.view == 'amountReceivables'}">
				<filterpane:currentCriteria domainBean="com.esms.model.order.Order"
					removeImgDir="images" removeImgFile="skin/database_delete.png"
					fullAssociationPathFieldNames="no" />
			</g:elseif>

			<filterpane:filterButton title="Filter" />

			<li class="divider"></li>
		</g:if>

		<li>Venus CRM - <g:meta name="app.version" />
		</li>
	</ul>
</g:if>