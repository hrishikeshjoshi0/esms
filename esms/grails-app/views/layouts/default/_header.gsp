<div class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a href="../" class="navbar-brand"> DexSales </a>
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target="#navbar-main">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" id="navbar-main">
			<ul class="nav navbar-nav">
				<li><a href="index.html"><span>Dashboard</span> </a></li>
				<li><a href="index.html"><span>Sales</span> </a></li>
				<li><a href="index.html"><span>CRM</span> </a></li>
				<li><a href="index.html"><span>Inventory</span> </a></li>
				<li><a href="index.html"><span>Invoicing</span> </a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <span>Settings</span> <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="javascript:;">Settings</a></li>
						<li><a href="javascript:;">Help</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="icon-cog"></i> <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="javascript:;">Settings</a></li>
						<li><a href="javascript:;">Help</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="icon-user"></i> Admin <b
						class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="javascript:;">Profile</a></li>
						<li><a href="javascript:;">Logout</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>
<!-- /navbar -->

<%--<g:if test="${params.action == 'list' || params.action == 'filter'}">
	<g:render template="/layouts/default/actions" />
</g:if>
--%>
<div class="subnavbar">
	<div class="subnavbar-inner">
		<div class="container">
			<ul class="mainnav">
				<g:if test="${organizationInstance?.salesStatus == 'LEAD'}">
					<li>
						<g:link controller="organization"
							action="convertLeadToCustomer" id="${organizationInstance?.id}"
							role="button">
									Convert Lead
						</g:link>
					</li>
					
					<li>
						<g:link action="disqualifyLead"
								controller="lead" id="${organizationInstance?.id}">
							Disqualify Lead
						</g:link>
					</li>
				</g:if>

				<li>
					<g:link action="edit" controller="lead" id="${organizationInstance?.id}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
				</li>

				<li>
					<g:link class="deleteBtn" action="delete" controller="lead" id="${organizationInstance?.id}">
						<g:message code="default.button.delete.label" default="Delete" />
					</g:link>
				</li>
				
				<li>
					<g:if test="${organizationInstance?.salesStatus != 'LOST' }">
						<bs3:modalLink id="lostLead"
							href="${createLink(controller:'lead',action:'lostLead',id:organizationInstance?.id)}"
							title="Mark As Lost" />
					</g:if>
				</li>
				
				<li class="dropdown">
					<a href="javascript:;"
						class="dropdown-toggle" data-toggle="dropdown"> <span> <span
							class="icon-cog"></span> Actions
						</span>
					</a>
					<ul class="dropdown-menu">
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
				</li>
			</ul>
		</div>
		<!-- /container -->
	</div>
	<!-- /subnavbar-inner -->
</div>
<!-- /subnavbar -->