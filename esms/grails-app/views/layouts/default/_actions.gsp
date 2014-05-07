<g:set var="entityName"
	value="${message(code: params.controller+'.label', default: params.controller.substring(0,1).toUpperCase() 
					+ params.controller.substring(1).toLowerCase())}" />
<div class="well">
					
<!-- Action button -->
<div class="btn-group">
	<button type="button"
		class="btn btn-default btn-sm btn-flat dropdown-toggle"
		data-toggle="dropdown">
		Action <span class="caret"></span>
	</button>
	<ul class="dropdown-menu" role="menu">
		<!-- Create New Xxx -->
		<g:if
			test="${params.controller != 'quote' && params.controller != 'report'}">
			<li>
					<g:link action="create"
						class="list-group-item ${ params.action == "create" ? 'active' : '' }">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link>
			</li>
		</g:if>
		<!-- Create New Xxx Ends -->
		<li class="divider"></li>
		<li><a href="#">Mark as unread</a></li>
		<li class="divider"></li>
		<li><a href="#">Move to junk</a></li>
		<li class="divider"></li>
		<li><a href="#">Delete</a></li>
	</ul>
</div>

</div>