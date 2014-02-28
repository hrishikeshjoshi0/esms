		<%--<div class="btn-group">
			<button type="button" class="btn btn-sm">Archive</button>
			<button type="button" class="btn btn-sm">Spam</button>
			<button type="button" class="btn btn-sm">Delete</button>
			<div class="btn-group">
				<button type="button" class="btn btn-sm dropdown-toggle"
					data-toggle="dropdown">
					More <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">Dropdown link</a></li>
					<li><a href="#">Dropdown link</a></li>
				</ul>
			</div>
		</div>
		--%>
		<%
			def controller = params.controller
			def action = params.action
			def defaultLayoutPath = "/layouts/actions/${controller}/${action}"
			
		 %>
		 <template:renderActions  /> 
	</div>
</div>