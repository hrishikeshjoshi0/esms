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

<div class="sidebar">
	<br /> <br />
	<div class="antiScroll">
		<div class="antiscroll-inner">
			<div class="antiscroll-content">
				<div class="sidebar_inner">
					<g:if
						test="${	params.controller != null
							&&	params.controller != ''
							&&	params.controller != 'home'
							&&	params.controller != 'dashboard'
					}">
						<ul class="nav nav-list">
							<g:set var="entityName"
								value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
							<li class="nav-header">
								${entityName}
							</li>
							<li class="divider"></li>

							<g:if test="${params.controller != 'quote'}">
								<li class="${ params.action == "create" ? 'active' : '' }">
									<g:link action="create">
										<i class="icon-chevron-right"></i>
										<g:message code="default.new.label" args="[entityName]" />
									</g:link>
								</li>
							</g:if>
							<g:elseif test="${params.controller == 'quote'}">
								<li><g:link action="create"
										params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]">
										<i class="icon-chevron-right"></i> 
										Create Contract Quote
									</g:link></li>

								<li><g:link action="create"
										params="[type:'REPAIR',organizationId:organizationInstance?.id]">
										<i class="icon-chevron-right"></i> 
										Create Repair Quote
									</g:link></li>

								<g:if
									test="${quoteInstance?.type == 'CONTRACT' && quoteInstance.id}">
									<i class="icon-chevron-right"></i>
									<g:jasperReport jasper="ContractQuotePrint" format="PDF"
										name="Print Quotation" delimiterAfter=" " delimiterBefore=" "
										heightAttr="15px">
										<input type="hidden" name="quote" value="${quoteInstance.id}" />
									</g:jasperReport>
								</g:if>
							</g:elseif>

							<g:if test="${params.controller != 'event'}">
								<li class="${ params.action == "list" ? 'active' : '' }"><g:link
										action="list">
										<i class="icon-chevron-right"></i>
										<g:message code="default.list.label" args="[entityName]" />
									</g:link></li>
							</g:if>

							<g:if
								test="${ params.action == 'show' || params.action == 'edit' }">
								<!-- the item is an object (not a list) -->
								<li class="${ params.action == "edit" ? 'active' : '' }"><g:link
										action="edit" id="${params.id}">
										<i class="icon-chevron-right"></i>
										<g:message code="default.edit.label" args="[entityName]" />
									</g:link></li>
								<li class=""><g:render
										template="/_common/modals/deleteTextLink" /></li>
							</g:if>

							<g:if test="${params.controller == 'product'}">
								<g:link action="create" controller="productInventory"
									param="['product.id':productInstance?.id]">
									<i class="icon-plus"></i>
									Add Inventory
								</g:link>
							</g:if>

							<g:if
								test="${params.controller == 'lead' || params.controller == 'organization'}">
								<li><g:link controller="quote" action="create"
										params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]">
										<i class="icon-chevron-right"></i>
										Create Contract Quote
									</g:link></li>
							</g:if>

							<g:if
								test="${params.controller == 'order' && orderInstance?.status == 'INVOICED'}">
								<li><g:if test="${orderInstance?.status == 'INVOICED'}">
										<g:link action="create" controller="payment"
											params="[orderId :orderInstance.id]">
											<i class="icon-chevron-right"></i>
											<g:message code="default.button.registerPayment.label"
												default="Register Payment" />
										</g:link>
									</g:if></li>
							</g:if>
						</ul>
					</g:if>
					<g:elseif
						test="${params.controller != null &&	params.controller == 'dashboard'}">
						<ul class="nav nav-list bs-docs-sidenav">
							<g:set var="entityName" value="Reports" />
							<li class="nav-header">
								${entityName}
							</li>
							<li class="divider"></li>

							<li
								class="${ params.action == "quotesByStatus" ? 'active' : '' }">
								<g:link action="quotesByStatus">
									<i class="icon-chevron-right"></i>
										Quotes By Status Report
									</g:link>
							</li>

							<li class="${params.action == "ordersByStatus" ? 'active' : '' }">
								<g:link action="ordersByStatus">
									<i class="icon-chevron-right"></i>
										Orders By Status Report
									</g:link>
							</li>

							<li
								class="${params.action == "invoicesByStatus" ? 'active' : '' }">
								<g:link action="invoicesByStatus">
									<i class="icon-chevron-right"></i>
										Invoices By Status Report
									</g:link>
							</li>
						</ul>
					</g:elseif>
					<g:else>

					</g:else>
					<%--<div id="side_accordion" class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<a href="#collapseOne" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="icon-folder-close"></i> Content
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseOne">
								<div class="accordion-inner">
									<ul class="nav nav-list">
										<li><a href="javascript:void(0)">Articles</a></li>
										<li><a href="javascript:void(0)">News</a></li>
										<li><a href="javascript:void(0)">Newsletters</a></li>
										<li><a href="javascript:void(0)">Comments</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="accordion-group">
							<div class="accordion-heading">
								<a href="#collapseTwo" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="icon-th"></i> Modules
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseTwo">
								<div class="accordion-inner">
									<ul class="nav nav-list">
										<li><a href="javascript:void(0)">Content blocks</a></li>
										<li><a href="javascript:void(0)">Tags</a></li>
										<li><a href="javascript:void(0)">Blog</a></li>
										<li><a href="javascript:void(0)">FAQ</a></li>
										<li><a href="javascript:void(0)">Formbuilder</a></li>
										<li><a href="javascript:void(0)">Location</a></li>
										<li><a href="javascript:void(0)">Profiles</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="accordion-group">
							<div class="accordion-heading">
								<a href="#collapseThree" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="icon-user"></i> Account manager
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseThree">
								<div class="accordion-inner">
									<ul class="nav nav-list">
										<li><a href="javascript:void(0)">Members</a></li>
										<li><a href="javascript:void(0)">Members groups</a></li>
										<li><a href="javascript:void(0)">Users</a></li>
										<li><a href="javascript:void(0)">Users groups</a></li>
									</ul>

								</div>
							</div>
						</div>
						<div class="accordion-group">
							<div class="accordion-heading">
								<a href="#collapseFour" data-parent="#side_accordion"
									data-toggle="collapse" class="accordion-toggle"> <i
									class="icon-cog"></i> Configuration
								</a>
							</div>
							<div class="accordion-body collapse" id="collapseFour">
								<div class="accordion-inner">
									<ul class="nav nav-list">
										<li class="nav-header">People</li>
										<li class="active"><a href="javascript:void(0)">Account
												Settings</a></li>
										<li><a href="javascript:void(0)">IP Adress Blocking</a></li>
										<li class="nav-header">System</li>
										<li><a href="javascript:void(0)">Site information</a></li>
										<li><a href="javascript:void(0)">Actions</a></li>
										<li><a href="javascript:void(0)">Cron</a></li>
										<li class="divider"></li>
										<li><a href="javascript:void(0)">Help</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					--%>
					<div class="push"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<%--<div class="${menuposition}">
	
	<ul class="${menutype} nav nav-pills nav-stacked" data-role="listview" data-split-icon="gear" data-filter="true">
	
		<g:each status="i" var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName } }">
			<li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
				<g:link controller="${c.logicalPropertyName}" action="index">
					<g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
				</g:link>
			</li>
		</g:each>
	</ul>
	
	<g:if test="${	params.controller != null
			&&	params.controller != ''
			&&	params.controller != 'home'
			&&	params.controller != 'dashboard'
	}">
		<ul class="nav nav-list bs-docs-sidenav">
		  <g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />	
		   <li class="nav-header">${entityName}</li>
	  	   <li class="divider"></li>
	  	   
	  	   <g:if test="${params.controller != 'quote'}">
				<li class="${ params.action == "create" ? 'active' : '' }">
					<g:link action="create">
						<i class="icon-chevron-right"></i>
						<g:message code="default.new.label"  args="[entityName]"/>
					</g:link>
				</li>	  	   		
	  	   </g:if>
	  	   <g:elseif test="${params.controller == 'quote'}">
	  	   		<li>
	  	   			<g:link action="create" params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]">
	  	   				<i class="icon-chevron-right"></i> 
						Create Contract Quote
					</g:link>
				</li>	
				
				<li>
					<g:link action="create" params="[type:'REPAIR',organizationId:organizationInstance?.id]">
						<i class="icon-chevron-right"></i> 
						Create Repair Quote
					</g:link>
				</li>
				
				<g:if test="${quoteInstance?.type == 'CONTRACT' && quoteInstance.id}">
					<i class="icon-chevron-right"></i>
					<g:jasperReport jasper="ContractQuotePrint" format="PDF" name="Print Quotation" delimiterAfter=" " delimiterBefore=" " heightAttr="15px">
						<input type="hidden" name="quote" value="${quoteInstance.id}" />
					</g:jasperReport>
				</g:if>
	  	   </g:elseif>
	  	   
	  	   <g:if test="${params.controller != 'event'}">
				<li class="${ params.action == "list" ? 'active' : '' }">
					<g:link action="list">	
						<i class="icon-chevron-right"></i>
						<g:message code="default.list.label" args="[entityName]"/>
					</g:link>
				</li>
			</g:if>
			
			<g:if test="${ params.action == 'show' || params.action == 'edit' }">
				<!-- the item is an object (not a list) -->
				<li class="${ params.action == "edit" ? 'active' : '' }">
					<g:link action="edit" id="${params.id}">
						<i class="icon-chevron-right"></i>
						<g:message code="default.edit.label"  args="[entityName]"/>
					</g:link>
				</li>
				<li class="">
					<g:render template="/_common/modals/deleteTextLink"/>
				</li>
		   </g:if>
		   
		   <g:if test="${params.controller == 'product'}">
			   <g:link action="create" controller="productInventory" param="['product.id':productInstance?.id]">
					<i class="icon-plus"></i>
					Add Inventory
				</g:link>
			</g:if>
			
			<g:if test="${params.controller == 'lead' || params.controller == 'organization'}">
			   <li>
					<g:link controller="quote" action="create" params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]"> 
						<i class="icon-chevron-right"></i>
						Create Contract Quote
					</g:link>
				</li>	
			</g:if>
			
			<g:if test="${params.controller == 'order' && orderInstance?.status == 'INVOICED'}">
			   <li>
					<g:if test="${orderInstance?.status == 'INVOICED'}">
						<g:link action="create" controller="payment"
							params="[orderId :orderInstance.id]">
							<i class="icon-chevron-right"></i>
							<g:message code="default.button.registerPayment.label"
								default="Register Payment" />
						</g:link>
					</g:if>
				</li>	
			</g:if>
		</ul>
		
		<ul id="" class="${menutype}" data-role="listview" data-split-icon="gear" data-filter="true">
	
			<g:set var="entityName" value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() + params.controller.substring(1).toLowerCase())}" />
			
			<g:if test="${params.controller != 'event'}">
			<li class="${ params.action == "list" ? 'active' : '' }">
				<g:link action="list"><i class="icon-th-list"></i> <g:message code="default.list.label" args="[entityName]"/></g:link>
			</li>
			</g:if>
			
			<li class="${ params.action == "create" ? 'active' : '' }">
				<g:link action="create"><i class="icon-plus"></i> <g:message code="default.new.label"  args="[entityName]"/></g:link>
			</li>
			
			<g:if test="${ params.action == 'show' || params.action == 'edit' }">
				<!-- the item is an object (not a list) -->
				<li class="${ params.action == "edit" ? 'active' : '' }">
					<g:link action="edit" id="${params.id}"><i class="icon-pencil"></i> <g:message code="default.edit.label"  args="[entityName]"/></g:link>
				</li>
				<li class="">
					<g:render template="/_common/modals/deleteTextLink"/>
				</li>
			</g:if>
			
		</ul>
	</g:if>
		<g:elseif test="${params.controller != null &&	params.controller == 'dashboard'}">
			<ul class="nav nav-list bs-docs-sidenav">
			  <g:set var="entityName" value="Reports" />	
			   <li class="nav-header">${entityName}</li>
		  	   <li class="divider"></li>
		  	   
			   <li class="${ params.action == "quotesByStatus" ? 'active' : '' }">
					<g:link action="quotesByStatus">
						<i class="icon-chevron-right"></i>
						Quotes By Status Report
					</g:link>
			   </li>
			   
			   <li class="${params.action == "ordersByStatus" ? 'active' : '' }">
					<g:link action="ordersByStatus">
						<i class="icon-chevron-right"></i>
						Orders By Status Report
					</g:link>
			   </li>
			   
			   <li class="${params.action == "invoicesByStatus" ? 'active' : '' }">
					<g:link action="invoicesByStatus">
						<i class="icon-chevron-right"></i>
						Invoices By Status Report
					</g:link>
			   </li>	  	   		
	  	   </ul>
		</g:elseif>
		<g:else>
			
		</g:else>
</div>
--%>