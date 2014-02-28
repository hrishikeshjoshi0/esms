<div class="btn-group">
	<g:link class="btn btn-default btn-sm" controller="${params.controller}"
		action="list" role="button">
		View All
	</g:link>

	<div class="btn-group">
		<button type="button" class="btn btn-default btn-sm dropdown-toggle"
			data-toggle="dropdown">
			Actions <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li>
				<a
					href="<g:createLink controller="${params.controller}" action="create"  />">
					Create New
				</a>
			</li>
			<li>
				<g:link action="edit" controller="${params.controller}"
					id="${params.id}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
			</li>
			<li>
				<g:link action="delete" class="deleteBtn" controller="${params.controller}"
					id="${params.id}">
					<g:message code="default.button.delete.label" default="Delete" />
				</g:link>
			</li>
		</ul>
	</div>

</div>