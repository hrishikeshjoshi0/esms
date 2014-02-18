<g:each in="${upcomingRenewals}" var="orderInstance">
	<tr>
				<td>
					${fieldValue(bean: orderInstance, field: "orderNumber")}
				</td>

				<td><g:link controller="organization" action="show"
						id="${orderInstance?.organization?.id}">
						${fieldValue(bean: orderInstance, field: "organization.name")}
					</g:link></td>

				<td>
					${orderInstance?.organization?.activeServiceContract()}
				</td>

				<td><g:formatDate date="${orderInstance.contractToDate}" /></td>

				<td><g:formatNumber type="number" number="${orderInstance?.grandTotal}" /></td>

				<td>
					<g:if test="${orderInstance?.taggedForRenewal == true}">
								${orderInstance?.getRenewalState()}			
					</g:if>
				</td>
				
				<%--<td class="link">
					<div class="btn-group">
						<g:link action="show" id="${orderInstance.id}" controller="order"
								class="lnk ">Show</g:link>
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span></a>			
						<ul class="dropdown-menu pull-right">
							<li>
								<g:link controller="order" action="archive" id="${orderInstance.id}"
									class="lnk archiveLink">Archive</g:link>
							</li>
						</ul>
					</div>	
				</td>
			--%></tr>
</g:each>