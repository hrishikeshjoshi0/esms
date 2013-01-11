<div id="Content" class="container-fluid">

	<!-- Main menu in one line (e.g., controller entry points -->
	<div class="row-fluid">
		<div class="span3">
			<div class="well">
				<!--Sidebar content-->
				<g:render template="/_menu/menubar" />
			</div>
		</div>
		
		<div class="span9" style="margin-top: 20px;">
			<!--Body content-->
			<!-- Secondary menu in one line (e.g., actions for current controller) -->
			<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
			</g:if>
			<br/>
			<div>
				<%--<div class="row-fluid">
					<div class="span12">
						<g:render template="/_menu/submenubar" />
					</div>
				</div>

				--%><div>
					<g:layoutBody />
					<g:pageProperty name="page.body" />
				</div>
			</div>

		</div>
	</div>
</div>