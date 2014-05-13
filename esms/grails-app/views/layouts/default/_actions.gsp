<g:set var="entityName"
	value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() 
					+ params.controller.substring(1).toLowerCase())}" />
<div class="well">
	<!-- Action button -->
	<div class="btn-group">
		<button type="button"
			class="btn btn-default btn-sm btn-flat dropdown-toggle"
			data-toggle="dropdown">
			<i class="fa fa-cog"></i> 
			Action 
			<span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<!-- Create New Xxx -->
			<g:if
				test="${params.controller != 'report'}">
				<li>
					<g:link action="create">
						<i class="fa fa-plus"></i> 
						<g:message code="default.new.label" args="[entityName]" />
					</g:link>
				</li>
			</g:if>
			<!-- Create New Xxx Ends -->
		</ul>
	</div>
	
	<g:if test="${params.action == 'list' || params.action == 'filter' }">
		<filterpane:filterButton title="Apply Filter" class="" />
	</g:if>	
</div>