<g:if
	test="${params.controller != null
							&&	params.controller != ''
							&&	params.controller != 'home'
							&&	params.controller != 'dashboard'}">

	<div id="quicklinks">
		<div>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        
		<div class="row visible-md visible-lg">
			<div class="col-md-12">
				<g:render template="/_common/suggest" />
			</div>
		</div>
		
		<div class="row visible-md visible-lg">
			<div class="col-md-12">
				<div class="page-header">
					<h5>
						Quick Links
					</h5>
				</div>
	
				<div class="list-group">
					<g:set var="entityName"
						value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() 
					+ params.controller.substring(1).toLowerCase())}" />
					
					<!-- Create New Xxx -->
					<g:if
						test="${params.controller != 'quote' && params.controller != 'report'}">
						<g:link action="create"
							class="list-group-item ${ params.action == "create" ? 'active' : '' }">
							<g:message code="default.new.label" args="[entityName]" />
						</g:link>
					</g:if>
					<!-- Create New Xxx Ends -->
					
					<!-- Quick Links - Lead -->
					<g:if
						test="${params.controller == 'lead' && params.action == 'show'}">
						
						<g:if test="${organizationInstance.salesStatus == 'LEAD'}">
							<g:link controller="organization" action="convertLeadToCustomer"
										id="${organizationInstance?.id}" class="list-group-item">
								Convert Lead
							</g:link>
						</g:if>
					
						<g:link action="create" controller="quote"
							class="list-group-item ${ params.action == "create"  && params.type=='CONTRACT'? 'active' : '' }"
							params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]">
							Create Contract Quote
						</g:link>
						
						<g:link action="create" controller="quote"
							class="list-group-item ${ params.action == "create"  && params.type=='REPAIR'? 'active' : '' }"
							params="[type:'REPAIR',organizationId:organizationInstance?.id]">
							Create Repair Quote
						</g:link>
						
						<a
							href="<g:createLink controller="event" action="create" params="['party.id':organizationInstance.id]" />"
							role="button" class="list-group-item"> <i class="icon-plus"></i>
							Create New Event
						</a>
					</g:if>
					<!-- Quick Links - Lead Ends -->
					
					<!-- List All Xxx -->
					<g:if
						test="${params.controller != 'event' && params.controller != 'report'}">
						<g:link
							class="list-group-item ${ params.action == "list" ? 'active' : '' }"
							action="list">
							<g:message code="default.list.label" args="[entityName]" />
						</g:link>
					</g:if>
					<!-- List All Xxx Ends -->
					
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
					<g:if test="${params.controller == 'event'}">
						<g:link class="list-group-item ${ params.action == "listView" ? 'active' : '' }" controller="event" action="listView">All Events</g:link>
						<g:link class="list-group-item ${ params.action == "upcomingEvents" ? 'active' : '' }" controller="event" action="upcomingEvents">Upcoming Events</g:link>
						<g:link class="list-group-item ${ params.action == "overdueEvents" ? 'active' : '' }" controller="event" action="overdueEvents">Overdue Events</g:link>
						<%--<g:link class="list-group-item ${ params.action == "create" && params.controller=="task" ? 'active' : '' }" controller="task" action="create" params="[relatedTo:'ADMINISTRATION']">Create Task</g:link>
						--%>
					</g:if>
				</div>
				
				<g:if test="${params.action == 'list' || params.action == 'filter' }">
					<div class="page-header">
						<h5>
							<filterpane:filterButton title="Apply Filter" class="" />
						</h5>
					</div>
				</g:if>
						
				<div class="list-group">
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
						<g:elseif test="${params.controller == 'invoice'}">
							<filterpane:currentCriteria
								domainBean="com.esms.model.invoice.Invoice" removeImgDir="images"
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
					</g:if>
				</div>
				
			</div>
		</div>
	</div>
</g:if>