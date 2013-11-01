<%--<ul class="nav pull-right">
	<li class="dropdown">
		<i class="icon-user icon-white"></i><sec:username /> (<g:link controller="logout">sign out</g:link>)
	</li>
</ul>	
--%>
<ul class="nav pull-right">
	<li class="dropdown">
		<a class="user-link dropdown-toggle" data-toggle="dropdown" href="#">
			<i class="icon-user icon-white"></i>
			Welcome, <sec:username />
			<b class="caret"></b>
		</a>
		<ul class="dropdown-menu">
			<li>
				<g:link class="user-link dropdown-toggle" controller="logout">sign out</g:link>
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

		