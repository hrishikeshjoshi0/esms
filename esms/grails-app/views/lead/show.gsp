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

			<g:form>
				<g:hiddenField name="id" value="${organizationInstance?.id}" />
				<div class="form-actions">
					<!-- TODO : HRISHI disabled temporarily -->
					<g:link class="btn btn-default btn-xs" action="edit" id="${organizationInstance?.id}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger btn-xs" type="submit" name="_action_delete">
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
					<%--<a data-toggle="modal" href="#" data-target="#contactModal" role="button" class="btn btn-default btn-xs"> 
						<i class="icon-plus"></i> New Contact
					</a>
					<a data-toggle="modal" href="#" data-target="#addressModal" role="button" class="btn btn-default btn-xs"> 
						<i class="icon-plus"></i> New Address
					</a>
					<a data-toggle="modal" href="#" data-target="#phoneBookModal"
						role="button" class="btn btn-default btn-xs"> <i class="icon-plus"></i> New Phone Book
					</a>
					--%>
					<g:if test="${organizationInstance.salesStatus == 'LEAD'}">
						<g:link controller="organization" action="convertLeadToCustomer"
							id="${organizationInstance?.id}" role="button" class="btn btn-default btn-xs">
							Convert Lead
						</g:link>

						<button class="btn btn-danger btn-xs" type="submit" name="_action_disqualifyLead">
							Disqualify Lead
						</button>
					</g:if>
				</div>
			</g:form>

			<dl class="dl-horizontal" style="margin-left: -30px;">
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
					<g:message code="organization.reasonForChange.label"
						default="Reason for Change" />
				</dt>

				<dd>
					<g:fieldValue bean="${organizationInstance}" field="description" />
				</dd>

			</dl>
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
