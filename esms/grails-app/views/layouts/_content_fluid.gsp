<div id="Content" class="container-fluid">

	<!-- Main menu in one line (e.g., controller entry points -->
	<div class="row-fluid">
		<div class="span12"
			style="margin-top: 25px;">
			<div class="">
				<!--Sidebar content-->
				<g:render template="/_menu/menubar" />
			</div>
			
			<!--Body content-->
			<!-- Secondary menu in one line (e.g., actions for current controller) -->
			<g:if test="${flash.message}">
				<div style="margin: 10px;">
					<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</div>
			</g:if>
			<div style="margin-top: -10px;">
				<%--<div class="row-fluid">
					<div class="span12">
						<g:render template="/_menu/submenubar" />
					</div>
				</div>

				--%>
					<g:layoutBody />
					<g:pageProperty name="page.body" />
			</div>
		</div>
	</div>
</div>