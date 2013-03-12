<g:if test="${session.layout == null || session.layout == 'grid'}">
	<g:set var="menutype" value="nav nav-pills" />
</g:if>
<g:else>
	<g:set var="menutype" value="nav nav-tabs" />
</g:else>

<!-- position of menu: LTR (left-to-right, European) or RTL (right-to-left, Oriental) -->
<g:if test="${session.menuposition == 'right' && session.layout == 'grid'}">
	<g:set var="menuposition" value="pull-right" />
</g:if>
<g:elseif test="${session.menuposition == 'right' && session.layout == 'fluid'}">
	<g:set var="menuposition" value="tabbable tabs-right" /> <!-- pull-right -->
</g:elseif>
<g:elseif test="${session.layout == 'fluid'}">
	<g:set var="menuposition" value="tabbable tabs-left" /> <!-- pull-left -->
</g:elseif>
<g:else>
	<g:set var="menuposition" value="fluid" />
</g:else>

<div class="${menuposition}">
	<%--
	<ul class="${menutype} nav nav-pills nav-stacked" data-role="listview" data-split-icon="gear" data-filter="true">
	
		<g:each status="i" var="c" in="${grailsApplication.controllerClasses.sort { it.logicalPropertyName } }">
			<li class="controller${params.controller == c.logicalPropertyName ? " active" : ""}">
				<g:link controller="${c.logicalPropertyName}" action="index">
					<g:message code="${c.logicalPropertyName}.label" default="${c.logicalPropertyName.capitalize()}"/>
				</g:link>
			</li>
		</g:each>
	</ul>
	--%>
	<g:if test="${	params.controller != null
			&&	params.controller != ''
			&&	params.controller != 'home'
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
	  	   			<g:link action="create" params="[contractQuote:true,type:'CONTRACT']">
	  	   				<i class="icon-chevron-right"></i> 
						Create Contract Quote
					</g:link>
				</li>	
				
				<li>
					<g:link action="create" params="[type:'REPAIR']">
						<i class="icon-chevron-right"></i> 
						Create Repair Quote
					</g:link>
				</li>
				
				<g:if test="${quoteInstance?.type == 'CONTRACT'}">
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
			
			<g:if test="${params.controller == 'lead'}">
			   <li>
					<g:link controller="quote" action="create" params="[contractQuote:true,type:'CONTRACT']"> 
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
		
		<%--<ul id="" class="${menutype}" data-role="listview" data-split-icon="gear" data-filter="true">
	
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
	--%></g:if>
	<g:else>
		<ul class="nav nav-list bs-docs-sidenav">
          <li class="active"><a href="#dropdowns"><i class="icon-chevron-right"></i> Dropdowns</a></li>
          <li><a href="#buttonGroups"><i class="icon-chevron-right"></i> Button groups</a></li>
          <li><a href="#buttonDropdowns"><i class="icon-chevron-right"></i> Button dropdowns</a></li>
          <li><a href="#navs"><i class="icon-chevron-right"></i> Navs</a></li>
          <li><a href="#navbar"><i class="icon-chevron-right"></i> Navbar</a></li>
          <li><a href="#breadcrumbs"><i class="icon-chevron-right"></i> Breadcrumbs</a></li>
          <li><a href="#pagination"><i class="icon-chevron-right"></i> Pagination</a></li>
          <li><a href="#labels-badges"><i class="icon-chevron-right"></i> Labels and badges</a></li>
          <li><a href="#typography"><i class="icon-chevron-right"></i> Typography</a></li>
          <li><a href="#thumbnails"><i class="icon-chevron-right"></i> Thumbnails</a></li>
          <li><a href="#alerts"><i class="icon-chevron-right"></i> Alerts</a></li>
          <li><a href="#progress"><i class="icon-chevron-right"></i> Progress bars</a></li>
          <li><a href="#media"><i class="icon-chevron-right"></i> Media object</a></li>
          <li><a href="#misc"><i class="icon-chevron-right"></i> Misc</a></li>
        </ul>
	</g:else>
</div>
