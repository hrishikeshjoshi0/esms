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
		</ul>
	</div>

</div>