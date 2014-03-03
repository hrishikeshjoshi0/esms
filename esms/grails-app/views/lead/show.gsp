<%@ page import="com.esms.model.party.Organization"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'lead.label', default: 'Lead')}" />
<title>Lead::${organizationInstance?.externalId}:${organizationInstance?.name}
</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					
					<template:header heading="${organizationInstance?.name}" 
								subheading="Account Number : ${organizationInstance.externalId} | Sales Status : ${organizationInstance.salesStatus} |
											Assigned To : ${organizationInstance.assignedTo}" />
					
					<!--  Detail View  -->
					<div class="col-md-10 detailView">
						<div class="tab-content">
							<div class="tab-pane active" id="summary">
								<dl class="dl-horizontal">
									<dt>
										<g:message code="organization.isOneTimeCustomer.label"
											default="Is One Time Customer" />
									</dt>
	
									<dd>
										<g:formatBoolean
											boolean="${organizationInstance?.isOneTimeCustomer}"
											true="Yes" false="No" />
									</dd>
	
									<dt>
										<g:message code="organization.reasonForChange.label"
											default="Reason for Change" />
									</dt>
	
									<dd>
										<g:fieldValue bean="${organizationInstance}"
											field="description" />
									</dd>
	
								</dl>
								<g:if test="${organizationInstance?.salesStatus == 'LOST' }">
									${organizationInstance?.lostReason}
								</g:if>
							</div>
							<div class="tab-pane" id="contacts">
								<g:render template="contactList" />
							</div>
							<div class="tab-pane" id="addresses">
								<g:render template="addressList" />
							</div>
							<div class="tab-pane" id="quotes">
								<g:render template="quoteList" />
							</div>
							<div class="tab-pane" id="events">
								<g:render template="eventList" />
							</div>
							<div class="tab-pane" id="lift">
								<g:render template="liftInfo" />
							</div>
						</div>
					</div>
					<!-- Navigation Buttons -->
					<div class="col-md-2">
						<ul class="nav nav-pills nav-stacked tabLinks">
							<li class="active"><a href="#summary">Summary</a></li>
							<li><a href="#contacts">Contacts</a></li>
							<li><a href="#addresses">Addresses</a></li>
							<li><a href="#quotes">Quotes</a></li>
							<li><a href="#events">Events</a></li>
							<li><a href="#lift">Lift Information</a></li>
						</ul>
					</div>
				</div>
			</div>	
		</div>

		<%--<div class="col-md-12">
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
				</richui:tabContents>
			</richui:tabView>
		</div>
	--%>
	</div>
</body>
</html>
