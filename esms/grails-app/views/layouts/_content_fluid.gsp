<div id="Content" class="container-fluid">

	<!-- Main menu in one line (e.g., controller entry points -->
	<div class="row-fluid">
		<div class="span3">
			<div class="well">
				<!--Sidebar content-->
				<g:render template="/_menu/menubar" />
			</div>
		</div>

		<div class="span9">
			<!--Body content-->
			<!-- Secondary menu in one line (e.g., actions for current controller) -->
			<div class="page-header">
				<h1>
					<g:message code="default.list.label" args="[entityName]" />
				</h1>
			</div>

			<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">\${flash.message}</bootstrap:alert>
			</g:if>
			
			<div>
				<g:render template="/_menu/submenubar" />

				<div>
					<g:layoutBody />
					<g:pageProperty name="page.body" />
				</div>
			</div>

		</div>
	</div>
</div>