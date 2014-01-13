<%@ page import="com.esms.model.party.Organization"%>
<!doctype html>
<html>
<head>
	<meta name="layout" content="bootstrap3">
	<g:set var="entityName" value="${message(code: 'lead.label', default: 'Lead')}" />
	<title>
		Lead::${organizationInstance?.externalId}:${organizationInstance?.name}
	</title>
</head>
<body>

	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Lead ${organizationInstance?.externalId}:${organizationInstance?.name}
				</h3>
			</div>

			<div class="well">
					<%--<g:form>
					<!-- TODO : HRISHI disabled temporarily -->
							<g:link class="btn btn-default btn-sm" action="edit"
								id="${organizationInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							
							<button class="btn btn-default btn-sm" type="submit"
								name="_action_delete">
								<g:message code="default.button.delete.label" default="Delete" />
							</button>
							
							
					</g:form>
					--%>
					<g:hiddenField name="id" value="${organizationInstance?.id}" />
						<div class="btn-group">
							<button type="button" class="btn btn-primary btn-sm dropdown-toggle" data-toggle="dropdown">
							    Create Quote <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<g:if test="${!organizationInstance?.isOneTimeCustomer}">
									<li>
										<a href="<g:createLink controller="quote" action="create" params="[contractQuote:true,type:'CONTRACT',organizationId:organizationInstance?.id]"/>"> 
											New Contract Quote 
										</a>
									</li>
								</g:if>
								<li>
									<a href="<g:createLink controller="quote" action="create" params="[type:'REPAIR',organizationId:organizationInstance?.id]" />"> 
										New Repair Quote
									</a>
								</li>
								<li>
									<a href="<g:createLink controller="quote" action="create" params="[type:'MODERNIZATION',organizationId:organizationInstance?.id]" />"> 
										New Modernization Quote
									</a>
								</li>
								<li>
									<a href="<g:createLink controller="quote" action="create" params="[type:'INSTALLATION',organizationId:organizationInstance?.id]" />"> 
										New Installation Quote
									</a>
								</li>						
							</ul>
						</div>
						
						<g:if test="${organizationInstance.salesStatus == 'LEAD'}">
							<g:link class="btn btn-default btn-sm" controller="organization"
								action="convertLeadToCustomer" id="${organizationInstance?.id}"
								role="button">
								Convert Lead
							</g:link>

							<g:link class="btn btn-default btn-sm" action="disqualifyLead" controller="lead"
								id="${organizationInstance?.id}">
								Disqualify Lead
							</g:link>	
						</g:if>
						
						<g:link class="btn btn-default btn-sm" action="edit" controller="lead"
							id="${organizationInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						
						<g:if test="${organizationInstance?.salesStatus != 'LOST' }">
							<bs3:modalLink id="lostLead"
								href="${createLink(controller:'lead',action:'lostLead',id:organizationInstance?.id)}"
								title="Mark As Lost" />
						</g:if>
			</div>


			<div class="panel panel-default">
				<div class="panel-body">
					<dl class="dl-horizontal">
						<dt>
							<g:message code="organization.externalId.label"
								default="External Id" />
						</dt>

						<dd>
							<g:fieldValue bean="${organizationInstance}" field="externalId" />
						</dd>

						<dt>
							<g:message code="organization.assignedTo.label"
								default="Assigned To" />
						</dt>

						<dd>
							<g:fieldValue bean="${organizationInstance}" field="assignedTo" />
						</dd>

						<dt>
							<g:message code="organization.salesStatus.label"
								default="Sales Status" />
						</dt>

						<dd>
							<g:fieldValue bean="${organizationInstance}" field="salesStatus" />
						</dd>
						
						<dt>
							<g:message code="organization.isOneTimeCustomer.label"
								default="Is One Time Customer" />
						</dt>

						<dd>
							<g:formatBoolean boolean="${organizationInstance?.isOneTimeCustomer}" true="Yes" false="No"/>
						</dd>

						<dt>
							<g:message code="organization.reasonForChange.label"
								default="Reason for Change" />
						</dt>

						<dd>
							<g:fieldValue bean="${organizationInstance}" field="description" />
						</dd>

					</dl>
				</div>
			</div>
		</div>

		<div class="col-md-12">
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Contacts" />
					<richui:tabLabel title="Lift Information" />
					<richui:tabLabel title="Addresses" />
					<richui:tabLabel title="Quotes" />
					<richui:tabLabel title="Events" />
					<g:if test="${organizationInstance?.salesStatus == 'LOST' }">
						<richui:tabLabel title="Lost Reason" />
					</g:if>
				</richui:tabLabels>

				<richui:tabContents>
					<richui:tabContent>
						<g:render template="contactList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="liftInfo" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="addressList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="quoteList" />
					</richui:tabContent>

					<richui:tabContent>
						<g:render template="eventList" />
					</richui:tabContent>
					
					<g:if test="${organizationInstance?.salesStatus == 'LOST' }">
						<richui:tabContent>
							${organizationInstance?.lostReason}
						</richui:tabContent>
					</g:if>
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>
</body>
</html>
