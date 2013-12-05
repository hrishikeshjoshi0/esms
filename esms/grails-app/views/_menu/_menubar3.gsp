<g:if
	test="${params.controller != null
							&&	params.controller != ''
							&&	params.controller != 'home'
							&&	params.controller != 'dashboard'}">

	<div class="row">
		<div class="col-md-12">
			<g:render template="/_common/suggest" />
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h4>
					Quick Links
				</h4>
			</div>

			<div class="list-group">
				<g:set var="entityName"
					value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() 
				+ params.controller.substring(1).toLowerCase())}" />
				<g:if
					test="${params.controller != 'quote' && params.controller != 'report'}">
					<g:link action="create"
						class="list-group-item ${ params.action == "create" ? 'active' : '' }">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link>
				</g:if>
				<g:if
					test="${params.controller == 'lead' && params.action == 'show'}">
					<g:if test="${organizationInstance.salesStatus == 'LEAD'}">
						<g:link controller="organization" action="convertLeadToCustomer"
							id="${organizationInstance?.id}" class="list-group-item">
					Convert Lead
				</g:link>

						<button class="list-group-item" type="submit"
							name="_action_disqualifyLead">
							<i class="icon-trash icon-white"></i> Disqualify Lead
						</button>
					</g:if>
					<g:link action="create"
						class="list-group-item ${ params.action == "create"  && params.type=='CONTRACT'? 'active' : '' }"
						params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]">
					Create Contract Quote
			</g:link>
					<g:link action="create"
						class="list-group-item ${ params.action == "create"  && params.type=='REPAIR'? 'active' : '' }"
						params="[type:'REPAIR',organizationId:organizationInstance?.id]">
					Create Repair Quote
			</g:link>
					<a data-toggle="modal" data-target="#addressModal" role="button"
						class="list-group-item"
						href="<g:createLink controller="lead" action="createAddress" params="['party.id':organizationInstance?.id]" />">
						New Address </a>
					<a data-toggle="modal" data-target="#contactModal" role="button"
						href="<g:createLink controller="lead" action="createContact" params="['party.id':organizationInstance?.id]" />"
						class="list-group-item"> <i class="icon-plus"></i> New Contact
					</a>
					<a
						href="<g:createLink controller="event" action="create" params="['party.id':organizationInstance.id]" />"
						role="button" class="list-group-item"> <i class="icon-plus"></i>
						New Event
					</a>
					<a data-toggle="modal" href="#" data-target="#phoneBookModal"
						role="button" class="list-group-item"> <i class="icon-plus"></i>
						New Phone Book
					</a>
				</g:if>
				<g:if
					test="${params.controller != 'event' && params.controller != 'report'}">
					<g:link
						class="list-group-item ${ params.action == "list" ? 'active' : '' }"
						action="list">
						<g:message code="default.list.label" args="[entityName]" />
					</g:link>
				</g:if>
				<g:if
					test="${productInstance?.isVirtual == false && productInstance?.requiresInventory == null}">
					<g:if test="${params.controller == 'product'}">
						<g:link
							class="list-group-item ${ params.controller == "productInventory" && params.action == "create" ? 'active' : '' }"
							action="create" controller="productInventory"
							param="['product.id':productInstance?.id]">
						Add Inventory
					</g:link>
					</g:if>
				</g:if>
				<g:if test="${params.controller == 'report'}">
					<g:link controller="report" action="upcomingRepairs"
						class="list-group-item ${params.action == "upcomingRepairs" ? 'active' : '' }">
						<g:message code="default.button.upcomingRepairs.label"
							default="Upcoming Repairs" />
					</g:link>

					<g:link controller="report" action="upcomingRenewals"
						class="list-group-item ${params.action == "upcomingRenewals" ? 'active' : '' }">
						<g:message code="default.button.upcomingRenewals.label"
							default="Upcoming Renewals" />
					</g:link>

					<g:link controller="report" action="amountReceivables"
						class="list-group-item ${ params.action == "amountReceivables" ? 'active' : '' }">
						<g:message code="default.button.amountReceivables.label"
							default="Amount Receivables" />
					</g:link>

					<g:link controller="report" action="toBeReplaced"
						class="list-group-item ${ params.action == "toBeReplaced" ? 'active' : '' }">
						<g:message code="default.button.toBeReplaced.label"
							default="To Be Replaced" />
					</g:link>

					<g:link controller="report" action="isProblemRepeated"
						class="list-group-item ${ params.action == "isProblemRepeated" ? 'active' : '' }">
						<g:message code="default.button.isProblemRepeated.label"
							default="Is Problem Repeated" />
					</g:link>
				</g:if>

				<g:if
					test="${params.action == 'list' || params.action == 'filter' }">
					<g:if
						test="${params.controller == 'lead' || params.controller == 'organization'}">
						<filterpane:currentCriteria
							domainBean="com.esms.model.party.Organization"
							removeImgDir="images" removeImgFile="skin/database_delete.png"
							fullAssociationPathFieldNames="no" />
					</g:if>
					<g:elseif test="${params.controller == 'quote'}">
						<filterpane:currentCriteria
							domainBean="com.esms.model.quote.Quote" removeImgDir="images"
							removeImgFile="skin/database_delete.png"
							fullAssociationPathFieldNames="no" />
					</g:elseif>
					<g:elseif test="${params.controller == 'order'}">
						<filterpane:currentCriteria
							domainBean="com.esms.model.order.Order" removeImgDir="images"
							removeImgFile="skin/database_delete.png"
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
						<filterpane:currentCriteria
							domainBean="com.esms.model.order.Order" removeImgDir="images"
							removeImgFile="skin/database_delete.png"
							fullAssociationPathFieldNames="no" />
					</g:elseif>

					<filterpane:filterButton title="Filter" class="list-group-item" />
				</g:if>
			</div>
		</div>
	</div>
</g:if>