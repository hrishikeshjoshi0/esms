
<%@ page import="com.esms.model.party.Address" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h3>
						<g:message code="default.list.label" args="[entityName]" />
					</h3>
				</div>
				
				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
						
							<g:sortableColumn property="address1" title="${message(code: 'address.address1.label', default: 'Address1')}" />
						
							<g:sortableColumn property="addressType" title="${message(code: 'address.addressType.label', default: 'Address Type')}" />
						
							<g:sortableColumn property="address2" title="${message(code: 'address.address2.label', default: 'Address2')}" />
						
							<g:sortableColumn property="buildingName" title="${message(code: 'address.buildingName.label', default: 'Building Name')}" />
						
							<g:sortableColumn property="city" title="${message(code: 'address.city.label', default: 'City')}" />
						
							<g:sortableColumn property="country" title="${message(code: 'address.country.label', default: 'Country')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${addressInstanceList}" var="addressInstance">
						<tr>
						
							<td>${fieldValue(bean: addressInstance, field: "address1")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "addressType")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "address2")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "buildingName")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "city")}</td>
						
							<td>${fieldValue(bean: addressInstance, field: "country")}</td>
						
							<td class="link">
								<g:link action="show" id="${addressInstance.id}" class="btn btn-default btn-xs">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${addressInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
