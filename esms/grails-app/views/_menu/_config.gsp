<ul class="nav pull-right">
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
			<i class="glyphicon glyphicon-cog glyphicon glyphicon-large glyphicon glyphicon-white"></i>
			Settings
		</a>
		<ul class="dropdown-menu">
			<li class="controller">
				<a tabindex="-1" href="#"><b>Visual Style</b></a>
			</li>
			<li class="dropdown-submenu">
				<a href="#" class="dropdown-toggle">
					<i class="${params.layout == 'fluid' ? 'glyphicon glyphicon-resize-full' : 'glyphicon glyphicon-resize-vertical'}"></i>
					<span class="js-current-language">${layout ? layout.toString().toUpperCase() : "${message(code: 'default.layout.label', default: 'Layout')}"}</span>
				</a>
				<ul class="dropdown-menu dropdown-menu-dark">
					<li><a class="" title="Vertical" href="${request.forwardURI+'?layout=grid'}">
						<i class="glyphicon glyphicon-resize-vertical"></i>
						<g:message code="default.layout.fluid.label" default="Grid 940px (Menu Top)"/>
					</a></li>
					<li><a class="" title="Horizontal" href="${request.forwardURI+'?layout=fluid'}">
						<i class="glyphicon glyphicon-resize-full"></i>
						<g:message code="default.layout.fluid.label" default="Fluid (Menu Left)"/>
					</a></li>
				</ul>
			</li>
			<li class="dropdown-submenu">
				<a href="#" class="dropdown-toggle">
					<span class="js-current-language">${message(code: 'default.skin.label', default: 'Skin')}</span>
				</a>
				<ul class="dropdown-menu dropdown-menu-dark">
					<li>
						<a title="Original" href="${request.forwardURI+'?skin=bootstrap'}">
							<g:message code="default.skin.original.label" default="Bright (Original)"/>
						</a>
					</li>
					<li>
						<a title="Skin A"    href="${request.forwardURI+'?skin=bootstrap_skinA'}">
							<g:message code="default.skin.skinA.label"    default="Dark (Cyborg)"/>
						</a>
					</li>
				</ul>
			</li>
		</ul>
	</li>
</ul>

<noscript>
<ul class="nav pull-right">
	<li class="">
		<g:link controller="user" action="config"><g:message code="user.config.label" default="Config"/></g:link>
	</li>
</ul>
</noscript>
