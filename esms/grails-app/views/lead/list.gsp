<%@ page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.party.Address"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'organization.label', default: 'Leads')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<bs3:pageHeader pageHeaderLabel="${message(code: 'default.list.label',args:['Leads'])}" />

			<filterpane:filterPane domain="com.esms.model.party.Organization"
				filterProperties="${['name', 'salesStatus','assignedTo']}"
				titleKey="default.filterPane.header" dialog="yes" visible="n"
				showSortPanel="y" showTitle="y" showButtons="y"
				fullAssociationPathFieldNames="false" />

			<div class="table-responsive">
				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
							<g:sortableColumn params="${filterParams}" property="externalId"
								title="${message(code: 'organization.externalId.label', default: 'External Id')}" />
							<g:sortableColumn params="${filterParams}" property="name"
								title="${message(code: 'organization.name.label', default: 'Name')}" />
							<g:sortableColumn params="${filterParams}" property="assignedTo"
								title="${message(code: 'organization.assignedTo.label', default: 'Assigned To')}" />
							<g:sortableColumn params="${filterParams}"
								property="addresses.addressType"
								title="${message(code: 'address.addressType.label', default: 'Address Type')}" />
							<g:sortableColumn params="${filterParams}"
								property="addresses.buildingName"
								title="${message(code: 'address.buildingName.label', default: 'Building Name')}" />
							<g:sortableColumn params="${filterParams}"
								property="addresses.address1"
								title="${message(code: 'address.address1.label', default: 'Address1')}" />
							<g:sortableColumn params="${filterParams}"
								property="addresses.address2"
								title="${message(code: 'address.address2.label', default: 'Address2')}" />
							<g:sortableColumn params="${filterParams}"
								property="addresses.city"
								title="${message(code: 'address.city.label', default: 'City')}" />
							<g:sortableColumn params="${filterParams}"
								property="liftInfo.numberOfLifts"
								title="${message(code: 'liftInfo.numberOfLifts.label', default: 'No. Of Lists')}" />
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${organizationInstanceList}" var="organization">
							<g:set var="addressInstance"
								value="${Address.findByAddressTypeAndParty('BILLING',organization) }" />
							<tr>
								<td>
									${fieldValue(bean: organization, field: "externalId")}
								</td>
								<td>
									${fieldValue(bean: organization, field: "name")}
								</td>
								<td>
									${fieldValue(bean: organization, field: "assignedTo")}
								</td>
								<td>
									${addressInstance?.addressType}
								</td>
								<td>
									${addressInstance?.buildingName}
								</td>
								<td>
									${addressInstance?.address1}
								</td>
								<td>
									${addressInstance?.address2}
								</td>
								<td>
									${addressInstance?.city}
								</td>
								<td>
									${fieldValue(bean: organization, field: "liftInfo.numberOfLifts")}
								</td>
								<td class="link"><g:link action="show"
										id="${organization?.id}" class="lnk ">Show &raquo;</g:link>
								</td>
							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate total="${organizationInstanceTotal}"
						params="${filterParams}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>