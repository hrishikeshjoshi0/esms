<%@ page import="com.esms.model.party.Organization" %>
<%@ page import="com.esms.model.party.Address" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'organization.label', default: 'Leads')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			<div class="span12">
				<filterpane:currentCriteria domainBean="com.esms.model.party.Organization" 
                removeImgDir="images" removeImgFile="skin/database_delete.png" fullAssociationPathFieldNames="no"/>
                
				<div class="slidingDiv">
					<div class="page-header">
						<h1>
							Search
						</h1>
					</div>
					<fieldset>
						<filterpane:filterPane domain="com.esms.model.party.Organization"
                                   filterProperties="${['name', 'salesStatus','assignedTo']}"
                                   titleKey="default.filterPane.header"
                                   dialog="false"
                                   visible="y"
                                   showSortPanel="n"
                                   showTitle="n"
                                   fullAssociationPathFieldNames="false"/>
	                 </fieldset>       
				</div>
				
				<div class="page-header">
					<h1>
						<g:message code="default.list.label" args="[entityName]" />
					</h1>
				</div>
				
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<g:sortableColumn property="externalId" title="${message(code: 'organization.externalId.label', default: 'External Id')}" />
							<g:sortableColumn property="name" title="${message(code: 'organization.name.label', default: 'Name')}" />
							<g:sortableColumn property="assignedTo" title="${message(code: 'organization.assignedTo.label', default: 'Assigned To')}" />
							<g:sortableColumn property="addresses.addressType" title="${message(code: 'address.addressType.label', default: 'Address Type')}" />
							<g:sortableColumn property="addresses.buildingName" title="${message(code: 'address.buildingName.label', default: 'Building Name')}" />
							<g:sortableColumn property="addresses.address1" title="${message(code: 'address.address1.label', default: 'Address1')}" />
							<g:sortableColumn property="addresses.address2" title="${message(code: 'address.address2.label', default: 'Address2')}" />
							<g:sortableColumn property="addresses.city" title="${message(code: 'address.city.label', default: 'City')}" />
							<g:sortableColumn property="liftInfo.numberOfLifts" title="${message(code: 'liftInfo.numberOfLifts.label', default: 'No. Of Lists')}" />
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${organizationInstanceList}" var="organization">
								<g:set var="addressInstance" value="${Address.findByAddressTypeAndParty('BILLING',organization) }"/>
								<tr>
									<td>${fieldValue(bean: organization, field: "externalId")}</td>
									<td>${fieldValue(bean: organization, field: "name")}</td>
									<td>${fieldValue(bean: organization, field: "assignedTo")}</td>
									<td>${addressInstance?.addressType}</td>
									<td>${addressInstance?.buildingName}</td>
									<td>${addressInstance?.address1}</td>
									<td>${addressInstance?.address2}</td>
									<td>${addressInstance?.city}</td>
									<td>${fieldValue(bean: organization, field: "liftInfo.numberOfLifts")}</td>
									<td class="link">
										<g:link action="show" id="${organization?.id}" class="btn btn-small">Show &raquo;</g:link>
									</td>
								</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate params="${filterParams}" total="${organizationInstanceList.size()}" />
				</div>
				<br/>
			</div>
		</div>
	</body>
</html>