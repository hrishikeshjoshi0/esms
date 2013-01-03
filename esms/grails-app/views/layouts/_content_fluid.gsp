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
			<div class="row">
				<div class="span12" style="margin-top: 50px;">
					<!-- print system messages (infos, warnings, etc) - not validation errors -->
					<g:if test="${flash.message}">
						<div class="alert alert-info">
							${flash.message}
						</div>
					</g:if>
				</div>
				
				<div class="span12">
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
	</div>
</div>