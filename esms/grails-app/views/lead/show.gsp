<%@ page import="com.esms.model.party.Organization"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'organization.label', default: 'Organization')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					LEAD #
					${organizationInstance?.externalId}
					|
					${organizationInstance?.name}
				</h3>
			</div>

			<div class="table-responsive">
				<table class="table table-striped table-condensed table-bordered">
					<tbody>
						<tr>
							<td><g:message code="organization.externalId.label" default="External Id" /></td>

							<td><g:fieldValue bean="${organizationInstance}" field="externalId" /></td>

							<td><g:message code="organization.assignedTo.label"
									default="Assigned To" /></td>
							
							<td><g:fieldValue bean="${organizationInstance}" field="assignedTo" /></td>		
						</tr>

						<tr>
							<td>
								<g:message code="organization.salesStatus.label"
									default="Sales Status" />
							</td>

							<td>
								<g:fieldValue bean="${organizationInstance}" field="salesStatus" />
							</td>

							<td>
								<g:message code="organization.reasonForChange.label"
									default="Reason for Change" />
							</td>

							<td>
								<g:fieldValue bean="${organizationInstance}" field="description" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<richui:tabView id="tabView">
				<richui:tabLabels>
					<richui:tabLabel selected="true" title="Contacts" />
					<richui:tabLabel title="Lift Information" />
					<richui:tabLabel title="Addresses" />
					<richui:tabLabel title="Quotes" />
					<richui:tabLabel title="Events" />
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
				</richui:tabContents>
			</richui:tabView>
		</div>
	</div>
</body>
</html>
