<%@ page import="com.esms.model.party.Organization"%>
<%@ page import="com.esms.model.party.Address"%>

<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'organization.label', default: 'Leads')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<filterpane:filterPane domain="com.esms.model.party.Organization"
				filterProperties="${['name', 'salesStatus','assignedTo']}"
				titleKey="default.filterPane.header" dialog="yes" visible="n"
				showSortPanel="y" showTitle="y" showButtons="y"
				fullAssociationPathFieldNames="false" />

			<div class="row pad">
				<div class="col-sm-6">
					<!-- Action button -->
					<div class="btn-group">
						<button type="button"
							class="btn btn-default btn-sm btn-flat dropdown-toggle"
							data-toggle="dropdown">
							Action <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li>
								<g:link controller="lead" action="create">
									Create Lead
								</g:link>
							</li>
						</ul>
					</div>

				</div>
			</div>
			<!-- /.row -->

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
							<%--<g:sortableColumn params="${filterParams}"
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
							--%><th></th>
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
								<%--<td>
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
								--%>
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