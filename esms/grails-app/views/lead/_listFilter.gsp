<div class="searchDiv" style="padding:10px;width:100%;height:50px;">
	<g:form action="list" class="form-inline" method="GET">
		<g:hiddenField name="search" value="${params.search}" />
		<table style="background-color: #EEE; width: 60%;">
			<tr>
				<td>Name :</td>
				<td><richui:autoComplete name="name" value="${params.name}"
						class="input-medium"
						action="${createLinkTo('dir': 'organization/searchAJAX')}"
						forceSelection="false" typeAhead="true" shadow="true"
						minQueryLength="2" /></td>
				<td>Sales Stage :</td>
				<td>
					<button type="submit" class="btn btn-default btn-xs">
						<i class="glyphicon glyphicon-search"></i> Search
					</button>
				</td>
			</tr>
		</table>
	</g:form>
</div>